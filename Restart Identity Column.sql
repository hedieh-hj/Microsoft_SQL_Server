DO $$
BEGIN
    -- Reset the sequence associated with the ID column in the Menu table
    ALTER SEQUENCE "Menu_ID_seq" RESTART WITH 1;
END $$;
