-- Question 1: Show every device in a given room, grouped/sorted by kind.
-- Returns inventory number, kind, model, and purchase date for the selected room.
-- Change 'Room 101' to another room name when needed.
SELECT
    d.inventory_number,
    k.kind_name AS kind,
    d.model,
    d.purchase_date
FROM devices AS d
JOIN rooms AS r
    ON r.room_id = d.room_id
JOIN device_kinds AS k
    ON k.kind_id = d.kind_id
WHERE r.room_name = 'Room 101'
ORDER BY k.kind_name, d.inventory_number;


-- Question 2: Show equipment older than five years, oldest first.
-- Returns inventory number, kind, model, purchase date, and exact age as years/months/days.
SELECT
    d.inventory_number,
    k.kind_name AS kind,
    d.model,
    d.purchase_date,
    age(CURRENT_DATE, d.purchase_date) AS exact_age
FROM devices AS d
JOIN device_kinds AS k
    ON k.kind_id = d.kind_id
WHERE d.purchase_date < CURRENT_DATE - INTERVAL '5 years'
ORDER BY d.purchase_date ASC, d.inventory_number;
