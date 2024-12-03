# Setup Sharding

Sharding in PostgreSQL involves partitioning data across multiple database instances to improve scalability and performance. PostgreSQL does not natively support sharding, but you can implement it using features like partitioning and external tools. Here’s a guide to set up sharding in PostgreSQL:

---

## 1. Understand Your Use Case

Before implementing sharding, analyze:

- **Data size**: Is your data growing rapidly?

- **Workload**: Does your application require high write or read throughput?

- **Query patterns**: Will most queries target a single shard?

---

## 2. Choose a Sharding Strategy

Select the sharding key based on your query patterns:

- **Hash-based sharding**: Data is distributed based on a hash function.

- **Range-based sharding**: Data is split based on ranges of a column (e.g., date).

- **Entity-based sharding**: Related data is stored together (e.g., per customer).

---

## 3. Native PostgreSQL Partitioning (Basic Sharding)

PostgreSQL supports partitioning, which can be used for basic sharding.

### Steps

1. **Create a Parent Table**:

   ```sql
   CREATE TABLE users (
       id SERIAL PRIMARY KEY,
       username TEXT NOT NULL,
       created_at TIMESTAMP NOT NULL
   ) PARTITION BY RANGE (created_at);
   ```

2. **Create Partitioned Tables**:

   ```sql
   CREATE TABLE users_2023 PARTITION OF users FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');
   CREATE TABLE users_2024 PARTITION OF users FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
   ```

3. **Insert Data**:
   PostgreSQL automatically routes data to the appropriate partition:

   ```sql
   INSERT INTO users (username, created_at) VALUES ('Alice', '2023-06-15');
   ```

### Limitations

- All data resides on a single database instance.
- Not ideal for massive datasets across multiple servers.

---

## 4. Use PostgreSQL Extensions or External Tools for Distributed Sharding

For larger-scale setups, use external tools like **Citus**, **Pgpool-II**, or frameworks like **Vitess**.

### Using Citus (An Open-Source PostgreSQL
Extension):
1. **Install Citus**:
   Follow the [Citus installation guide](https://www.citusdata.com/).

2. **Configure a Distributed Cluster**:
   - Designate one node as the coordinator.
   - Add worker nodes for storage.

3. **Enable Distribution**:

   ```sql
   SELECT citus.create_distributed_table('users', 'user_id');
   ```

4. **Insert Data**:
   Data is automatically routed to the appropriate shard.

### Benefits of Citus

- Distributed SQL queries across shards.
- High scalability for write and read workloads.

---

## 5. Implement Application-Level Sharding

In this approach, your application determines which shard to query or write to.

### Steps

1. **Create Separate Databases**:
   Set up multiple PostgreSQL instances for each shard.

2. **Define Sharding Logic**:
   Implement logic in your application to route queries to the appropriate shard based on the sharding key.

3. **Maintain a Shard Map**:
   Use a configuration table or service to map sharding keys to shard instances.

---

## 6. Monitor and Maintain

- **Backup & Recovery**: Ensure each shard is backed up independently.

- **Performance Monitoring**: Use tools like `pg_stat_activity`, `pgbouncer`, or third-party monitoring services.

- **Scaling**: Add or re-balance shards as your data grows.

---

## When to Use Each Approach

| **Approach**            | **Use Case**                                     |
|--------------------------|-------------------------------------------------|
| Native Partitioning      | Single instance, moderate scalability needs.    |
| Citus or Distributed DB  | Large-scale apps needing distributed databases. |
| Application-Level Sharding | Custom sharding logic, full control over shards.|

Sharding adds complexity, so evaluate if horizontal scaling is truly needed before implementing.
