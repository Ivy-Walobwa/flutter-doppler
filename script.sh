#!/usr/bin/env bash
cmd="flutter run -d chrome"

for secret in $(doppler secrets download --no-file --format env-no-quotes); do
  cmd="${cmd} --dart-define=${secret}"
done

eval $cmd

