from sqlalchemy import func

class User(Base):
    __tablename__ = 'users'
    id = Column(Integer, primary_key=True)
    created_at = Column(func.now())  # Auto-populates with the current timestamp
