#!/usr/bin/env -S perl -pi
BEGIN {
    exit if scalar @ARGV == 0;
    $version =
`curl https://hackage.haskell.org/package/ShellCheck/preferred.json | jq -r '.["normal-version"][0]'`;
    chomp $version;
}

s/(?<=^    rev: )\S+/$version/;
s/(?<=shellcheck:v)\S+/$version/;
s/(?<=    - ShellCheck-)\S+/$version/;
s/(?<=^          tag_name: )\S+/$version/;
