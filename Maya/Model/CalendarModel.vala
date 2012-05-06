//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

namespace Maya.Model {

public class CalendarModel : Object {

    /* The data_range is the range of dates for which this model is storing
     * data. The month_range is a subset of this range corresponding to the
     * calendar month that is being focused on. In summary:
     *
     * data_range.first <= month_range.first < month_range.last <= data_range.last
     *
     * There is no way to set the ranges publicly. They can only be modified by
     * changing one of the following properties: month_start, num_weeks, and
     * week_starts_on.
    */
    public Util.DateRange data_range { get; private set; }
    public Util.DateRange month_range { get; private set; }

    /* The first day of the month */
    public DateTime month_start { get; set; }

    /* The number of weeks to show in this model */
    public int num_weeks { get; private set; default = 6; }

    /* The start of week, ie. Monday=1 or Sunday=7 */
    public Settings.Weekday week_starts_on { get; set; }

    /* Notifies when events are added, updated, or removed */
    public signal void events_added (E.Source source, Gee.Collection<E.CalComponent> events);
    public signal void events_updated (E.Source source, Gee.Collection<E.CalComponent> events);
    public signal void events_removed (E.Source source, Gee.Collection<E.CalComponent> events);

    /* The month_start, num_weeks, or week_starts_on have been changed */
    public signal void parameters_changed ();

    Gee.Map<E.Source, E.CalClient> source_client;
    Gee.Map<E.Source, E.CalClientView> source_view;
    Gee.Map<E.Source, Gee.Map<string, E.CalComponent>> source_events;

    public CalendarModel (Model.SourceManager source_model, Settings.Weekday week_starts_on) {

        this.month_start = Util.get_start_of_month ();
        this.week_starts_on = week_starts_on;

        compute_ranges ();

        source_client = new Gee.HashMap<E.Source, E.CalClient> (
            (HashFunc) Util.source_hash_func,
            (EqualFunc) Util.source_equal_func,
            null);

        source_events = new Gee.HashMap<E.Source, Gee.Map<string, E.CalComponent>> (
            (HashFunc) Util.source_hash_func,
            (EqualFunc) Util.source_equal_func,
            null);

        source_view = new Gee.HashMap<E.Source, E.CalClientView> (
            (HashFunc) Util.source_hash_func,
            (EqualFunc) Util.source_equal_func,
            null);

        // Signals

        source_model.status_changed.connect (on_source_status_changed);
        source_model.source_added.connect (on_source_added);
        source_model.source_removed.connect (on_source_removed);

        notify["month-start"].connect (on_parameter_changed);

        // Add sources

        foreach (var source in source_model.get_enabled_sources()) {
            add_source (source);
        }

    }

    //--- Public Methods ---//

    public void add_event (E.Source source, E.CalComponent event) {

        unowned iCal.icalcomponent comp = event.get_icalcomponent();

        debug (@"Adding event '$(comp.get_uid())'");

        var client = source_client [source];
        
        client.create_object (comp, null, (obj, results) =>  {

            bool status = false;
            string uid;
            
            try {
                status = client.create_object.end (results, out uid);
            } catch (Error e) {
                warning (e.message);
            }

            // TODO: handle error more gracefully
            assert (status==true);
        });
    }

    public void update_event (E.Source source, E.CalComponent event, E.CalObjModType mod_type) {

        unowned iCal.icalcomponent comp = event.get_icalcomponent();

        debug (@"Updating event '$(comp.get_uid())' [mod_type=$(mod_type)]");

        var client = source_client [source];
        client.modify_object.begin (comp, mod_type, null, (obj, results) =>  {

            bool status = false;
            
            try {
                status = client.modify_object.end (results);
            } catch (Error e) {
                warning (e.message);
            }

            // TODO: handle error more gracefully
            assert (status==true);
        });
    }

    public void remove_event (E.Source source, E.CalComponent event, E.CalObjModType mod_type) {

        unowned iCal.icalcomponent comp = event.get_icalcomponent();

        string uid = comp.get_uid ();
        string? rid = event.has_recurrences() ? null : event.get_recurid_as_string();

        debug (@"Removing event '$uid'");

        var client = source_client [source];
        client.remove_object.begin (uid, rid, mod_type, null, (obj, results) =>  {

            bool status = false;

            try {
                status = client.remove_object.end (results);
            } catch (Error e) {
                warning (e.message);
            }

            // TODO: handle error more gracefully
            assert (status==true);
        });
    }

    //--- Helper Methods ---//

    void compute_ranges () {

        var month_end = month_start.add_full (0, 1, -1);
        month_range = new Util.DateRange (month_start, month_end);

        int dow = month_start.get_day_of_week(); 
        int wso = (int) week_starts_on;
        int offset = 0;

        if (wso < dow)
            offset = dow - wso;
        else if (wso > dow)
            offset = 7 + dow - wso;

        var data_range_first = month_start.add_days (-offset);

        dow = month_end.get_day_of_week(); 
        wso = (int) (week_starts_on + 6);

        // WSO must be between 1 and 7
        if (wso > 7)
            wso = wso - 7;

        offset = 0;

        if (wso < dow)
            offset = 7 + wso - dow;
        else if (wso > dow)
            offset = wso - dow;

        var data_range_last = month_end.add_days(offset);

        data_range = new Util.DateRange (data_range_first, data_range_last);
        num_weeks = data_range.to_list ().size / 7;

        debug(@"Date ranges: ($data_range_first <= $month_start < $month_end <= $data_range_last)");
    }

    public void load_all_sources () {

        foreach (var source in source_client.keys)
            load_source (source);
    }

    void load_source (E.Source source) {

        // create empty source-event map

        Gee.Map<string, E.CalComponent> events = new Gee.HashMap<string, E.CalComponent> (
            (HashFunc) Util.string_hash_func,
            (EqualFunc) Util.string_equal_func,
            (EqualFunc) Util.calcomponent_equal_func);

        source_events.set (source, events);
        
        // query client view

        var iso_first = E.isodate_from_time_t((ulong) data_range.first.to_unix());
        var iso_last = E.isodate_from_time_t((ulong) data_range.last.to_unix());

        var query = @"(occur-in-time-range? (make-time \"$iso_first\") (make-time \"$iso_last\"))";

        var client = source_client [source];

        debug("Getting client-view for source '%s'", source.peek_name());

        client.get_view.begin (query, null, (obj, results) => {

            var view = on_client_view_received (results, source, client);

            view.objects_added.connect ((objects) => on_objects_added (source, client, objects));
            view.objects_removed.connect ((objects) => on_objects_removed (source, client, objects));
            view.objects_modified.connect ((objects) => on_objects_modified (source, client, objects));

            try {
                view.start ();
            } catch (Error e) {
                warning (e.message);
            }

            source_view.set (source, view);
        });
    }

    void add_source (E.Source source) {

        debug("Adding source '%s'", source.peek_name());
        try {
            var client = new E.CalClient(source, E.CalClientSourceType.EVENTS);
            client.open_sync(false, null);
            source_client.set (source, client);

            load_source (source);
        } catch (Error e) {
            warning (e.message);
        }
    }

    void remove_source (E.Source source) {

        assert (source_view.has_key (source));
        var current_view = source_view [source];
        
        try {
            current_view.stop();
        } catch (Error e) {
            warning (e.message);
        }
        source_view.unset (source);

        var client = source_client [source];
        client.cancel_all ();
        source_client.unset (source);

        var events = source_events [source].values.read_only_view;
        events_removed (source, events);
        source_events.unset (source);

    }

    void debug_event (E.Source source, E.CalComponent event) {

        unowned iCal.icalcomponent comp = event.get_icalcomponent ();
        debug (@"Event ['$(comp.get_summary())', $(source.peek_name()), $(comp.get_uid()))]");
    }

    //--- Signal Handlers ---//

    void on_parameter_changed () {

        compute_ranges ();
        parameters_changed ();

        load_all_sources ();
    }

    /*void on_event_added (AsyncResult results, E.Source source, E.CalClient client) {

        try {

            string uid;
            bool status = client.create_object.end (results, out uid);
            assert (status==true);

            warning ("Created new event '%s' in source '%s'", uid, source.peek_name());

        } catch (Error e) {

            warning ("Error adding new event to source '%s': %s", source.peek_name(), e.message);
        }

    }*/

    void on_source_status_changed (E.Source source, bool enabled) {

        if (enabled)
            add_source (source);
        else
            remove_source (source);
    }

    void on_source_added (E.SourceGroup group, E.Source source) {

        add_source (source);
    }

    void on_source_removed (E.SourceGroup group, E.Source source) {
        
        remove_source (source);
    }

    E.CalClientView on_client_view_received (AsyncResult results, E.Source source, E.CalClient client) {

        E.CalClientView view;

        try {

            debug (@"Received client-view for source '%s'", source.peek_name());

            bool status = client.get_view.end (results, out view);
            assert (status==true);

        } catch (Error e) {

            critical ("Error loading client-view from source '%s': %s", source.peek_name(), e.message);
        }

        return view;
    }

    void on_objects_added (E.Source source, E.CalClient client, SList<weak iCal.icalcomponent> objects) {

        debug (@"Received $(objects.length()) added event(s) for source '%s'", source.peek_name());

        Gee.Map<string, E.CalComponent> events = source_events [source];

        Gee.ArrayList<E.CalComponent> added_events = new Gee.ArrayList<E.CalComponent> (
            (EqualFunc) Util.calcomponent_equal_func);

        foreach (var comp in objects) {

            var event = new E.CalComponent ();
            iCal.icalcomponent comp_clone = new iCal.icalcomponent.clone (comp);
            event.set_icalcomponent ((owned) comp_clone);

            debug_event (source, event);

            string uid = comp.get_uid();

            events.set (uid, event);
            added_events.add (event);
        };

        events_added (source, added_events.read_only_view);
    }

    void on_objects_modified (E.Source source, E.CalClient client, SList<weak iCal.icalcomponent> objects) {
        
        debug (@"Received $(objects.length()) modified event(s) for source '%s'", source.peek_name());
        
        Gee.Collection<E.CalComponent> updated_events = new Gee.ArrayList<E.CalComponent> (
            (EqualFunc) Util.calcomponent_equal_func);

        foreach (var comp in objects) {

            string uid = comp.get_uid();

            E.CalComponent event = source_events [source] [uid];
            updated_events.add (event);

            debug_event (source, event);
        };

        events_updated (source, updated_events.read_only_view);
    }

    void on_objects_removed (E.Source source, E.CalClient client, SList<weak E.CalComponentId?> cids) {

        debug (@"Received $(cids.length()) removed event(s) for source '%s'", source.peek_name());

        var events = source_events [source];
        Gee.Collection<E.CalComponent> removed_events = new Gee.ArrayList<E.CalComponent> (
            (EqualFunc) Util.calcomponent_equal_func);

        foreach (unowned E.CalComponentId? cid in cids) {

            assert (cid != null);

            E.CalComponent event = events [cid.uid];
            removed_events.add (event);

            debug_event (source, event);
        }
        events_removed (source, removed_events.read_only_view);
    }
}

}