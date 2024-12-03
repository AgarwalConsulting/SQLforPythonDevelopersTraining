# [Increasing connection Pool](https://stackoverflow.com/questions/30778015/how-to-increase-the-max-connections-in-postgres/32584211#32584211)

Just increasing  `max_connections` is bad idea. You need to increase `shared_buffers` and `kernel.shmmax` as well.

---

## Considerations

`max_connections` determines the maximum number of concurrent connections to the database server. The default is typically 100 connections.

Before increasing your connection count you might need to scale up your deployment. But before that, you should consider whether you really need an increased connection limit.

*Each PostgreSQL connection consumes RAM for managing the connection or the client using it. The more connections you have, the more RAM you will be using that could instead be used to run the database.*

A well-written app typically doesn't need a large number of connections. If you have an app that does need a large number of connections then consider using a tool such as [pg_bouncer][1] which can pool connections for you. As each connection consumes RAM, you should be looking to minimize their use.

---

## How to increase max connections

1. Increase `max_connection` and `shared_buffers`

in `/var/lib/pgsql/{version_number}/data/postgresql.conf`

change

```
    max_connections = 100
    shared_buffers = 24MB
```

to

```
    max_connections = 300
    shared_buffers = 80MB
```

The `shared_buffers` configuration parameter determines how much **memory** is **dedicated** to PostgreSQL to use for **caching data**.

- If you have a system with 1GB or more of RAM, a reasonable starting
  value for shared_buffers is 1/4 of the memory in your system.
- it's unlikely you'll find using more than 40% of RAM to work better
  than a smaller amount (like 25%)
- Be aware that if your system or PostgreSQL build is 32-bit, it might
  not be practical to set shared_buffers above 2 ~ 2.5GB.
- Note that on Windows, large values for shared_buffers aren't as
  effective, and you may find better results keeping it relatively low
  and using the OS cache more instead. On Windows the **useful range is
  64MB to 512MB**.

2. Change kernel.shmmax

You would need to increase kernel max segment size to be **slightly larger**
than the `shared_buffers`.

In file `/etc/sysctl.conf` set the parameter as shown below. It will take effect when `postgresql` reboots (The following line makes the kernel max to `96Mb`)

```
    kernel.shmmax=100663296
```

---

## References

[Postgres Max Connections And Shared Buffers][3]

[Tuning Your PostgreSQL Server][4]

[1]: https://wiki.postgresql.org/wiki/PgBouncer
[2]: http://community.southpawtech.com/content/how-increase-maximum-database-connection
[3]: https://web.archive.org/web/20170808144216/http://gabe.grayum.name/?p=postgres_max_connections_and_shared_buffers
[4]: https://wiki.postgresql.org/wiki/Tuning_Your_PostgreSQL_Server
