# Startup

Understanding the startup process is quite a challenge, with so much magic
going on under the hood. There's SocketStream and AngularJS, neither of them
know about each other on initial application startup.

## Client-side startup

This is how the browser code starts up all the cient-side bits & bobs:

* SocketStream runs `entry.coffee`, it has no idea about NG yet
* entry.coffee sets up `main.coffee` to hook up routes and NG's RPC & pubsub
* entry.coffee sets up all the other files listed, i.e. controllers, etc
* last step in entry.coffee is to wait for DOM loading and then show a greeting

In terms of modularity, on the client side everything should be done as NG
"services", since these can be interconnected via NG's dependency injection.
See `admin.coffee for an example, with `MainCtrl` "calling" rpc and pubsub.

## Server-side startup

The application is normally started using `npm start`. Here's what that does:

* npm looks in `package.json` for the `main` entry and finds `app.js`
* it then launches `node` with `app.js` as script (see the note below)
* `app.js` is just a tiny wrapper to launch `server/startup.coffee`
* `startup.coffee` is more or less a standard SocketStream app startup file
* non-standard is that all files in `briqs/` are scanned and loaded
* also extra, is the code in `engine/...` to manage briqs and shared state

For develoment, it's better to install `nodemon`, and launch the app that way.

## More docs

* SocketStream: <https://github.com/socketstream/socketstream/tree/master/doc/guide/en>
* AngularJS guide: <http://docs.angularjs.org/guide/>
* AngularJS API: <http://docs.angularjs.org/api/>