Flex Gateway Response Content Policy
====================================

This repository contains a [Proxy-Wasm](https://github.com/proxy-wasm/spec)
filter that can be used as a reference to quickly start implementing new 
Flex Gateway filters in AssemblyScript.


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

Policy Test
============

Test the policy into a Flex Gateway, you need to place you registration in the path `resources/flex-registration.yaml` before you run this command

```
make policy.test
```

Policy Publish
==============

```
make policy.anypoint.definition.publish
make policy.anypoint.implementation.publish
```

