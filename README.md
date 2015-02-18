[![Build Status](https://travis-ci.org/madflow/hubot-mayer-imbiss.png)](https://travis-ci.org/madflow/hubot-mayer-imbiss)

# What gives?

Hubot script package for quick access to the Tageskarte of the second Metzger on the Venloer Straße

---

The script package is licensed under the WFYBPL (WHATEVER FLOATS YOUR BOAT PUBLIC LICENSE).

# Installation

    npm install hubot-mayer-imbiss

Add "hubot-mayer-imbiss" to external-scripts.json

# Available Extensions

+ Convenience Listener for the Burrito Laden ("Wieviel kosten die Burritos eigentlich?").

## Directory Structure

Using the common directory structure for hubot script packages it will be easy
to manage and allow others to easily contribute to your package.

### script

This directory is home to a couple of development scripts; `bootstrap` and `test`
they're used to bootstrap the development environment and run tests
respectively.

### src

This directory is home to the actual hubot scripts in the package. Your
`index.coffee` entry point will load the scripts from this directory.

### test

This directory is home to any tests you write for your scripts. This example
package uses Mocha, Chai and Sinon to manage writing tests.


