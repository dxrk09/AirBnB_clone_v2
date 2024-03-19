#!/usr/bin/python3
"""This is the base model class for AirBnB"""
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, String, DateTime
import uuid
from datetime import datetime

Base = declarative_base()

class BaseModel(Base):
    """This class will define all common attributes/methods for other classes."""
    
    __abstract__ = True
    
    id = Column(String(60), unique=True, nullable=False, primary_key=True)
    created_at = Column(DateTime, nullable=False, default=datetime.utcnow)
    updated_at = Column(DateTime, nullable=False, default=datetime.utcnow)

    def __init__(self, *args, **kwargs):
        """Instantiation of base model class."""
        if not kwargs.get('id'):
            self.id = str(uuid.uuid4())
        if not kwargs.get('created_at'):
            self.created_at = datetime.utcnow()
        if not kwargs.get('updated_at'):
            self.updated_at = datetime.utcnow()

    def __str__(self):
        """Returns a string of class name, id, and dictionary."""
        return "[{}] ({}) {}".format(
            type(self).__name__, self.id, self.__dict__)

    def __repr__(self):
        """Return a string representation."""
        return self.__str__()

    def save(self):
        """Updates the public instance attribute updated_at to current."""
        self.updated_at = datetime.utcnow()
        from models import storage
        storage.new(self)
        storage.save()

    def to_dict(self):
        """Creates dictionary of the class and returns."""
        my_dict = dict(self.__dict__)
        my_dict['__class__'] = type(self).__name__
        my_dict['created_at'] = self.created_at.isoformat()
        my_dict['updated_at'] = self.updated_at.isoformat()
        my_dict.pop('_sa_instance_state', None)
        return my_dict

    def delete(self):
        """Delete object."""
        from models import storage
        storage.delete(self)
