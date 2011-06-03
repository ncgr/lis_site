#!/bin/bash

#
# Creates a tarball ready to deploy.
# 
tar czf lis_site-release.tar.gz \
    lis_site/app \
    lis_site/config \
    lis_site/config.ru \
    lis_site/db \
    lis_site/doc \
    lis_site/Gemfile \
    lis_site/Gemfile.lock \
    lis_site/lib \
    lis_site/public \
    lis_site/Rakefile \
    lis_site/README \
    lis_site/script \
    lis_site/test \
    lis_site/spec \
    lis_site/vendor 

# omitted files:
# log 
# startServer
# tmp
# .rspec
# .gitignore

