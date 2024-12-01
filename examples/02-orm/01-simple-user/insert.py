from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from user import User
from base import DATABASE_URL

def main():
    print("Inserting...")

    engine = create_engine(DATABASE_URL)

    Session = sessionmaker(bind=engine)
    session = Session()

    # Insert
    new_user = User(name="Gaurav", email="algogrit@gmail.com")
    session.add(new_user)

    # Commit session!
    session.commit()

if __name__ == '__main__':
    main()
