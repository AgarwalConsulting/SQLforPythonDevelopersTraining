from sqlalchemy import create_engine, delete
from sqlalchemy.orm import sessionmaker

from user import User
from base import DATABASE_URL

def main():
    engine = create_engine(DATABASE_URL)

    Session = sessionmaker(bind=engine)
    session = Session()

    # Insert
    new_user = User(name="Gaurav", email="algogrit@gmail.com")
    session.add(new_user)

    # Query
    # users = session.query(User).all()
    # for user in users:
    #     print(user)

    # Delete using instance
    # user = session.query(User).where(User.email == "algogrit@gmail.com").first()
    # session.delete(user)

    # Delete Selectively
    # stmt = delete(User).where(User.email != "algogrit@gmail.com")
    # session.execute(stmt)


    # Delete All
    # session.query(User).delete()

    # Commit session!
    session.commit()

if __name__ == '__main__':
    main()
