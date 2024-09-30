Flex Gateway AssemblyScript Policy Template
===============================

This repository contains a [Proxy-Wasm](https://github.com/proxy-wasm/spec)
filter that can be used as a reference to quickly start implementing new
filters in AssemblyScript.

This is a "hello-world" type filter performing a minimal operation and showing
the basics of filter configuration: it simply adds a new header `X-Greeting`
to a proxied response. You can pass the filter a JSON configuration in the
format `{ "greeting": "Howdy!" }` to change the value of the injected
header.

Requirements
============

* [node](https://nodejs.org)

Policy Build
============

Once the environment is set up with `npm` in your PATH,
you can build it with:

```
make policy.build
```

This will produce a .wasm file in `build/`.

Policy Publish
==============

```
make policy.anypoint.definition.publish
make policy.anypoint.implementation.publish
```

