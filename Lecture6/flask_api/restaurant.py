from pynamodb.models import Model
from pynamodb.attributes import UnicodeAttribute

class Restaurant(Model): # inheritance
    class Meta:
        table_name = "Restaurant"
        region = 'us-east-1'
    
    resName = UnicodeAttribute(hash_key=True)
    city = UnicodeAttribute()
