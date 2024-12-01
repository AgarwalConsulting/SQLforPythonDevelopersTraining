from sqlalchemy import create_engine, delete
from sqlalchemy.orm import sessionmaker

from user import User
from base import DATABASE_URL

def main():
    print("Deleting...")

    engine = create_engine(DATABASE_URL)

    Session = sessionmaker(bind=engine)
    session = Session()

    # Delete using instance
    # user = session.query(User).where(User.email == "algogrit@gmail.com").first() ## 1.x style

    # users = select(User).filter_by(email="algogrit@gmail.com")
    # delete(users)

    # Delete Selectively ## 2.x style
    # stmt = delete(User).where(User.email != "algogrit@gmail.com")
    # session.execute(stmt)

    # Delete All
    # session.query(User).delete()

    session.execute(
        delete(User)
    )

    # Commit session!
    session.commit()

if __name__ == '__main__':
    main()
