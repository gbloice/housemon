# Angularisms

The client side of this app is based on [AngularJS](http://angularjs.org)
("NG"), which has a fairly steep learning curve. This is used to create a
[SPA](http://en.wikipedia.org/wiki/Single-page_application) whereby a lot of
the application lives inside the browser. NG only operates on the client side.

## Client startup

The client starts with `entry.coffee`, which orchestrates the main setup
needed for Angular:
  
* create an Angular module called "myApp" and setup things in "main.coffee"
* configure the client-side routes, as defined in the "routes.coffee" file
* install remaining configs, filters, services, directives, and controllers
* wait for the DOM to finish loading, then report "app ready" on the console

With NG apps, the bulk of the client-side code should probably be placed inside
services, because these can access each other and can be used by controllers.
All NG modules can take advantage of the "Dependency Injection" mechanism, a
fancy name for a clean high-level mechanism to tie things _loosely_ together.
  
## Terminology

Getting to grips with NG can be daunting. There is a very detailed tutorial
on the [NG site](http://docs.angularjs.org/tutorial/) - it's quite long, but
there's really no other way to reach nirvana than to work through it...

For reference, here's a short list of the key concepts used in AngularJS:

* **Routes** are the path matchers which determine how each URL gets handled
* **Filters** are Angular's way of converting data to a nice format for HTML
* **Services** are modules you can use anywhere through "Dependency Injection"
* **Directives** are Angular's way to reuse / extend / manipulate DOM elements
* **Controllers** manage a section of the DOM with local state called a "scope"

For more info, see the [Developer Guide](http://docs.angularjs.org/guide/index).

## Directories

The files in `client/code/modules/` contain most of the application logic, using
the mechanisms and terminology just described. Any files placed in `code/libs/`
serve a similar purpose, but they get auto-loaded. It's an excellent place for
3rd-party packages, because they won't get wrapped or modified in any way.

Everything in `client/code/` ends up in the browser through SocketStream's
magic and the [Browserify](https://github.com/substack/node-browserify#readme)
tool it uses internally. That's why something like "require './main'" works.

Everyting in `code/static/` is served as is, i.e. images and other raw files.

The `code/css/` area contains CSS files, for the app itself as well as for any
frameworks included in the code. The `*.stylus` files are auto-compiled to CSS.

The `code/templates/` directory holds *partial* HTML (and `*.jade` files, which
are also auto-compiled to HTML). These are inserted in the `ng-view` element,
which is listed on the `views/index.jade` file. That index file has the main
page boilerplate. This is all part of how "Single Page Applications" work.
