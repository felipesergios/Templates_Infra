-- Show all session process into instance
SHOW FULL PROCESSLIST;

-- Count how many sessions have in your mysql instance in this moment
-- No Distinction
SELECT COUNT(*) FROM information_schema.PROCESSLIST;

-- View info about what users running into system
SELECT USER, HOST, DB, COMMAND,INFO, STATE FROM information_schema.PROCESSLIST;