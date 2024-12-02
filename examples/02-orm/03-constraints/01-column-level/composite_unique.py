from sqlalchemy import UniqueConstraint

class Enrollment(Base):
    __tablename__ = 'enrollments'
    id = Column(Integer, primary_key=True)
    student_id = Column(Integer)
    course_id = Column(Integer)
    __table_args__ = (
        UniqueConstraint('student_id', 'course_id', name='uix_student_course'),
    )
