#!/bin/bash
set -uexo pipefail
dpkg-scanpackages debian /dev/null | gzip -9c > debian/Packages.gz
