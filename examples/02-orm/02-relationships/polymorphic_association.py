from sqlalchemy import (
    create_engine,
    Column,
    Integer,
    String,
    ForeignKey,
    and_,
)
from sqlalchemy.orm import relationship, declarative_base, sessionmaker

Base = declarative_base()

# The Tag model
class Tag(Base):
    __tablename__ = 'tags'

    id = Column(Integer, primary_key=True)
    name = Column(String, nullable=False)

    # Relationship to taggable
    taggables = relationship("Taggable", back_populates="tag")


# The Taggable model (link table for polymorphism)
class Taggable(Base):
    __tablename__ = 'taggables'

    id = Column(Integer, primary_key=True)
    tag_id = Column(Integer, ForeignKey('tags.id'), nullable=False)
    taggable_id = Column(Integer, nullable=False)
    taggable_type = Column(String, nullable=False)

    # Relationships
    tag = relationship("Tag", back_populates="taggables")


# The Article model
class Article(Base):
    __tablename__ = 'articles'

    id = Column(Integer, primary_key=True)
    title = Column(String, nullable=False)

    # Polymorphic relationship
    tags = relationship(
        "Tag",
        secondary="taggables",
        primaryjoin=and_(id == Taggable.taggable_id, Taggable.taggable_type == "article"),
        secondaryjoin=Taggable.tag_id == Tag.id,
        viewonly=True,  # Ensures the relationship doesn't interfere with the back_populates
    )


# The Comment model
class Comment(Base):
    __tablename__ = 'comments'

    id = Column(Integer, primary_key=True)
    content = Column(String, nullable=False)

    # Polymorphic relationship
    tags = relationship(
        "Tag",
        secondary="taggables",
        primaryjoin=and_(id == Taggable.taggable_id, Taggable.taggable_type == "comment"),
        secondaryjoin=Taggable.tag_id == Tag.id,
        viewonly=True,
    )


# Setup the database
DATABASE_URL = "postgresql+psycopg://localhost:5432/mydatabase"
engine = create_engine(DATABASE_URL, echo=True)
Base.metadata.create_all(engine)

# Create a session
Session = sessionmaker(bind=engine)
session = Session()

# Example usage
if __name__ == "__main__":
    # Create some tags
    tag1 = Tag(name="python")
    tag2 = Tag(name="sqlalchemy")

    # Add tags to session
    session.add_all([tag1, tag2])

    # Create an article and a comment
    article = Article(title="Polymorphism in SQLAlchemy")
    comment = Comment(content="This is a great article!")

    session.add(article)
    session.add(comment)
    session.commit()

    # Add Taggables
    taggable1 = Taggable(tag_id=tag1.id, taggable_id=article.id, taggable_type="article")
    taggable2 = Taggable(tag_id=tag2.id, taggable_id=comment.id, taggable_type="comment")

    session.add_all([taggable1, taggable2])
    session.commit()

    # Query tags for an article
    tagged_article = session.query(Article).filter_by(id=article.id).first()
    print(f"Article Tags: {[tag.name for tag in tagged_article.tags]}")

    # Query tags for a comment
    tagged_comment = session.query(Comment).filter_by(id=comment.id).first()
    print(f"Comment Tags: {[tag.name for tag in tagged_comment.tags]}")
