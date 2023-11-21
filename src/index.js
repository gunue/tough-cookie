const { Cookie, CookieJar } = require('tough-cookie');

async function run() {
  // Create a new cookie jar
  const jar = new CookieJar();

  // Create a new cookie
  const cookie = Cookie.parse("exampleCookie=12345; Expires=Wed, 09 Jun 2021 10:18:14 GMT");

  // Add cookie to the jar for a specific domain
  jar.setCookie(cookie, 'http://example.com', function(err, cookie) {
    if (err) {
      console.error('Error setting cookie:', err);
      return;
    }
    console.log('Cookie set:', cookie.toString());
  });

  // Retrieve cookies for a specific domain
  jar.getCookies('http://example.com', function(err, cookies) {
    if (err) {
      console.error('Error getting cookies:', err);
      return;
    }
    console.log('Cookies retrieved:', cookies.join('; '));
  });
}

run();

