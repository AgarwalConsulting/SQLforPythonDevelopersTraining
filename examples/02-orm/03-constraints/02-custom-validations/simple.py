class User(Base):
    __tablename__ = 'users'
    id = Column(Integer, primary_key=True)
    age = Column(Integer)

    def __init__(self, age):
        if age < 0:
            raise ValueError("Age cannot be negative")
        self.age = age
