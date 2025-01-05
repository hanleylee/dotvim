" Vim syntax file
" Maintained at https://gist.github.com/Omnikron13/8cf68e947fe2d7f1bc73ed46661e9561
" Language:    SQLite
" Maintainer:  Joey Sabey <joey.sabey@gmx.com>
" Contributor: Martin Fixman <martinfixman at gmail dot com>
" Last Change: 2019-09-19
" Version:     0.4
" Updated for SQLite v3.29.0

" Description: List of keywords used by SQLite.
"
" Adapted From: sqlanywhere.vim on VimScript #498 by David Fishburn <dfishburn dot vim at gmail dot com>
"
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
"
if version < 600
syntax clear
elseif exists("b:current_syntax")
finish
endif

" Be case sensitive when matching keywords.
" This is contrary to SQLite's (and pretty much every SQL dialect) syntax, but
" it's in line with the usual conventions.  Also, having 'count' or 'sum' as
" column names is common enough to consider this.
syn case ignore

" SQLite keywords, as defined in http://sqlite.org/lang_keywords.html
syn keyword sqlKeyword ABORT
syn keyword sqlKeyword ACTION
syn keyword sqlKeyword ADD
syn keyword sqlKeyword AFTER
syn keyword sqlKeyword ALL
syn keyword sqlKeyword ALTER
syn keyword sqlKeyword ANALYZE
syn keyword sqlKeyword AND
syn keyword sqlKeyword AS
syn keyword sqlKeyword ASC
syn keyword sqlKeyword ATTACH
syn keyword sqlKeyword AUTOINCREMENT

syn keyword sqlKeyword BEFORE
syn keyword sqlKeyword BEGIN
syn keyword sqlKeyword BETWEEN
syn keyword sqlKeyword BY
syn keyword sqlKeyword CASCADE
syn keyword sqlKeyword CASE
syn keyword sqlKeyword CAST
syn keyword sqlKeyword CHECK
syn keyword sqlKeyword COLLATE
syn keyword sqlKeyword COLUMN

syn keyword sqlKeyword CASCADE
syn keyword sqlKeyword CASE
syn keyword sqlKeyword CAST
syn keyword sqlKeyword CHECK
syn keyword sqlKeyword COLLATE
syn keyword sqlKeyword COLUMN
syn keyword sqlKeyword COMMIT
syn keyword sqlKeyword CONFLICT
syn keyword sqlKeyword CONSTRAINT
syn keyword sqlKeyword CREATE
syn keyword sqlKeyword CROSS
syn keyword sqlKeyword CURRENT
syn keyword sqlKeyword CURRENT_DATE
syn keyword sqlKeyword CURRENT_TIME
syn keyword sqlKeyword CURRENT_TIMESTAMP

syn keyword sqlKeyword DATABASE
syn keyword sqlKeyword DEFAULT
syn keyword sqlKeyword DEFERRABLE
syn keyword sqlKeyword DEFERRED
syn keyword sqlKeyword DELETE
syn keyword sqlKeyword DESC
syn keyword sqlKeyword DETACH
syn keyword sqlKeyword DISTINCT
syn keyword sqlKeyword DO
syn keyword sqlKeyword DROP

syn keyword sqlKeyword EACH
syn keyword sqlKeyword ELSE
syn keyword sqlKeyword END
syn keyword sqlKeyword ESCAPE
syn keyword sqlKeyword EXCEPT
syn keyword sqlKeyword EXCLUDE
syn keyword sqlKeyword EXCLUSIVE
syn keyword sqlKeyword EXISTS
syn keyword sqlKeyword EXPLAIN

syn keyword sqlKeyword FAIL
syn keyword sqlKeyword FILTER
syn keyword sqlKeyword FOLLOWING
syn keyword sqlKeyword FOR
syn keyword sqlKeyword FOREIGN
syn keyword sqlKeyword FROM
syn keyword sqlKeyword FULL

syn keyword sqlKeyword GLOB
syn keyword sqlKeyword GROUP
syn keyword sqlKeyword GROUPS

syn keyword sqlKeyword HAVING

syn keyword sqlKeyword IF
syn keyword sqlKeyword IGNORE
syn keyword sqlKeyword IMMEDIATE
syn keyword sqlKeyword IN
syn keyword sqlKeyword INDEX
syn keyword sqlKeyword INDEXED
syn keyword sqlKeyword INITIALLY
syn keyword sqlKeyword INNER
syn keyword sqlKeyword INSERT
syn keyword sqlKeyword INSTEAD
syn keyword sqlKeyword INTERSECT
syn keyword sqlKeyword INTO
syn keyword sqlKeyword IS
syn keyword sqlKeyword ISNULL

syn keyword sqlKeyword JOIN

syn keyword sqlKeyword KEY

syn keyword sqlKeyword LEFT
syn keyword sqlKeyword LIKE
syn keyword sqlKeyword LIMIT

syn keyword sqlKeyword MATCH

syn keyword sqlKeyword NATURAL
syn keyword sqlKeyword NO
syn keyword sqlKeyword NOT
syn keyword sqlKeyword NOTHING
syn keyword sqlKeyword NOTNULL
syn keyword sqlKeyword NULL

syn keyword sqlKeyword OF
syn keyword sqlKeyword OFFSET
syn keyword sqlKeyword ON
syn keyword sqlKeyword OR
syn keyword sqlKeyword ORDER
syn keyword sqlKeyword OTHERS
syn keyword sqlKeyword OUTER
syn keyword sqlKeyword OVER

syn keyword sqlKeyword PARTITION
syn keyword sqlKeyword PLAN
syn keyword sqlKeyword PRAGMA
syn keyword sqlKeyword PRECEDING
syn keyword sqlKeyword PRIMARY

syn keyword sqlKeyword QUERY

syn keyword sqlKeyword RAISE
syn keyword sqlKeyword RANGE
syn keyword sqlKeyword RECURSIVE
syn keyword sqlKeyword REFERENCES
syn keyword sqlKeyword REGEXP
syn keyword sqlKeyword REINDEX
syn keyword sqlKeyword RELEASE
syn keyword sqlKeyword RENAME
syn keyword sqlKeyword REPLACE
syn keyword sqlKeyword RESTRICT
syn keyword sqlKeyword RIGHT
syn keyword sqlKeyword ROLLBACK
syn keyword sqlKeyword ROW
syn keyword sqlKeyword ROWS

syn keyword sqlKeyword SAVEPOINT
syn keyword sqlKeyword SELECT
syn keyword sqlKeyword SET

syn keyword sqlKeyword TABLE
syn keyword sqlKeyword TEMP
syn keyword sqlKeyword TEMPORARY
syn keyword sqlKeyword THEN
syn keyword sqlKeyword TIES
syn keyword sqlKeyword TO
syn keyword sqlKeyword TRANSACTION
syn keyword sqlKeyword TRIGGER

syn keyword sqlKeyword UNBOUNDED
syn keyword sqlKeyword UNION
syn keyword sqlKeyword UNIQUE
syn keyword sqlKeyword UPDATE
syn keyword sqlKeyword USING

syn keyword sqlKeyword VACUUM
syn keyword sqlKeyword VALUES
syn keyword sqlKeyword VIEW
syn keyword sqlKeyword VIRTUAL

syn keyword sqlKeyword WHEN
syn keyword sqlKeyword WHERE
syn keyword sqlKeyword WINDOW
syn keyword sqlKeyword WITH
syn keyword sqlKeyword WITHOUT

" SQLite core functions, as defined in http://sqlite.org/lang_corefunc.html
syn keyword sqlFunction ABS

syn keyword sqlFunction CHANGES
syn keyword sqlFunction CHAR
syn keyword sqlFunction COALESCE

syn keyword sqlFunction GLOB

syn keyword sqlFunction HEX

syn keyword sqlFunction IFNULL
syn keyword sqlFunction INSTR

syn keyword sqlFunction LAST_INSERT_ROWID
syn keyword sqlFunction LENGTH
syn keyword sqlFunction LIKE
syn keyword sqlFunction LIKELIHOOD
syn keyword sqlFunction LIKELY

syn keyword sqlFunction LOAD_EXTENSION
syn keyword sqlFunction LOWER
syn keyword sqlFunction LTRIM

syn keyword sqlFunction MAX
syn keyword sqlFunction MIN

syn keyword sqlFunction NULLIF

syn keyword sqlFunction PRINTF

syn keyword sqlFunction QUOTE

syn keyword sqlFunction RANDOM
syn keyword sqlFunction RANDOMBLOB
syn keyword sqlFunction REPLACE
syn keyword sqlFunction ROUND
syn keyword sqlFunction RTRIM

syn keyword sqlFunction SOUNDEX
syn keyword sqlFunction SQLITE_COMPILEOPTION_GET
syn keyword sqlFunction SQLITE_COMPILEOPTION_USED
syn keyword sqlFunction SQLITE_OFFSET
syn keyword sqlFunction SQLITE_SOURCE_ID
syn keyword sqlFunction SQLITE_VERSION
syn keyword sqlFunction SUBSTR

syn keyword sqlFunction TOTAL_CHANGES
syn keyword sqlFunction TRIM
syn keyword sqlFunction TYPEOF

syn keyword sqlFunction UNICODE
syn keyword sqlFunction UNLIKELY
syn keyword sqlFunction UPPER

syn keyword sqlFunction ZEROBLOB

" SQLite aggregate functions, as defined in http://sqlite.org/lang_aggfunc.html
syn keyword sqlFunction AVG
syn keyword sqlFunction COUNT
syn keyword sqlFunction GROUP_CONCAT
syn keyword sqlFunction MAX
syn keyword sqlFunction MIN
syn keyword sqlFunction SUM
syn keyword sqlFunction TOTAL

" SQLite date and time functions, as defined in http://sqlite.org/lang_datefunc.html
syn keyword sqlFunction DATE
syn keyword sqlFunction TIME
syn keyword sqlFunction DATETIME
syn keyword sqlFunction JULIANDAY
syn keyword sqlFunction STRFTIME

" SQLite default collation functions: https://www.sqlite.org/datatype3.html#collation
syn keyword sqlFunction BINARY
syn keyword sqlFunction NOCASE
syn keyword sqlFunction RTRIM

" SQLite datatypes, as defined in http://www.sqlite.org/datatype3.html
syn match sqlType '\<\(INT\|INTEGER\|TINYINT\|SMALLINT\|MEDIUMINT\|BIGINT\|UNSIGNED BIG INT\|INT2\|INT8\)\>'
syn match sqlType '\<\(CHARACTER\|VARCHAR\|VARYING CHARACTER\|NCHAR\|NATIVE CHARACTER\|NVARCHAR\|TEXT\|CLOB\)\>'
syn match sqlType '\<BLOB\>'
syn match sqlType '\<\(REAL\|DOUBLE\|DOUBLE PRECISION\|FLOAT\)\>'
syn match sqlType '\<\(NUMERIC\|DECIMAL\|BOOLEAN\|DATE\|DATETIME\)\>'

" SQLite command line options, as defined in http://www.sqlite.org/cli.html
syn match sqlOption '^\.archive'    " Manage SQL archives
syn match sqlOption '^\.auth'       " Show authorizer callbacks
syn match sqlOption '^\.backup'     " Backup DB (default 'main') to FILE
syn match sqlOption '^\.bail'       " Stop after hitting an error.  Default OFF
syn match sqlOption '^\.binary'     " Turn binary output on or off.  Default OFF
syn match sqlOption '^\.cd'         " Change the working directory to DIRECTORY
syn match sqlOption '^\.changes'    " Show number of rows changed by SQL
syn match sqlOption '^\.check'      " Fail if output since .testcase does not match
syn match sqlOption '^\.clone'      " Clone data into NEWDB from the existing database
syn match sqlOption '^\.databases'  " List names and files of attached databases
syn match sqlOption '^\.dbconfig'   " List or change sqlite3_db_config() options
syn match sqlOption '^\.dbinfo'     " Show status information about the database
syn match sqlOption '^\.dump'       " Render all database content as SQL
syn match sqlOption '^\.echo'       " Turn command echo on or off
syn match sqlOption '^\.eqp'        " Enable or disable automatic EXPLAIN QUERY PLAN
syn match sqlOption '^\.excel'      " Display the output of next command in a spreadsheet
syn match sqlOption '^\.exit'       " Exit this program with return-code CODE
syn match sqlOption '^\.expert'     " EXPERIMENTAL. Suggest indexes for specified queries
syn match sqlOption '^\.fullschema' " Show schema and the content of sqlite_stat tables
syn match sqlOption '^\.headers'    " Turn display of headers on or off
syn match sqlOption '^\.help'       " Show help text for PATTERN
syn match sqlOption '^\.import'     " Import data from FILE into TABLE
syn match sqlOption '^\.imposter'   " Create imposter table TABLE on index INDEX
syn match sqlOption '^\.indexes'    " Show names of indexes
syn match sqlOption '^\.iotrace'    " Enable I/O diagnostic logging to FILE
syn match sqlOption '^\.limit'      " Display or change the value of an SQLITE_LIMIT
syn match sqlOption '^\.lint'       " Report potential schema issues.
syn match sqlOption '^\.load'       " Load an extension library
syn match sqlOption '^\.log'        " Turn logging on or off.  FILE can be stderr/stdout
syn match sqlOption '^\.mode'       " Set output mode
syn match sqlOption '^\.nullvalue'  " Use STRING in place of NULL values
syn match sqlOption '^\.once'       " Output for the next SQL command only to FILE
syn match sqlOption '^\.open'       " Close existing database and reopen FILE
syn match sqlOption '^\.output'     " Send output to FILE or stdout if FILE is omitted
syn match sqlOption '^\.parameter'  " Manage SQL parameter bindings
syn match sqlOption '^\.print'      " Print literal STRING
syn match sqlOption '^\.progress'   " Invoke progress handler after every N opcodes
syn match sqlOption '^\.prompt'     " Replace the standard prompts
syn match sqlOption '^\.quit'       " Exit this program
syn match sqlOption '^\.read'       " Read input from FILE
syn match sqlOption '^\.restore'    " Restore content of DB (default 'main') from FILE
syn match sqlOption '^\.save'       " Write in-memory database into FILE
syn match sqlOption '^\.scanstats'  " Turn sqlite3_stmt_scanstatus() metrics on or off
syn match sqlOption '^\.schema'     " Show the CREATE statements matching PATTERN
syn match sqlOption '^\.selftest'   " Run tests defined in the SELFTEST table
syn match sqlOption '^\.separator'  " Change the column and row separators
syn match sqlOption '^\.session'    " Create or control sessions
syn match sqlOption '^\.sha3sum'    " Compute a SHA3 hash of database content
syn match sqlOption '^\.shell'      " Run CMD ARGS... in a system shell
syn match sqlOption '^\.show'       " Show the current values for various settings
syn match sqlOption '^\.stats'      " Show stats or turn stats on or off
syn match sqlOption '^\.system'     " Run CMD ARGS... in a system shell
syn match sqlOption '^\.tables'     " List names of tables matching LIKE pattern TABLE
syn match sqlOption '^\.testcase'   " Begin redirecting output to 'testcase-out.txt'
syn match sqlOption '^\.timeout'    " Try opening locked tables for MS milliseconds
syn match sqlOption '^\.timer'      " Turn SQL timer on or off
syn match sqlOption '^\.trace'      " Output each SQL statement as it is run
syn match sqlOption '^\.vfsinfo'    " Information about the top-level VFS
syn match sqlOption '^\.vfslist'    " List all available VFSes
syn match sqlOption '^\.vfsname'    " Print the name of the VFS stack
syn match sqlOption '^\.width'      " Set column widths for 'column' mode

" Strings and characters:
syn region sqlString start=+"+ end=+"+ contains=@Spell
syn region sqlString start=+'+ end=+'+ contains=@Spell

" Identifiers for binding values to arguments, as defined in http://www.sqlite.org/c3ref/bind_blob.html
syn match sqlNumber '?'
syn match sqlNumber '?[0-9]\{1,3\}' " Numeric IDs are 1-999 by default, but /may/ be higher
syn match sqlNumber '[:@$][a-zA-Z0-9_]\+' " TODO: find out actual restrictions on alphanumeric IDs

" Numbers:
syn match sqlNumber "-\=\<\d*\.\=[0-9_]\>"

" Comments:
syn region sqlHashComment  start=/#/    end=/$/   contains=@Spell
syn region sqlDashComment  start=/--/   end=/$/   contains=@Spell
syn region sqlSlashComment start=/\/\// end=/$/   contains=@Spell
syn region sqlMultiComment start="/\*"  end="\*/" contains=sqlMultiComment,@Spell
syn cluster sqlComment contains=sqlHashComment,sqlDashComment,sqlSlashComment,sqlMultiComment,@Spell
syn sync ccomment sqlComment
syn sync ccomment sqlHashComment
syn sync ccomment sqlDashComment
syn sync ccomment sqlSlashComment

" Special:
syn match sqlSpecial "[();*]"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_sql_syn_inits")
    if version < 508
        let did_sql_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi link <args>
    endif

    HiLink sqlHashComment  Comment
    HiLink sqlDashComment  Comment
    HiLink sqlSlashComment Comment
    HiLink sqlMultiComment Comment
    HiLink sqlNumber       Number
    HiLink sqlOperator     Operator
    HiLink sqlSpecial      Special
    HiLink sqlKeyword      Keyword
    HiLink sqlStatement    Statement
    HiLink sqlString       String
    HiLink sqlType         Type
    HiLink sqlFunction     Function
    HiLink sqlOption       PreProc

    delcommand HiLink
endif

let b:current_syntax = "sqlite"

" vim:sw=4:
