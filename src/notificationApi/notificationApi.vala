namespace SwayNotificationCenter {
    [DBus (name = "org.freedesktop.Notifications")]
    public class NotificationApi : Object {
        private DatabaseManager db_manager;

        public NotificationApi() {
            db_manager = DatabaseManager.get_instance();
        }

        public List<uint32> get_notifications(int limit, int offset) {
            return db_manager.get_notification_ids(limit, offset);
        }

        public NotifyParams? get_notification_details(uint32 id) {
            return db_manager.get_notification(id);
        }

        public bool delete_notification(uint32 id) {
            return db_manager.delete_notification(id);
        }

        public bool mark_as_read(uint32 id) {
            return db_manager.mark_as_read(id);
        }

        public int get_unread_count() {
            return db_manager.get_unread_count();
        }
    }
}