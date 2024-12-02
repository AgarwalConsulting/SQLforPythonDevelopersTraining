from sqlalchemy.ext.declarative import declared_attr

class BaseWithPolymorphism(Base):
    __abstract__ = True

    @declared_attr
    def type(cls):
        return Column(String)

    @declared_attr
    def __mapper_args__(cls):
        if hasattr(cls, '__type__'):
            return {'polymorphic_identity': cls.__type__}
        return {'polymorphic_on': cls.type}

class Item(BaseWithPolymorphism):
    __tablename__ = 'items'
    id = Column(Integer, primary_key=True)

class Book(Item):
    __type__ = 'book'
    title = Column(String, nullable=False)

class Movie(Item):
    __type__ = 'movie'
    title = Column(String, nullable=False)
