#!/usr/bin/env bash

set -e

createdb mydatabase

# psql -h localhost -d userstoreis -U admin -p 5432 -a -q -f /home/jobs/Desktop/resources/postgresql.sql

psql "postgresql://localhost:5432/mydatabase" -f ./examples/00-setup/person.sql
