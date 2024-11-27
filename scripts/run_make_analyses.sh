#!/bin/bash

set -ex

cd ../analyses/
7z x -p"ewok" -o"scripts/" -y data.zip

cd scripts/
echo "$(pwd)"
mv data/* ./
rm -r data/

Rscript -e "rmarkdown::render('inspect_results.Rmd')"

echo "All analyses completed successfully"
echo "Please see analyses/ directory for results"
