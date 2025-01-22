-- how search in multipele columns
SELECT *
FROM "User"
WHERE to_tsvector('simple', "Username" || ' ' || "Firstname" || ' ' || "Lastname" ) @@ to_tsquery('هدیه');

--------

SELECT *
FROM "Permission"
WHERE to_tsvector('english', "Caption" || ' ' || "Name") @@ 
	  to_tsquery('english', 'کاربر & دریافت');

-- v2 and v1 are string values ()
SELECT *
FROM "UserBillingRequest"
WHERE to_tsvector('english', "Refer"::text || ' ' || "UserID") @@ 
	  to_tsquery('english', v2 || ' & ' || v1);