class ObjectChangeEvent:
    """Defines an event when an object is added, modified, or deleted."""
    def __init__(self, object_name, event_type):
        self.object_name = object_name
        self.event_type = event_type

    def __repr__(self):
        return f"ObjectChangeEvent(object_name={self.object_name}, event_type={self.event_type})"
