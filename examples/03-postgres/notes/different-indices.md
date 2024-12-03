# Indices

## 1. **B-Tree Index**

- **Description**: The default index type in PostgreSQL. It is well-suited for equality and range queries.
- **Use Cases**:
  - `=`, `<`, `<=`, `>`, `>=` operators.
  - Queries that involve sorting or range scans.
- **Example**:

     ```sql
     CREATE INDEX idx_name ON table_name (column_name);
     ```

---

## 2. **Hash Index**

- **Description**: Optimized for equality comparisons but not range queries.
- **Use Cases**:
  - `=` operator only.
  - Specific use cases where hash lookups are efficient.
- **Example**:

     ```sql
     CREATE INDEX idx_name ON table_name USING HASH (column_name);
     ```
- **Note**: Less commonly used due to limitations compared to B-Tree.

---

## 3. **GIN (Generalized Inverted Index)**

- **Description**: Used for indexing elements of arrays, JSONB fields, and full-text search.
- **Use Cases**:
  - Array queries (`@>`, `<@`, `&&`).
  - Full-text search (`to_tsvector`).
  - JSONB containment queries.
- **Example**:

     ```sql
     CREATE INDEX idx_name ON table_name USING GIN (column_name);
     ```

---

## 4. **GiST (Generalized Search Tree)**

- **Description**: Supports custom, flexible data types and search queries, such as geometric or full-text search.
- **Use Cases**:
  - Geospatial data (PostGIS).
  - Range types.
  - Full-text search.
- **Example**:

     ```sql
     CREATE INDEX idx_name ON table_name USING GiST (column_name);
     ```

---

## 5. **BRIN (Block Range Index)**

- **Description**: Summarizes large blocks of data, suitable for very large datasets with sequentially ordered data.
- **Use Cases**:
  - Large datasets where columns exhibit natural ordering.
  - Use in conjunction with partitioning.
- **Example**:

     ```sql
     CREATE INDEX idx_name ON table_name USING BRIN (column_name);
     ```

---

## 6. **SP-GiST (Space-Partitioned GiST)**

- **Description**: Supports partitioned, non-balanced data structures. Good for multidimensional or non-uniformly distributed data.
- **Use Cases**:
  - Geospatial queries.
  - Text search (prefix matching).
- **Example**:

     ```sql
     CREATE INDEX idx_name ON table_name USING SPGIST (column_name);
     ```

---

## 7. **Full-Text Search Index (TSVector)**

- **Description**: Uses GIN or GiST for full-text search indexing.
- **Use Cases**:
  - Efficient text search (`to_tsvector`, `to_tsquery`).
- **Example**:

     ```sql
     CREATE INDEX idx_name ON table_name USING GIN (to_tsvector('english', column_name));
     ```

---

## 8. **Expression Index**

- **Description**: Indexes the result of an expression or function rather than raw column values.
- **Use Cases**:
  - Derived or computed values frequently used in queries.
- **Example**:

     ```sql
     CREATE INDEX idx_name ON table_name ((lower(column_name)));
     ```

---

## 9. **Partial Index**

- **Description**: Indexes only a subset of rows based on a condition.
- **Use Cases**:
  - When queries only target specific rows.
- **Example**:

     ```sql
     CREATE INDEX idx_name ON table_name (column_name) WHERE column_name IS NOT NULL;
     ```

---

## 10. **Unique Index**

- **Description**: Ensures that all values in the indexed column are unique.
- **Use Cases**:
  - Enforcing uniqueness constraints.
- **Example**:

     ```sql
     CREATE UNIQUE INDEX idx_name ON table_name (column_name);
     ```

---

## 11. **Composite Index**

- **Description**: Indexes multiple columns together.
- **Use Cases**:
  - Queries involving multiple columns in WHERE or ORDER BY clauses.
- **Example**:

     ```sql
     CREATE INDEX idx_name ON table_name (column1, column2);
     ```

---

## Choosing the Right Index

- **Frequent Lookups or Range Queries**: B-Tree.
- **Array/JSONB Operations**: GIN.
- **Geospatial Queries**: GiST or SP-GiST.
- **Full-Text Search**: GIN with `to_tsvector`.
- **Large Ordered Datasets**: BRIN.
- **Customized Search Logic**: Expression or Partial Index.

Indexes help significantly in optimizing queries, but over-indexing can lead to maintenance overhead and slower writes. Always monitor and test before deciding on the type and number of indexes.
