/* libecalendar-1.2.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "E", gir_namespace = "ECalendar", gir_version = "1.2", lower_case_cprefix = "e_")]
namespace E {
	[CCode (cheader_filename = "libecal/libecal.h", type_id = "e_cal_get_type ()")]
	public class Cal : GLib.Object {
		public static void marshal_VOID__ENUM_ENUM (GLib.Closure closure, GLib.Value return_value, uint n_param_values, GLib.Value param_values, void* invocation_hint, void* marshal_data);
		public static void marshal_VOID__STRING_UINT (GLib.Closure closure, GLib.Value return_value, uint n_param_values, GLib.Value param_values, void* invocation_hint, void* marshal_data);
		public static void marshal_VOID__UINT_STRING (GLib.Closure closure, GLib.Value return_value, uint n_param_values, GLib.Value param_values, void* invocation_hint, void* marshal_data);
		public static string system_timezone_get_location ();
		public static string util_get_system_timezone_location ();
		public static int util_priority_from_string (string string);
		public static unowned string util_priority_to_string (int priority);
		public virtual signal void backend_died ();
		public virtual signal void backend_error (string message);
		public virtual signal void cal_opened (int status);
		public virtual signal void cal_opened_ex (long error);
	}
	[CCode (cheader_filename = "libecal/libecal.h", type_id = "e_cal_client_get_type ()")]
	public class CalClient : E.Client {
		[CCode (has_construct_function = false)]
		public CalClient (E.Source source, E.CalClientSourceType source_type) throws GLib.Error;
		public virtual async void connect (E.Source source, E.CalClientSourceType source_type, GLib.Cancellable? cancellable) throws GLib.Error;
		[CCode (has_construct_function = false, cname = "e_cal_client_connect_sync")]
		public CalClient.connect_sync (E.Source source, E.CalClientSourceType source_type, GLib.Cancellable? cancellable = null) throws GLib.Error;
		public async bool add_timezone (iCal.TimeZone zone, GLib.Cancellable cancellable) throws GLib.Error;
		public bool add_timezone_sync (iCal.TimeZone zone, GLib.Cancellable cancellable) throws GLib.Error;
		public bool check_one_alarm_only ();
		public bool check_organizer_must_accept ();
		public bool check_organizer_must_attend ();
		public bool check_recurrences_no_master ();
		public bool check_save_schedules ();
		public static bool check_timezones (iCal.Component comp, GLib.List comps, GLib.Callback tzlookup, void* ecalclient, GLib.Cancellable cancellable) throws GLib.Error;
		public async bool create_object (iCal.Component icalcomp, GLib.Cancellable? cancellable, out string uid) throws GLib.Error;
		public bool create_object_sync (iCal.Component icalcomp, out string uid, GLib.Cancellable? cancellable) throws GLib.Error;
		[CCode (has_construct_function = false)]
		public CalClient.@default (E.CalClientSourceType source_type) throws GLib.Error;
		public async bool discard_alarm (string uid, string rid, string auid, GLib.Cancellable? cancellable) throws GLib.Error;
		public bool discard_alarm_sync (string uid, string rid, string auid, GLib.Cancellable? cancellable) throws GLib.Error;
		public static GLib.Error error_create (E.CalClientError code, string custom_msg);
		public static GLib.Quark error_quark ();
		public static unowned string error_to_string (E.CalClientError code);
		public static void free_ecalcomp_slist (GLib.SList<E.CalComponent> ecalcomps);
		public static void free_icalcomp_slist (GLib.SList<iCal.Component> icalcomps);
		[CCode (has_construct_function = false)]
		public CalClient.from_uri (string uri, E.CalClientSourceType source_type) throws GLib.Error;
		public void generate_instances (ulong start, ulong end, GLib.Cancellable? cancellable, E.CalRecurInstanceFn cb, void* cb_data, owned GLib.DestroyNotify? destroy_cb_data);
		public void generate_instances_for_object (iCal.Component icalcomp, ulong start, ulong end, GLib.Cancellable? cancellable, E.CalRecurInstanceFn cb, void* cb_data, owned GLib.DestroyNotify? destroy_cb_data);
		public void generate_instances_for_object_sync (iCal.Component icalcomp, ulong start, ulong end, E.CalRecurInstanceFn cb, void* cb_data);
		public void generate_instances_sync (ulong start, ulong end, E.CalRecurInstanceFn cb, void* cb_data);
		public async bool get_attachment_uris (string uid, string rid, GLib.Cancellable? cancellable, out GLib.SList attachment_uris) throws GLib.Error;
		public bool get_attachment_uris_sync (string uid, string rid, GLib.SList attachment_uris, GLib.Cancellable? cancellable) throws GLib.Error;
		public unowned string get_component_as_string (iCal.Component icalcomp);
		public async bool get_default_object (GLib.Cancellable? cancellable, out iCal.Component icalcomp) throws GLib.Error;
		public bool get_default_object_sync (out unowned iCal.Component icalcomp, GLib.Cancellable? cancellable) throws GLib.Error;
		public unowned iCal.TimeZone get_default_timezone ();
		public async bool get_free_busy (ulong start, ulong end, GLib.SList users, GLib.Cancellable? cancellable) throws GLib.Error;
		public bool get_free_busy_sync (ulong start, ulong end, GLib.SList users, GLib.Cancellable? cancellable) throws GLib.Error;
		public unowned string get_local_attachment_store ();
		public async bool get_object (string uid, string rid, GLib.Cancellable? cancellable, out iCal.Component icalcomp) throws GLib.Error;
		public async bool get_object_list (string sexp, GLib.Cancellable? cancellable, out GLib.SList<iCal.Component> icalcomps) throws GLib.Error;
		public async bool get_object_list_as_comps (string sexp, GLib.Cancellable? cancellable, out GLib.SList<E.CalComponent> ecalcomps) throws GLib.Error;
		public bool get_object_list_as_comps_sync (string sexp, out GLib.SList<E.CalComponent> ecalcomps, GLib.Cancellable? cancellable) throws GLib.Error;
		public bool get_object_list_sync (string sexp, out GLib.SList<iCal.Component> icalcomps, GLib.Cancellable? cancellable) throws GLib.Error;
		public bool get_object_sync (string uid, string rid, out iCal.Component icalcomp, GLib.Cancellable? cancellable) throws GLib.Error;
		public async bool get_objects_for_uid (string uid, GLib.Cancellable? cancellable, out GLib.SList<E.CalComponent> ecalcomps) throws GLib.Error;
		public bool get_objects_for_uid_sync (string uid, out GLib.SList<E.CalComponent> ecalcomps, GLib.Cancellable? cancellable) throws GLib.Error;
		public E.CalClientSourceType get_source_type ();
		public async bool get_timezone (string tzid, GLib.Cancellable? cancellable, out iCal.TimeZone zone) throws GLib.Error;
		public bool get_timezone_sync (string tzid, out iCal.TimeZone zone, GLib.Cancellable? cancellable) throws GLib.Error;
		public async bool get_view (string sexp, GLib.Cancellable? cancellable, out E.CalClientView view) throws GLib.Error;
		public bool get_view_sync (string sexp, out E.CalClientView view, GLib.Cancellable? cancellable) throws GLib.Error;
		public async bool modify_object (iCal.Component icalcomp, E.CalObjModType mod, GLib.Cancellable? cancellable) throws GLib.Error;
		public bool modify_object_sync (iCal.Component icalcomp, E.CalObjModType mod, GLib.Cancellable? cancellable) throws GLib.Error;
		public async bool receive_objects (iCal.Component icalcomp, GLib.Cancellable? cancellable) throws GLib.Error;
		public bool receive_objects_sync (iCal.Component icalcomp, GLib.Cancellable? cancellable) throws GLib.Error;
		public async bool remove_object (string uid, string rid, E.CalObjModType mod, GLib.Cancellable? cancellable) throws GLib.Error;
		public bool remove_object_sync (string uid, string rid, E.CalObjModType mod, GLib.Cancellable? cancellable) throws GLib.Error;
		public static unowned iCal.TimeZone resolve_tzid_cb (string tzid, void* data);
		public async bool send_objects (iCal.Component icalcomp, GLib.Cancellable? cancellable, out GLib.SList<string> users, out iCal.Component modified_icalcomp) throws GLib.Error;
		public bool send_objects_sync (iCal.Component icalcomp, out GLib.SList<string> users, out iCal.Component modified_icalcomp, GLib.Cancellable? cancellable) throws GLib.Error;
		public bool set_default () throws GLib.Error;
		public static bool set_default_source (E.Source source, E.CalClientSourceType source_type) throws GLib.Error;
		public void set_default_timezone (iCal.TimeZone zone);
		[CCode (has_construct_function = false)]
		public CalClient.system (E.CalClientSourceType source_type) throws GLib.Error;
		public static unowned iCal.TimeZone tzlookup (string tzid, void* ecalclient, GLib.Cancellable cancellable) throws GLib.Error;
		public static unowned iCal.TimeZone tzlookup_icomp (string tzid, void* custom, GLib.Cancellable cancellable) throws GLib.Error;
		public virtual signal void free_busy_data (void* free_busy_ecalcomps);
	}
	[CCode (cheader_filename = "libecal/libecal.h", type_id = "e_cal_client_view_get_type ()")]
	public class CalClientView : GLib.Object {
		[CCode (has_construct_function = false)]
		protected CalClientView ();
		public bool is_running ();
		public void set_fields_of_interest (GLib.SList<string>? fields_of_interest) throws GLib.Error;
		public void set_flags (E.CalClientViewFlags flags) throws GLib.Error;
		public void start () throws GLib.Error;
		public void stop () throws GLib.Error;
		public E.CalClient client { get; construct; }
		[NoAccessorMethod]
		public void* view { get; construct; }
		public virtual signal void complete (GLib.Error error);
		public virtual signal void objects_added (GLib.SList<weak iCal.Component> objects);
		public virtual signal void objects_modified (GLib.SList<weak iCal.Component> objects);
		public virtual signal void objects_removed (GLib.SList<weak E.CalComponentId?> uids);
		public virtual signal void progress (uint percent, string message);
	}
	[CCode (cheader_filename = "libecal/libecal.h", type_id = "e_cal_component_get_type ()")]
	public class CalComponent : GLib.Object {
		[CCode (has_construct_function = false)]
		public CalComponent ();
		public void abort_sequence ();
		public void add_alarm (E.CalComponentAlarm alarm);
		public unowned E.CalComponent clone ();
		public void commit_sequence ();
		public bool event_dates_match (E.CalComponent comp2);
		public static void free_attendee_list (GLib.SList<E.CalComponentAttendee> attendee_list);
		public static void free_categories_list (GLib.SList<string> categ_list);
		public static void free_datetime (E.CalComponentDateTime dt);
		public static void free_exdate_list (GLib.SList exdate_list);
		public static void free_geo (iCal.GeoType geo);
		public static void free_TimeType (iCal.TimeType t);
		public static void free_id (E.CalComponentId id);
		public static void free_percent (int percent);
		public static void free_period_list (GLib.SList period_list);
		public static void free_priority (int priority);
		public static void free_range (E.CalComponentRange range);
		public static void free_recur_list (GLib.SList<E.CalComponentRange> recur_list);
		public static void free_sequence (int sequence);
		public static void free_text_list (GLib.SList<E.CalComponentText> text_list);
		[CCode (has_construct_function = false)]
		public CalComponent.from_string (string calobj);
		public static string gen_uid ();
		public E.CalComponentAlarm get_alarm (string auid);
		public GLib.List<string> get_alarm_uids ();
		public string get_as_string ();
		public void get_attachment_list (out GLib.SList<string> attachment_list);
		public void get_attendee_list (out GLib.SList<E.CalComponentAttendee?> attendee_list);
		public void get_categories (out string categories);
		public void get_categories_list (out GLib.SList<string> categ_list);
		public void get_classification (out E.CalComponentClassification classif);
		public void get_comment_list (out GLib.SList<E.CalComponentText> text_list);
		public void get_completed (out iCal.TimeType t);
		public void get_contact_list (out GLib.SList<E.CalComponentText> text_list);
		public void get_created (out iCal.TimeType t);
		public void get_description_list (out GLib.SList<E.CalComponentText> text_list);
		public void get_dtend (out E.CalComponentDateTime dt);
		public void get_dtstamp (out iCal.TimeType t);
		public void get_dtstart (out E.CalComponentDateTime dt);
		public void get_due (out E.CalComponentDateTime dt);
		public void get_exdate_list (out GLib.SList<E.CalComponentDateTime> exdate_list);
		public void get_exrule_list (out GLib.SList<E.CalComponentRange> recur_list);
		public void get_exrule_property_list (out GLib.SList<E.CalComponentRange> recur_list);
		public void get_geo (out iCal.GeoType geo);
		public unowned iCal.Component get_icalcomponent ();
		public E.CalComponentId get_id ();
		public void get_last_modified (out iCal.TimeType t);
		public void get_location (out string location);
		public int get_num_attachments ();
		public void get_organizer (out E.CalComponentOrganizer organizer);
		public void get_percent (out int percent);
		public int get_percent_as_int ();
		public void get_priority (out int priority);
		public void get_rdate_list (out GLib.SList<E.CalComponentPeriod> period_list);
		public void get_recurid (out E.CalComponentRange recur_id);
		public string get_recurid_as_string ();
		public void get_rrule_list (out GLib.SList<E.CalComponentRange> recur_list);
		public void get_rrule_property_list (out GLib.SList<E.CalComponentRange> recur_list);
		public void get_sequence (out int sequence);
		public void get_status (out iCal.PropertyStatus status);
		public void get_summary (out E.CalComponentText summary);
		public void get_transparency (out E.CalComponentTransparency transp);
		public void get_uid (out string uid);
		public void get_url (out string url);
		public E.CalComponentVType get_vtype ();
		public bool has_alarms ();
		public bool has_attachments ();
		public bool has_attendees ();
		public bool has_exceptions ();
		public bool has_exdates ();
		public bool has_exrules ();
		public bool has_organizer ();
		public bool has_rdates ();
		public bool has_recurrences ();
		public bool has_rrules ();
		public bool has_simple_recurrence ();
		public bool is_instance ();
		public void remove_alarm (string auid);
		public void remove_all_alarms ();
		public void rescan ();
		public void set_attachment_list (GLib.SList<string> attachment_list);
		public void set_attendee_list (GLib.SList<E.CalComponentAttendee> attendee_list);
		public void set_categories (string categories);
		public void set_categories_list (GLib.SList<string> categ_list);
		public void set_classification (E.CalComponentClassification classif);
		public void set_comment_list (GLib.SList<E.CalComponentText> text_list);
		public void set_completed (iCal.TimeType t);
		public void set_contact_list (GLib.SList<E.CalComponentText> text_list);
		public void set_created (iCal.TimeType t);
		public void set_description_list (GLib.SList<E.CalComponentText> text_list);
		public void set_dtend (E.CalComponentDateTime dt);
		public void set_dtstamp (iCal.TimeType t);
		public void set_dtstart (E.CalComponentDateTime dt);
		public void set_due (E.CalComponentDateTime dt);
		public void set_exdate_list (GLib.SList exdate_list);
		public void set_exrule_list (GLib.SList<E.CalComponentRange> recur_list);
		public void set_geo (iCal.GeoType* geo);
		public bool set_icalcomponent (owned iCal.Component icalcomp);
		public void set_last_modified (iCal.TimeType t);
		public void set_location (string location);
		public void set_new_vtype (E.CalComponentVType type);
		public void set_organizer (E.CalComponentOrganizer organizer);
		public void set_percent (int percent);
		public void set_percent_as_int (int percent);
		public void set_priority (int priority);
		public void set_rdate_list (GLib.SList<E.CalComponentPeriod> period_list);
		public void set_recurid (E.CalComponentRange recur_id);
		public void set_rrule_list (GLib.SList<E.CalComponentRange> recur_list);
		public void set_sequence (int sequence);
		public void set_status (iCal.PropertyStatus status);
		public void set_summary (E.CalComponentText summary);
		public void set_transparency (E.CalComponentTransparency transp);
		public void set_uid (string uid);
		public void set_url (string url);
		public void strip_errors ();
	}
	[CCode (cheader_filename = "libecal/libecal.h", free_function = "e_cal_component_alarm_free")]
	[Compact]
	public class CalComponentAlarm {
		[CCode (has_construct_function = false)]
		public CalComponentAlarm ();
		public E.CalComponentAlarm clone ();
		public void get_action (out E.CalComponentAlarmAction action);
		public void get_attach (out iCal.Attach attach);
		public void get_attendee_list (out GLib.SList<E.CalComponentAttendee> attendee_list);
		public void get_description (out E.CalComponentText description);
		public iCal.Component get_icalcomponent ();
		public void get_repeat (out E.CalComponentAlarmRepeat repeat);
		public void get_trigger (out E.CalComponentAlarmTrigger trigger);
		public unowned string get_uid ();
		public bool has_attendees ();
		public void set_action (E.CalComponentAlarmAction action);
		public void set_attach (iCal.Attach attach);
		public void set_attendee_list (GLib.SList<E.CalComponentAttendee> attendee_list);
		public void set_description (E.CalComponentText description);
		public void set_repeat (E.CalComponentAlarmRepeat repeat);
		public void set_trigger (E.CalComponentAlarmTrigger trigger);
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	public struct CalChange {
		public weak E.CalComponent comp;
		public E.CalChangeType type;
	}
	[CCode (cheader_filename = "libecal/libecal.h", type_id = "e_cal_view_get_type ()")]
	public class CalView : GLib.Object {
		[CCode (has_construct_function = false)]
		protected CalView ();
		[Deprecated (since = "3.2")]
		public void start ();
		[Deprecated (since = "3.2")]
		public void stop ();
		[NoAccessorMethod]
		public E.Cal client { owned get; construct; }
		[NoAccessorMethod]
		public void* view { get; construct; }
		public signal void objects_added (GLib.List<long> objects);
		public signal void objects_modified (GLib.List<long> objects);
		public signal void objects_removed (GLib.List<E.CalComponentId> objects);
		public virtual signal void view_complete (uint status, string error_msg);
		public virtual signal void view_done (int status);
		public virtual signal void view_progress (string message, uint percent);
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	public struct CalComponentAlarmInstance {
		public weak string auid;
		public time_t trigger;
		public time_t occur_start;
		public time_t occur_end;
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	public struct CalComponentAlarmRepeat {
		public int repetitions;
		public iCal.DurationType duration;
	}
	[SimpleType]
	[CCode (cheader_filename = "libecal/libecal.h")]
	public struct CalComponentAlarmTrigger {
		public E.CalComponentAlarmTriggerType type;
		[CCode(cname = "u.rel_duration")]
		public iCal.DurationType rel_duration;
		[CCode(cname = "u.abs_time")]
		public iCal.TimeType abs_time;
	}
	[CCode (cheader_filename = "libecal/libecal.h", free_function = "e_cal_component_alarms_free")]
	public struct CalComponentAlarms {
		public weak E.CalComponent comp;
		[CCode (cheader_filename = "libecal/libecal.h")]
		public weak GLib.SList<E.CalComponentAlarmInstance> alarms;
		public void free ();
	}
	[CCode (cheader_filename = "libecal/libecal.h", has_type_id = false)]
	public struct CalComponentAttendee {
		public weak string value;
		public weak string member;
		public iCal.ParameterCutype cutype;
		public iCal.ParameterRole role;
		public iCal.ParameterPartStat status;
		public bool rsvp;
		public weak string delto;
		public weak string delfrom;
		public weak string sentby;
		public weak string cn;
		public weak string language;
	}
	[CCode (cheader_filename = "libecal/libecal.h", free_function = "e_cal_component_free_datetime")]
	public struct CalComponentDateTime {
		public iCal.TimeType* value;
		public weak string tzid;
	}
	[CCode (cheader_filename = "libecal/libecal.h", free_function = "e_cal_component_free_id", copy_function = "e_cal_component_id_copy")]
	public struct CalComponentId {
		public weak string uid;
		public weak string rid;
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	public struct CalComponentOrganizer {
		public weak string value;
		public weak string sentby;
		public weak string cn;
		public weak string language;
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	public struct CalComponentPeriod {
		public E.CalComponentPeriodType type;
		[CCode (cheader_filename = "libecal/libecal.h")]
		public iCal.TimeType start;
		[CCode(cname = "u.duration")]
		public iCal.DurationType duration;
		[CCode(cname = "u.end")]
		public iCal.TimeType end;
	}
	[CCode (cheader_filename = "libecal/libecal.h", free_function = "e_cal_component_free_range")]
	public struct CalComponentRange {
		public E.CalComponentRangeType type;
		public E.CalComponentDateTime datetime;
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	public struct CalComponentText {
		public weak string value;
		public weak string altrep;
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	public struct CalObjInstance {
		public weak string uid;
		public ulong start;
		public ulong end;
		[CCode (cname = "cal_obj_instance_list_free")]
		public static void list_free (GLib.List list);
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_CHANGE_", has_type_id = false)]
	public enum CalChangeType {
		ADDED,
		MODIFIED,
		DELETED
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_CLIENT_ERROR_", has_type_id = false)]
	public enum CalClientError {
		NO_SUCH_CALENDAR,
		OBJECT_NOT_FOUND,
		INVALID_OBJECT,
		UNKNOWN_USER,
		OBJECT_ID_ALREADY_EXISTS,
		INVALID_RANGE
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_CLIENT_SOURCE_TYPE_", has_type_id = false)]
	public enum CalClientSourceType {
		EVENTS,
		TASKS,
		MEMOS,
		LAST
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "")]
	public enum CalClientSourceTypeEnum {
		Events,
		Tasks,
		Memos,
		Invalid
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_COMPONENT_ALARM_", has_type_id = false)]
	public enum CalComponentAlarmAction {
		NONE,
		AUDIO,
		DISPLAY,
		EMAIL,
		PROCEDURE,
		UNKNOWN
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_CLIENT_VIEW_FLAGS_")]
	[Flags]
	public enum CalClientViewFlags {
		NONE,
		NOTIFY_INITIAL
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_COMPONENT_ALARM_TRIGGER_", has_type_id = false)]
	public enum CalComponentAlarmTriggerType {
		NONE,
		RELATIVE_START,
		RELATIVE_END,
		ABSOLUTE
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_COMPONENT_CLASS_", has_type_id = false)]
	public enum CalComponentClassification {
		NONE,
		PUBLIC,
		PRIVATE,
		CONFIDENTIAL,
		UNKNOWN
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_COMPONENT_FIELD_", has_type_id = false)]
	public enum CalComponentField {
		CATEGORIES,
		CLASSIFICATION,
		COMPLETED,
		DTEND,
		DTSTART,
		DUE,
		GEO,
		PERCENT,
		PRIORITY,
		SUMMARY,
		TRANSPARENCY,
		URL,
		HAS_ALARMS,
		ICON,
		COMPLETE,
		RECURRING,
		OVERDUE,
		COLOR,
		STATUS,
		COMPONENT,
		LOCATION,
		NUM_FIELDS
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_COMPONENT_PERIOD_", has_type_id = false)]
	public enum CalComponentPeriodType {
		DATETIME,
		DURATION
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_COMPONENT_RANGE_", has_type_id = false)]
	public enum CalComponentRangeType {
		SINGLE,
		THISPRIOR,
		THISFUTURE
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_COMPONENT_TRANSP_", has_type_id = false)]
	public enum CalComponentTransparency {
		NONE,
		TRANSPARENT,
		OPAQUE,
		UNKNOWN
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_COMPONENT_", has_type_id = false)]
	public enum CalComponentVType {
		NO_TYPE,
		EVENT,
		TODO,
		JOURNAL,
		FREEBUSY,
		TIMEZONE
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_LOAD_", has_type_id = false)]
	public enum CalLoadState {
		NOT_LOADED,
		AUTHENTICATING,
		LOADING,
		LOADED
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "CAL_MODE_", has_type_id = false)]
	public enum CalMode {
		INVALID,
		LOCAL,
		REMOTE,
		ANY
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "")]
	public enum CalModeEnum {
		CalModeInvalid,
		CalModeLocal,
		CalModeRemote,
		CalModeAny
	}
	[CCode (cheader_filename = "libecal/libecal.h", cname="CalObjModType", cprefix = "CALOBJ_MOD_", has_type_id = false)]
	public enum CalObjModType {
		THIS,
		THISANDPRIOR,
		THISANDFUTURE,
		ONLY_THIS,
		ALL
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_SET_MODE_", has_type_id = false)]
	public enum CalSetModeStatus {
		SUCCESS,
		ERROR,
		NOT_SUPPORTED
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "")]
	public enum CalSetModeStatusEnum {
		ECalSetModeSuccess,
		ECalSetModeError,
		ECalSetModeNotSupported
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_SOURCE_TYPE_", has_type_id = false)]
	public enum CalSourceType {
		EVENT,
		TODO,
		JOURNAL,
		LAST
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "")]
	public enum CalSourceTypeEnum {
		Event,
		ToDo,
		Journal,
		Invalid
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CALENDAR_STATUS_", has_type_id = false)]
	public enum CalendarStatus {
		OK,
		INVALID_ARG,
		BUSY,
		REPOSITORY_OFFLINE,
		NO_SUCH_CALENDAR,
		OBJECT_NOT_FOUND,
		INVALID_OBJECT,
		URI_NOT_LOADED,
		URI_ALREADY_LOADED,
		PERMISSION_DENIED,
		UNKNOWN_USER,
		OBJECT_ID_ALREADY_EXISTS,
		PROTOCOL_NOT_SUPPORTED,
		CANCELLED,
		COULD_NOT_CANCEL,
		AUTHENTICATION_FAILED,
		AUTHENTICATION_REQUIRED,
		DBUS_EXCEPTION,
		OTHER_ERROR,
		INVALID_SERVER_VERSION,
		NOT_SUPPORTED
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "", has_type_id = false)]
	public enum DataCalMode {
		Local,
		Remote,
		AnyMode
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	public delegate bool CalRecurInstanceFn (E.CalComponent comp, ulong instance_start, ulong instance_end);
	[CCode (cheader_filename = "libecal/libecal.h")]
	public delegate iCal.TimeZone CalRecurResolveTimezoneFn (string tzid);
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_BACKEND_PROPERTY_ALARM_EMAIL_ADDRESS;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_BACKEND_PROPERTY_CAL_EMAIL_ADDRESS;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_BACKEND_PROPERTY_DEFAULT_OBJECT;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_CREATE_MESSAGES;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_DELEGATE_SUPPORTED;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_DELEGATE_TO_MANY;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_HAS_UNACCEPTED_MEETING;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_ALARM_REPEAT;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_AUDIO_ALARMS;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_CONV_TO_ASSIGN_TASK;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_CONV_TO_RECUR;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_DISPLAY_ALARMS;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_EMAIL_ALARMS;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_GEN_OPTIONS;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_ORGANIZER;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_PROCEDURE_ALARMS;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_TASK_ASSIGNMENT;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_THISANDFUTURE;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_THISANDPRIOR;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_TRANSPARENCY;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_ONE_ALARM_ONLY;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_ORGANIZER_MUST_ACCEPT;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_ORGANIZER_MUST_ATTEND;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_ORGANIZER_NOT_EMAIL_ADDRESS;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_RECURRENCES_NO_MASTER;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_REFRESH_SUPPORTED;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_REMOVE_ALARMS;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_REMOVE_ONLY_THIS;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_REQ_SEND_OPTIONS;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_SAVE_SCHEDULES;
	[CCode (cheader_filename = "libecal/libecal.h", cname = "cal_obj_uid_list_free")]
	public static void cal_obj_uid_list_free (GLib.List list);
	[CCode (cheader_filename = "libecal/libecal.h")]
	public static GLib.Quark calendar_error_quark ();
	[CCode (cheader_filename = "libecal/libecal.h", cname = "icaltimetype_to_tm")]
	public static void* icaltimetype_to_tm (void* itt);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "icaltimetype_to_tm_with_zone")]
	public static void* icaltimetype_to_tm_with_zone (void* itt, iCal.TimeZone from_zone, iCal.TimeZone to_zone);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "isodate_from_time_t")]
	public static unowned string isodate_from_time_t (ulong t);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_add_day")]
	public static ulong time_add_day (ulong time, int days);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_add_day_with_zone")]
	public static ulong time_add_day_with_zone (ulong time, int days, iCal.TimeZone zone);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_add_month_with_zone")]
	public static ulong time_add_month_with_zone (ulong time, int months, iCal.TimeZone zone);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_add_week")]
	public static ulong time_add_week (ulong time, int weeks);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_add_week_with_zone")]
	public static ulong time_add_week_with_zone (ulong time, int weeks, iCal.TimeZone zone);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_day_begin")]
	public static ulong time_day_begin (ulong t);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_day_begin_with_zone")]
	public static ulong time_day_begin_with_zone (ulong time, iCal.TimeZone zone);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_day_end")]
	public static ulong time_day_end (ulong t);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_day_end_with_zone")]
	public static ulong time_day_end_with_zone (ulong time, iCal.TimeZone zone);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_day_of_week")]
	public static int time_day_of_week (int day, int month, int year);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_day_of_year")]
	public static int time_day_of_year (int day, int month, int year);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_days_in_month")]
	public static int time_days_in_month (int year, int month);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_from_isodate")]
	public static ulong time_from_isodate (string str);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_is_leap_year")]
	public static bool time_is_leap_year (int year);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_leap_years_up_to")]
	public static int time_leap_years_up_to (int year);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_month_begin_with_zone")]
	public static ulong time_month_begin_with_zone (ulong time, iCal.TimeZone zone);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_to_gdate_with_zone")]
	public static void time_to_gdate_with_zone (GLib.Date date, ulong time, iCal.TimeZone zone);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_week_begin_with_zone")]
	public static ulong time_week_begin_with_zone (ulong time, int week_start_day, iCal.TimeZone zone);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_year_begin_with_zone")]
	public static ulong time_year_begin_with_zone (ulong time, iCal.TimeZone zone);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "tm_to_icaltimetype")]
	public static void* tm_to_TimeType (void* tm, bool is_date);
}