#!/bin/bash

YEAR=2022

curl https://adventofcode.com/${YEAR}/day/$1/input -H "Cookie: session=${SESSION_ID}"
