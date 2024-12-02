@event.listens_for(User, "before_update")
def check_age(mapper, connection, target):
    if target.age < 0:
        raise ValueError("Age cannot be negative")
