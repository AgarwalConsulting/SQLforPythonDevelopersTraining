# Setup Replication

Setting up replication in PostgreSQL involves configuring a primary server (previously called the master) and one or more standby servers (previously called slaves). PostgreSQL uses physical replication based on the Write-Ahead Logging (WAL) system. Here are the steps to set it up:

---

## 1. Prepare the Primary Server

1. **Edit `postgresql.conf`:**
   Modify the configuration file (`postgresql.conf`) on the primary server:

   ```ini
   wal_level = replica          # Enable WAL archiving and replication
   max_wal_senders = 10         # Adjust based on the number of replicas
   wal_keep_size = 64           # Size of WAL segments to retain (optional)
   listen_addresses = '*'       # Allow connections from standby servers
   ```

2. **Edit `pg_hba.conf`:**
   Allow the standby servers to connect for replication. Add an entry like this:

   ```plaintext
   host    replication    your_replication_user    standby_ip/32    md5
   ```

3. **Restart the Primary Server:**
   Apply changes by restarting PostgreSQL:

   ```bash
   sudo systemctl restart postgresql
   ```

---

## 2. Create a Replication User

On the primary server, create a user with replication privileges:

```sql
CREATE USER replication_user REPLICATION LOGIN ENCRYPTED PASSWORD 'your_password';
```

---

## 3. Set Up the Standby Server

1. **Stop PostgreSQL on the Standby Server:**

   ```bash
   sudo systemctl stop postgresql
   ```

2. **Backup the Primary Server's Data Directory:**
   Use `pg_basebackup` to copy data from the primary server:

   ```bash
   pg_basebackup -h primary_ip -D /var/lib/postgresql/data -U replication_user -Fp -Xs -P
   ```

   - Replace `primary_ip` with the IP address of the primary server.

   - Use the same data directory as PostgreSQL on the standby server.

3. **Create a `recovery.conf` or `standby.signal`:**
   In PostgreSQL 12+, create a `standby.signal` file in the data directory. Add a `primary_conninfo` entry to the `postgresql.conf` file:

   ```ini
   primary_conninfo = 'host=primary_ip port=5432 user=replication_user password=your_password'
   ```

   If using PostgreSQL < 12, create a `recovery.conf` file instead:

   ```ini
   standby_mode = 'on'
   primary_conninfo = 'host=primary_ip port=5432 user=replication_user password=your_password'
   trigger_file = '/tmp/promote_to_primary'
   ```

4. **Start the Standby Server:**

   ```bash
   sudo systemctl start postgresql
   ```

---

## 4. Verify Replication

1. **On the Primary Server:**
   Check active replication connections:

   ```sql
   SELECT * FROM pg_stat_replication;
   ```

2. **On the Standby Server:**
   Verify replication status in the logs or by checking the connection.

---

## Optional: Configure Synchronous Replication

To ensure no data is lost, configure synchronous replication:
1. On the primary server, edit `postgresql.conf`:

   ```ini
   synchronous_standby_names = 'standby_name'
   ```

   Replace `standby_name` with the application name specified in the `primary_conninfo` string.

2. Restart the primary server for changes to take effect.

---

## Troubleshooting

- Check PostgreSQL logs (`/var/log/postgresql/`) for errors.
- Ensure network connectivity between servers.
- Verify correct user permissions and configurations.

This setup ensures a basic replication configuration. For more advanced configurations (e.g., cascading replication, logical replication), refer to the [PostgreSQL Documentation](https://www.postgresql.org/docs/current/high-availability.html).
