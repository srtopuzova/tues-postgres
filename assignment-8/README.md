# Assignment 8 — Classroom Inventory

## Decisions I made and why

I used three tables: `rooms` for the classroom names, `device_kinds` for kinds such as computers and monitors, and `devices` for each physical item. Each table has its own ID as the primary key; `inventory_number` is also `UNIQUE` because every sticker number must identify only one device, but I kept it separate from the primary key so relationships can use a simple numeric ID. The `room_id` in `devices` is a foreign key and can be `NULL` because some equipment is in storage; the kind and purchase date are required. I do not store a device's age or repeat room/kind names in every device row, because age changes over time and those names belong in their own tables.
