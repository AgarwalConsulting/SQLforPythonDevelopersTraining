from sqlalchemy import CheckConstraint

class Product(Base):
    __tablename__ = 'products'
    id = Column(Integer, primary_key=True)
    price = Column(Integer)
    quantity = Column(Integer)
    __table_args__ = (
        CheckConstraint('price > 0', name='check_price_positive'),
        CheckConstraint('quantity >= 0', name='check_quantity_non_negative'),
    )
