# SQL for Python Developers

## Objectives

- Quick Refresher on SQL concepts and advantages over mongoDB
- Understand the various `JOIN`s and performance impact of normalization
- Understanding windowing, triggers, partitioning and replication in Postgres
- Understanding ORM usage and shortcomings
- Understanding how to handle migrations

## Agenda

## Day 1: Python & Postgres

- Python & Database
  - Library landscape
    - Database Drivers vs ORMs
  - Connection Pooling

- Introduction to SQLAlchemy
  - Using `psycopg` as a Postgres Driver
    - Connection Pooling
  - Using `sqlalchemy`
    - core
    - orm
  - Schema Management
    - Managing migration files & Schema

- ORM: Deep Dive (The How?)
  - Defining constraints
    - Enforcing constraints at DB layer vs application layer
  - Mapping the Object to a table
    - Modelling Has & Belongs to relationships
  - Simple querying
  - Joins
  - Limitations
  - How to approach auditing

- Complex Queries via Raw Queries
  - Mapping Raw query results
  - Concurrent operations with `psycopg`

- Schema Management: Pitfalls
  - Advanced Scenarios
    - Changing the data type of a column
    - Adding a new column
      - and populating it
    - Dropping a column
  - Schema version management via migrations
  - Rollback in case of regression
    - Maintaining Data consistency

## Day 2: Postgres Deep Dive

- To normalize or not to normalize?
  - Flat Tables vs Highly Normalized tables
    - Design Considerations

- Common Query Performance considerations
  - `JOIN`s & Indexes
    - Understanding the Various `JOIN`s and the resulting cartesian product
    - Performance impact
      - demystifying `EXPLAIN`
      - How, why and when of Indices
    - Avoiding Sequential Scans using Indexes
    - `JOIN` vs `UNION`

- Working with JSONB
  - vs JSON
  - vs hstore
  - Raw queries & operations
  - TOAST & performance implications
  - GIN indexes

- Partitioning
  - Window functions

- Common calculation mistakes
  - Counting nulls
  - Average of averages

- Replication vs Clustering vs Sharding
  - Setting up a Sharded postgres via Foreign Data Wrappers

- Transactions & Locking

- Backup, Maintenance & Monitoring
  - `pg_dump` & `pg_restore`
  - Autovacuum
  - `pg_stat_activity`

- Developing Machine Empathy
  - MongoDB vs Postgres
  - Structure of Data in Postgres
