#!/bin/bash
if [ -f realm.xml ]
  then
    echo "Downloading dependencies"
  else
    echo "realm.xml file not found. Are you running this script from the root of the project?"
    exit 1
fi

composer install
if [ -f vendor/bin/realm ]
  then
    echo "realm binary ok"
  else
    echo "realm binary not found. possible issue with composer?"
    exit 1
fi
mkdir -p dependencies/
wget -O "dependencies/peri23.decor.xml" "https://decor.nictiz.nl/decor/services/RetrieveDataSet?id=2.16.840.1.113883.2.4.3.11.60.90.77.1.6&language=nl-NL&effectiveDate=2016-09-08T00:00:00&format=xml&hidecolumns=3456bcdefghijklmnop"
vendor/bin/realm decor:convert -f dependencies/peri23.decor.xml -o .
