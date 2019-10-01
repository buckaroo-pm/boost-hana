#!/bin/bash

buckaroo install

if [ $BUCKAROO_USE_BAZEL ]
then

bazel build //:all

else

buck build -c ui.superconsole=DISABLED //...

fi
