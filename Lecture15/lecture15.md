# Lecture 15

## Let's add another new feature
We want to allow this app to make a booking for a restaurant
So what do we need?
1. Need a way to make the booking
2. It should store the info that there's a booking
   1. That means we need to store user data
3. A way to see your bookings
4. Maybe change or cancel it

```dart
from pynamodb.models import Model
from pynamodb.attributes import UnicodeAttribute
from pynamodb.attributes import NumberAttribute
from pynamodb.attributes import ListAttribute

class User(Model): # inheritance
    class Meta:
        table_name = "User"
        region = 'us-east-1'
    
    email = UnicodeAttribute(hash_key=True)
    name = UnicodeAttribute()
    password = UnicodeAttribute()
    phoneNumber = UnicodeAttribute()

    reservations = ListAttribute()
```

```dart
@app.route("/login", methods=["POST"])
def login():
    email = request.json["email"]
    password = request.json["password"]
    result = User.query(email)
    if len(result) == 0:
        return jsonify("Incorrect email")
    else:
        if result.password == password:
            return jsonify("Success")
        else:
            return jsonify("Wrong Password")
```