(*
 * Any characters between two dashes “--” and the next newline
 * (or EOF, if there is no next newline) are treated as comments
 *)
-- This is a comment ending with newline

-- The below comment contains null character. But it shouldn't report any ERROR
-- Here is your null   character 

-- as only hello is in between "--" and next newline, it is the only line comment and 'world' should be tokenised
-- Hello
world

-- The below is not a comment as another '-' is missing and it wii be treated as a MINUS token
 - Hi! I'm Mahesh           

-- -- this is also a comment 

-- The below is a comment that contains an newline character('\n'). The whole line should be treated as comment 
-- This comment contains a newline character \n here.

-- The below is a comment ending with EOF. This shouldn't report any ERROR
-- The EOF appears to be here.