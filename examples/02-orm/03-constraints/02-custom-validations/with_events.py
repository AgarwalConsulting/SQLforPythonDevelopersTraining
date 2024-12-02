from sqlalchemy import event

@event.listens_for(User, "before_insert")
def validate_email(mapper, connection, target):
    if "@" not in target.email:
        raise ValueError("Invalid email address")
