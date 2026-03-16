from sqlalchemy import Column, Integer, String, Boolean, ForeignKey
import app.database.session

class User(app.database.session.Base):

    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)

    name = Column(String)

    email = Column(String, unique=True)

    password_hash = Column(String)

    role_id = Column(Integer, ForeignKey("roles.id"))

    active = Column(Boolean, default=True)