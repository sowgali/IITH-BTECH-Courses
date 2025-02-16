-- Comments inside a string shouldn't be skipped
"This is a string (* This should not be skipped as a comment *) "
"This is a string -- This should not be skipped as a comment"


-- Strings inside comments shouldn't be tokenised as STR_CONST
-- This is a comment "This should not be identified as string"
(* 
    This is a comment 
    "This should not be identified as string" 
*)


(*
 * The operators inside the strings should not be recognised as operators
 *)
"=>():@;,+-*/~<-={}<<=.abcdefghijklmnopqrstuvwxyz0123456789"
"\~\`\!\@\#\$\%\^\&\*\(\)\_\-\+\=\|\\\}\]\{\[\"\'\:\;\?\/\>\.\<\,\a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z\0\1\2\3\4\5\6\7\8\9"


(*
 * The keywords inside the strings should not be recoginsed as keywords
 *)
"CASE"
"ClaSS"
"True"
"falSe"


(*
 * Operators and keywords inside the comments has to be skipped
 *)
-- Checking in line comments
-- =>():@;,+-*/~<-={}<<=.abcdefghijklmnopqrstuvwxyz0123456789
-- \~\`\!\@\#\$\%\^\&\*\(\)\_\-\+\=\|\\\}\]\{\[\"\'\:\;\?\/\>\.\<\,\a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z\0\1\2\3\4\5\6\7\8\9
-- CASE
-- class

-- Checking in block comments
(*
    =>():@;,+-*/~<-={}<<=.abcdefghijklmnopqrstuvwxyz0123456789
    \~\`\!\@\#\$\%\^\&\*\(\)\_\-\+\=\|\\\}\]\{\[\"\'\:\;\?\/\>\.\<\,\a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z\0\1\2\3\4\5\6\7\8\9
    CASE
    class
*)


(*
 * Multiple escaped new line must be identified
 *)
-- all lines contains escaped newline character - No error
"This \
string contains \
multiple escaped \
newlines"

-- Unterminated string in line 59. continue lexing from line 60.
"This is escaped\
This is not escaped\\
lexing resumes\
"

-- all line contains unescaped newline character. Unterminated string error at line 64 and lexing resumes from line 65
"This is
unescaped
newline
"

-- lines contain multiple backslashes but all contain escaped newline characters
"This contains \
unescaped \\\\\
characters\\\
"

-- lines contains multiple backslashes. Line 77 contains unescaped newline. continue lexing from 78th line.
"This is escaped \\\
not escaped \\\\
lexing continues
"

-- lines contain null character and escaped new lines. continue lexing from 85th line. report error as "String contains null character".
"this is escaped\
null character \\\
but this is included in string"

-- lines contain null character and unescaped new lines. continue lexing from 90th line. report error as "String contains null character".
"this is escaped\
null character  \
this is unescaped\\
lexing continues"

-- LONG STRING CONTAINING EOF, NULL CHARACTER,ESCAPED NULL CHARACTER - As null character is first checked it should report error as "String contains null character".
"aaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\ aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaThis string contains EOF