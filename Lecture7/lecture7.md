# Lecture 7

## Flutter Web App
- Using Chrome instead of Simulator to run flutter app
  - Install Chrome if you don't have it
- https://flutter.dev/docs/get-started/web
- Breakdown
  1. run `flutter channel master` to get the beta version
  2. run `flutter config --enable-web` to enable web mode
  3. run `flutter devices` to check if chrome shows up
  4. go to `Lecture3/lecture3`
  5. run `flutter create .` to add web support to existing app
  6. run `flutter clean` to clean previous builds
  7. start the app
- When restart, refresh the browser instead

### XMLHttpRequest error
- Browser's `Same Origin Policy`
  - Security mechanism that first web page can access the second web page only if both web pages have the same origin
- Prevents `cross-site request forgery`, an attack by taking advantage of session cookies in the browser

<img src="./same_domain.png" height=150>

- `cookies`: 
  - contains ___ and other info
  - what is ___? __
    - ___
- A malicious pop up can take advantage of the cookie, so that it gains user information

<img src="./attack.png" height=150>



### Try with our endpoint
- Same error
- Solution: `CORS` - **Cross Origin Resource Sharing**
  - Addtional http header parameters to allow sites cross domain to share resources
  1. install `flask-cors`
  2. import `CORS`
  3. CORS(app)


## Load yelp data from backend instead
- We have a backend server now, if we still want to use Yelp data, we can just load from backend instead
- use `request` library to do http request in Python
- pass parameters instead of having it inside the url to make the code more manageable

## Tasks for you
1. Fetch 10 chinese restaurants in Toronto region
2. fetch `name`, `price`, `category => alias`, `category => title`, `rating`, `image_url`
3. Use `Image.network` to load image instead of using `Image.asset`
4. Use `fit` attrubute in `Image.network` to stretch the image horizontally
