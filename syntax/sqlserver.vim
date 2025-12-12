" Vim syntax file
"
" Language:     SQL Server 2008 TSQL
" Maintainer:   Ben Hoffstein <benjamin.hoffstein AT red-hook.com>
" Last Change:  2009-01-13
" Version:      1.0.2
"
" Hint: Type zR if you don't know how to use folds
"
" Options:
"
" For all options, set variable to 1 to enable (the default)
" or 0 to disable.
"
" To highlight future keywords (as defined by Microsoft):
" sqlserver_highlight_future
"
" To highlight system stored procedures:
" sqlserver_highlight_system_procs
"
" To highlight system variables:
" sqlserver_highlight_system_vars
"
" To highlight server options:
" sqlserver_highlight_server_opts

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Always ignore case
syn case ignore

" Option defaults {{{
if !exists("sqlserver_highlight_future")
    let sqlserver_highlight_future = 1
endif
if !exists("sqlserver_highlight_system_procs")
    let sqlserver_highlight_system_procs = 1
endif
if !exists("sqlserver_highlight_system_vars")
    let sqlserver_highlight_system_vars = 1
endif
if !exists("sqlserver_highlight_server_opts")
    let sqlserver_highlight_server_opts = 1
endif
" }}}

" TSQL keywords {{{
syn keyword tsqlKeyword add all and any as asc authorization
syn keyword tsqlKeyword backup begin between break browse bulk by
syn keyword tsqlKeyword cascade case check checkpoint close
syn keyword tsqlKeyword clustered collate column commit
syn keyword tsqlKeyword compute constraint
syn keyword tsqlKeyword continue cross current
syn keyword tsqlKeyword current_date current_time current_timestamp
syn keyword tsqlKeyword current_user cursor
syn keyword tsqlKeyword database dbcc deallocate declare default
syn keyword tsqlKeyword delete deny desc disk distinct distributed
syn keyword tsqlKeyword double dump
syn match tsqlKeyword "\<day\>"
syn match tsqlKeyword "\<drop\>"
syn keyword tsqlKeyword else end errlvl escape except exec execute
syn keyword tsqlKeyword exists exit external
syn keyword tsqlKeyword fetch file fillfactor for foreign freetext
syn keyword tsqlKeyword from full function
syn keyword tsqlKeyword goto grant group
syn keyword tsqlKeyword having holdlock
syn keyword tsqlKeyword identity identitycol if in
syn keyword tsqlKeyword index inner insert intersect into is
syn keyword tsqlKeyword join
syn keyword tsqlKeyword key kill
syn keyword tsqlKeyword like lineno load
syn match tsqlKeyword "\<left\>"
syn keyword tsqlKeyword merge
syn match tsqlKeyword "\<month\>"
syn keyword tsqlKeyword national nocheck nonclustered not null
syn keyword tsqlKeyword of off offsets on open
syn keyword tsqlKeyword option or
syn keyword tsqlKeyword order outer over
syn keyword tsqlKeyword percent pivot plan precision primary print
syn keyword tsqlKeyword proc procedure public
syn keyword tsqlKeyword raiserror read readtext reconfigure
syn keyword tsqlKeyword references replication restore restrict
syn keyword tsqlKeyword return revert revoke rollback
syn match tsqlKeyword "\<right\>"
syn keyword tsqlKeyword rowguidcol rule
syn keyword tsqlKeyword save schema securityaudit select
syn keyword tsqlKeyword setuser shutdown some
syn keyword tsqlKeyword statistics
syn keyword tsqlKeyword tablesample textsize then to top
syn keyword tsqlKeyword tran transaction trigger tsequal
syn match tsqlKeyword "\<truncate\>"
syn keyword tsqlKeyword union unique unpivot updatetext
syn match tsqlKeyword "\<update\>"
syn keyword tsqlKeyword use user
syn keyword tsqlKeyword values varying view
syn keyword tsqlKeyword waitfor when where while with writetext
syn match tsqlKeyword "\<year\>"
" }}}

" odbc keywords {{{
syn keyword odbcKeyword absolute action ada add all allocate
syn keyword odbcKeyword and any are as asc assertion
syn keyword odbcKeyword at authorization
syn match odbcKeyword "\<alter\>"
syn keyword odbcKeyword begin between bit bit_length both by
syn keyword odbcKeyword cascade cascaded case catalog
syn keyword odbcKeyword char_length character
syn keyword odbcKeyword character_length check close
syn keyword odbcKeyword collate collation column
syn keyword odbcKeyword commit connect connection constraint
syn keyword odbcKeyword constraints continue
syn keyword odbcKeyword corresponding cross
syn match odbcKeyword "\<create\>"
syn keyword odbcKeyword current current_date current_time
syn keyword odbcKeyword current_timestamp current_user cursor
syn keyword odbcKeyword date deallocate dec decimal
syn keyword odbcKeyword declare default deferrable deferred
syn keyword odbcKeyword delete desc describe descriptor
syn keyword odbcKeyword diagnostics disconnect distinct
syn keyword odbcKeyword domain double
syn keyword odbcKeyword else end end-exec escape except
syn keyword odbcKeyword exception exec execute exists
syn keyword odbcKeyword external extract
syn keyword odbcKeyword false fetch first float for foreign
syn keyword odbcKeyword fortran found from full
syn keyword odbcKeyword get global go goto grant group
syn keyword odbcKeyword having hour
syn keyword odbcKeyword identity immediate in include index
syn keyword odbcKeyword indicator initially inner input
syn keyword odbcKeyword insensitive insert int integer
syn keyword odbcKeyword intersect interval into is isolation
syn keyword odbcKeyword join
syn keyword odbcKeyword key
syn keyword odbcKeyword language last leading level
syn keyword odbcKeyword like local
syn keyword odbcKeyword match minute module
syn keyword odbcKeyword names national natural next
syn keyword odbcKeyword no none not null numeric
syn keyword odbcKeyword octet_length of on only open option
syn keyword odbcKeyword or order outer output overlaps
syn keyword odbcKeyword pad partial pascal position
syn keyword odbcKeyword precision prepare preserve primary
syn keyword odbcKeyword prior privileges procedure public
syn keyword odbcKeyword real references relative
syn keyword odbcKeyword restrict revoke rollback rows
syn keyword odbcKeyword schema scroll second section select
syn keyword odbcKeyword session size
syn keyword odbcKeyword smallint some sql sqlca
syn keyword odbcKeyword sqlcode sqlerror sqlstate sqlwarning
syn match odbcKeyword "\<set\>"
syn keyword odbcKeyword temporary then time timestamp
syn keyword odbcKeyword timezone_hour timezone_minute to
syn keyword odbcKeyword trailing transaction translate
syn keyword odbcKeyword translation trim true
syn keyword odbcKeyword union unique unknown
syn keyword odbcKeyword usage user using
syn keyword odbcKeyword value values varchar varying view
syn keyword odbcKeyword when whenever where with work write
syn keyword odbcKeyword zone
" }}}

" Future keywords (as defined by Microsoft) {{{
if exists("sqlserver_highlight_future") && sqlserver_highlight_future != 0
    syn keyword futureKeyword absolute action admin after aggregate
    syn keyword futureKeyword alias allocate are array asensitive
    syn keyword futureKeyword assertion asymmetric at atomic
    syn keyword futureKeyword before binary bit blob boolean
    syn keyword futureKeyword both breadth
    syn keyword futureKeyword call called cardinality cascaded
    syn keyword futureKeyword catalog character class clob
    syn keyword futureKeyword collation collect completion condition
    syn keyword futureKeyword connect connection constraints
    syn keyword futureKeyword constructor corr corresponding
    syn keyword futureKeyword covar_pop covar_samp cube cume_dist
    syn keyword futureKeyword current_catalog
    syn keyword futureKeyword current_default_transform_group
    syn keyword futureKeyword current_path current_role current_schema
    syn keyword futureKeyword current_transform_group_for_type cycle
    syn keyword futureKeyword data date dec decimal deferrable
    syn keyword futureKeyword deferred depth deref describe
    syn keyword futureKeyword descriptor destroy destructor
    syn keyword futureKeyword deterministic diagnostics dictionary
    syn keyword futureKeyword disconnect domain dynamic
    syn keyword futureKeyword each element end-exec equals every
    syn keyword futureKeyword exception
    syn keyword futureKeyword false filter first float found free
    syn keyword futureKeyword fulltexttable fusion
    syn keyword futureKeyword general get global go
    syn keyword futureKeyword hold host hour
    syn keyword futureKeyword ignore immediate indicator initialize
    syn keyword futureKeyword initially inout input int integer
    syn keyword futureKeyword intersection interval isolation
    syn keyword futureKeyword iterate
    syn keyword futureKeyword language large last lateral leading
    syn keyword futureKeyword less level like_regex limit ln
    syn keyword futureKeyword local localtime localtimestamp
    syn keyword futureKeyword locator
    syn keyword futureKeyword map match member method minute
    syn keyword futureKeyword mod modifies modify module
    syn keyword futureKeyword multiset
    syn keyword futureKeyword names natural nclob new
    syn keyword futureKeyword next no none normalize numeric
    syn keyword futureKeyword object occurrences_regex old
    syn keyword futureKeyword only operation ordinality
    syn keyword futureKeyword out output overlay
    syn keyword futureKeyword pad parameter parameters partial
    syn keyword futureKeyword partition path percent_rank
    syn keyword futureKeyword percentile_cont percentile_disc
    syn keyword futureKeyword position_regex postfix prefix
    syn keyword futureKeyword preorder prepare preserve
    syn keyword futureKeyword prior privileges
    syn keyword futureKeyword range reads real recursive ref
    syn keyword futureKeyword referencing regr_avgx regr_avgy
    syn keyword futureKeyword regr_count regr_intercept regr_r2
    syn keyword futureKeyword regr_slope regr_sxx regr_sxy
    syn keyword futureKeyword regr_syy relative release result
    syn keyword futureKeyword returns role rollup routine row
    syn keyword futureKeyword rows
    syn keyword futureKeyword savepoint scope scroll search
    syn keyword futureKeyword second section sensitive sequence
    syn keyword futureKeyword session sets similar size smallint
    syn keyword futureKeyword specific specifictype sql
    syn keyword futureKeyword sqlexception sqlstate sqlwarning
    syn keyword futureKeyword start state statement static
    syn keyword futureKeyword stddev_pop stddev_samp structure
    syn keyword futureKeyword submultiset substring_regex
    syn keyword futureKeyword symmetric system
    syn keyword futureKeyword temporary terminate than time
    syn keyword futureKeyword timestamp timezone_hour
    syn keyword futureKeyword timezone_minute trailing
    syn keyword futureKeyword translate_regex translation
    syn keyword futureKeyword treat true
    syn keyword futureKeyword uescape under unknown unnest
    syn keyword futureKeyword usage using
    syn keyword futureKeyword value var_pop var_samp varchar
    syn keyword futureKeyword variable
    syn keyword futureKeyword whenever width_bucket window
    syn keyword futureKeyword within without work write
    syn keyword futureKeyword xmlagg xmlattributes xmlbinary
    syn keyword futureKeyword xmlcast xmlcomment xmlconcat
    syn keyword futureKeyword xmldocument xmlelement xmlexists
    syn keyword futureKeyword xmlforest xmliterate
    syn keyword futureKeyword xmlnamespaces xmlparse xmlpi
    syn keyword futureKeyword xmlquery xmlserialize xmltable
    syn keyword futureKeyword xmltext xmlvalidate
    syn keyword futureKeyword zone
endif
" }}}

" Undocumented keywords {{{
syn keyword undocumentedKeyword persisted openxml
" }}}

" System stored procedures {{{
if exists("sqlserver_highlight_system_procs") && sqlserver_highlight_system_procs != 0
    syn keyword systemProc sp_ActiveDirectory_Obj
    syn keyword systemProc sp_ActiveDirectory_SCP
    syn keyword systemProc sp_add_agent_parameter
    syn keyword systemProc sp_add_agent_profile
    syn keyword systemProc sp_add_alert
    syn keyword systemProc sp_add_category
    syn keyword systemProc sp_add_data_file_recover_suspect_db
    syn keyword systemProc sp_add_job
    syn keyword systemProc sp_add_jobschedule
    syn keyword systemProc sp_add_jobserver
    syn keyword systemProc sp_add_jobstep
    syn keyword systemProc sp_add_log_file_recover_suspect_db
    syn keyword systemProc sp_add_log_shipping_alert_job
    syn keyword systemProc sp_add_log_shipping_primary_database
    syn keyword systemProc sp_add_log_shipping_primary_secondary
    syn keyword systemProc sp_add_log_shipping_secondary_database
    syn keyword systemProc sp_add_log_shipping_secondary_primary
    syn keyword systemProc sp_add_maintenance_plan
    syn keyword systemProc sp_add_maintenance_plan_db
    syn keyword systemProc sp_add_maintenance_plan_job
    syn keyword systemProc sp_add_notification
    syn keyword systemProc sp_add_operator
    syn keyword systemProc sp_add_schedule
    syn keyword systemProc sp_add_targetservergroup
    syn keyword systemProc sp_add_targetsvrgrp_member
    syn keyword systemProc sp_addapprole
    syn keyword systemProc sp_addarticle
    syn keyword systemProc sp_adddistpublisher
    syn keyword systemProc sp_adddistributiondb
    syn keyword systemProc sp_adddistributor
    syn keyword systemProc sp_adddynamicsnapshot_job
    syn keyword systemProc sp_addextendedproc
    syn keyword systemProc sp_addextendedproperty
    syn keyword systemProc sp_addlinkedserver
    syn keyword systemProc sp_addlinkedsrvlogin
    syn keyword systemProc sp_addlinkedsrvlogin
    syn keyword systemProc sp_addlogin
    syn keyword systemProc sp_addlogreader_agent
    syn keyword systemProc sp_addmergealternatepublisher
    syn keyword systemProc sp_addmergearticle
    syn keyword systemProc sp_addmergefilter
    syn keyword systemProc sp_addmergepartition
    syn keyword systemProc sp_addmergepublication
    syn keyword systemProc sp_addmergepullsubscription
    syn keyword systemProc sp_addmergepullsubscription_agent
    syn keyword systemProc sp_addmergepushsubscription_agent
    syn keyword systemProc sp_addmergesubscription
    syn keyword systemProc sp_addmessage
    syn keyword systemProc sp_addpublication
    syn keyword systemProc sp_addpublication_snapshot
    syn keyword systemProc sp_addpullsubscription
    syn keyword systemProc sp_addpullsubscription_agent
    syn keyword systemProc sp_addpushsubscription_agent
    syn keyword systemProc sp_addqreader_agent
    syn keyword systemProc sp_addqueued_artinfo
    syn keyword systemProc sp_addremotelogin
    syn keyword systemProc sp_addrole
    syn keyword systemProc sp_addrolemember
    syn keyword systemProc sp_addscriptexec
    syn keyword systemProc sp_addserver
    syn keyword systemProc sp_addsrvrolemember
    syn keyword systemProc sp_addsubscriber
    syn keyword systemProc sp_addsubscriber_schedule
    syn keyword systemProc sp_addsubscription
    syn keyword systemProc sp_addsynctriggers
    syn keyword systemProc sp_addtabletocontents
    syn keyword systemProc sp_addtype
    syn keyword systemProc sp_addumpdevice
    syn keyword systemProc sp_adduser
    syn keyword systemProc sp_adjustpublisheridentityrange
    syn keyword systemProc sp_altermessage
    syn keyword systemProc sp_apply_job_to_targets
    syn keyword systemProc sp_approlepassword
    syn keyword systemProc sp_article_validation
    syn keyword systemProc sp_articlecolumn
    syn keyword systemProc sp_articlefilter
    syn keyword systemProc sp_articleview
    syn keyword systemProc sp_assemblies_rowset
    syn keyword systemProc sp_assemblies_rowset_rmt
    syn keyword systemProc sp_assemblies_rowset2
    syn keyword systemProc sp_assembly_dependencies_rowset
    syn keyword systemProc sp_assembly_dependencies_rowset_rmt
    syn keyword systemProc sp_assembly_dependencies_rowset2
    syn keyword systemProc sp_attach_db
    syn keyword systemProc sp_attach_schedule
    syn keyword systemProc sp_attach_single_file_db
    syn keyword systemProc sp_attachsubscription
    syn keyword systemProc sp_autostats
    syn keyword systemProc sp_bcp_dbcmptlevel
    syn keyword systemProc sp_bindefault
    syn keyword systemProc sp_bindrule
    syn keyword systemProc sp_bindsession
    syn keyword systemProc sp_browsemergesnapshotfolder
    syn keyword systemProc sp_browsereplcmds
    syn keyword systemProc sp_browsesnapshotfolder
    syn keyword systemProc sp_catalogs
    syn keyword systemProc sp_catalogs
    syn keyword systemProc sp_catalogs_rowset
    syn keyword systemProc sp_catalogs_rowset;2
    syn keyword systemProc sp_catalogs_rowset;5
    syn keyword systemProc sp_catalogs_rowset_rmt
    syn keyword systemProc sp_catalogs_rowset2
    syn keyword systemProc sp_certify_removable
    syn keyword systemProc sp_change_agent_parameter
    syn keyword systemProc sp_change_agent_profile
    syn keyword systemProc sp_change_log_shipping_primary_database
    syn keyword systemProc sp_change_log_shipping_secondary_database
    syn keyword systemProc sp_change_log_shipping_secondary_primary
    syn keyword systemProc sp_change_subscription_properties
    syn keyword systemProc sp_change_users_login
    syn keyword systemProc sp_changearticle
    syn keyword systemProc sp_changearticlecolumndatatype
    syn keyword systemProc sp_changedbowner
    syn keyword systemProc sp_changedistpublisher
    syn keyword systemProc sp_changedistributiondb
    syn keyword systemProc sp_changedistributor_password
    syn keyword systemProc sp_changedistributor_property
    syn keyword systemProc sp_changedynamicsnapshot_job
    syn keyword systemProc sp_changelogreader_agent
    syn keyword systemProc sp_changemergearticle
    syn keyword systemProc sp_changemergefilter
    syn keyword systemProc sp_changemergepublication
    syn keyword systemProc sp_changemergepullsubscription
    syn keyword systemProc sp_changemergesubscription
    syn keyword systemProc sp_changeobjectowner
    syn keyword systemProc sp_changepublication
    syn keyword systemProc sp_changepublication_snapshot
    syn keyword systemProc sp_changeqreader_agent
    syn keyword systemProc sp_changereplicationserverpasswords
    syn keyword systemProc sp_changesubscriber
    syn keyword systemProc sp_changesubscriber_schedule
    syn keyword systemProc sp_changesubscription
    syn keyword systemProc sp_changesubscriptiondtsinfo
    syn keyword systemProc sp_changesubstatus
    syn keyword systemProc sp_check_constbytable_rowset
    syn keyword systemProc sp_check_constbytable_rowset;2
    syn keyword systemProc sp_check_constbytable_rowset2
    syn keyword systemProc sp_check_constraints_rowset
    syn keyword systemProc sp_check_constraints_rowset;2
    syn keyword systemProc sp_check_constraints_rowset2
    syn keyword systemProc sp_check_dynamic_filters
    syn keyword systemProc sp_check_for_sync_trigger
    syn keyword systemProc sp_check_join_filter
    syn keyword systemProc sp_check_subset_filter
    syn keyword systemProc sp_cleanup_log_shipping_history
    syn keyword systemProc sp_column_privileges
    syn keyword systemProc sp_column_privileges
    syn keyword systemProc sp_column_privileges_ex
    syn keyword systemProc sp_column_privileges_ex
    syn keyword systemProc sp_column_privileges_rowset
    syn keyword systemProc sp_column_privileges_rowset;2
    syn keyword systemProc sp_column_privileges_rowset;5
    syn keyword systemProc sp_column_privileges_rowset_rmt
    syn keyword systemProc sp_column_privileges_rowset2
    syn keyword systemProc sp_columns
    syn keyword systemProc sp_columns
    syn keyword systemProc sp_columns_90
    syn keyword systemProc sp_columns_90_rowset
    syn keyword systemProc sp_columns_90_rowset_rmt
    syn keyword systemProc sp_columns_90_rowset2
    syn keyword systemProc sp_columns_ex
    syn keyword systemProc sp_columns_ex
    syn keyword systemProc sp_columns_ex_90
    syn keyword systemProc sp_columns_rowset
    syn keyword systemProc sp_columns_rowset;2
    syn keyword systemProc sp_columns_rowset;5
    syn keyword systemProc sp_columns_rowset_rmt
    syn keyword systemProc sp_columns_rowset2
    syn keyword systemProc sp_configure
    syn keyword systemProc sp_configure_peerconflictdetection
    syn keyword systemProc sp_constr_col_usage_rowset
    syn keyword systemProc sp_control_plan_guide
    syn keyword systemProc sp_copymergesnapshot
    syn keyword systemProc sp_copysnapshot
    syn keyword systemProc sp_copysubscription
    syn keyword systemProc sp_create_plan_guide
    syn keyword systemProc sp_create_plan_guide_from_handle
    syn keyword systemProc sp_create_removable
    syn keyword systemProc sp_createstats
    syn keyword systemProc sp_cursor
    syn keyword systemProc sp_cursorclose
    syn keyword systemProc sp_cursorexecute
    syn keyword systemProc sp_cursorfetch
    syn keyword systemProc sp_cursoropen
    syn keyword systemProc sp_cursoroption
    syn keyword systemProc sp_cursorprepare
    syn keyword systemProc sp_cursorunprepare
    syn keyword systemProc sp_cycle_agent_errorlog
    syn keyword systemProc sp_cycle_errorlog
    syn keyword systemProc sp_cycle_errorlog
    syn keyword systemProc sp_databases
    syn keyword systemProc sp_databases
    syn keyword systemProc sp_datatype_info
    syn keyword systemProc sp_datatype_info
    syn keyword systemProc sp_datatype_info_90
    syn keyword systemProc sp_dbcmptlevel
    syn keyword systemProc sp_dbfixedrolepermission
    syn keyword systemProc sp_dbmmonitoraddmonitoring
    syn keyword systemProc sp_dbmmonitorchangealert
    syn keyword systemProc sp_dbmmonitorchangemonitoring
    syn keyword systemProc sp_dbmmonitordropalert
    syn keyword systemProc sp_dbmmonitordropmonitoring
    syn keyword systemProc sp_dbmmonitorhelpalert
    syn keyword systemProc sp_dbmmonitorhelpmonitoring
    syn keyword systemProc sp_dbmmonitorresults
    syn keyword systemProc sp_dboption
    syn keyword systemProc sp_dbremove
    syn keyword systemProc sp_ddopen;1
    syn keyword systemProc sp_ddopen;10
    syn keyword systemProc sp_ddopen;11
    syn keyword systemProc sp_ddopen;12
    syn keyword systemProc sp_ddopen;13
    syn keyword systemProc sp_ddopen;2
    syn keyword systemProc sp_ddopen;3
    syn keyword systemProc sp_ddopen;4
    syn keyword systemProc sp_ddopen;5
    syn keyword systemProc sp_ddopen;6
    syn keyword systemProc sp_ddopen;7
    syn keyword systemProc sp_ddopen;8
    syn keyword systemProc sp_ddopen;9
    syn keyword systemProc sp_defaultdb
    syn keyword systemProc sp_defaultlanguage
    syn keyword systemProc sp_delete_alert
    syn keyword systemProc sp_delete_backuphistory
    syn keyword systemProc sp_delete_category
    syn keyword systemProc sp_delete_job
    syn keyword systemProc sp_delete_jobschedule
    syn keyword systemProc sp_delete_jobserver
    syn keyword systemProc sp_delete_jobstep
    syn keyword systemProc sp_delete_jobsteplog
    syn keyword systemProc sp_delete_log_shipping_alert_job
    syn keyword systemProc sp_delete_log_shipping_primary_database
    syn keyword systemProc sp_delete_log_shipping_primary_secondary
    syn keyword systemProc sp_delete_log_shipping_secondary_database
    syn keyword systemProc sp_delete_log_shipping_secondary_primary
    syn keyword systemProc sp_delete_maintenance_plan
    syn keyword systemProc sp_delete_maintenance_plan_db
    syn keyword systemProc sp_delete_maintenance_plan_job
    syn keyword systemProc sp_delete_notification
    syn keyword systemProc sp_delete_operator
    syn keyword systemProc sp_delete_proxy
    syn keyword systemProc sp_delete_schedule
    syn keyword systemProc sp_delete_targetserver
    syn keyword systemProc sp_delete_targetservergroup
    syn keyword systemProc sp_delete_targetsvrgrp_member
    syn keyword systemProc sp_deletemergeconflictrow
    syn keyword systemProc sp_deletepeerrequesthistory
    syn keyword systemProc sp_deletetracertokenhistory
    syn keyword systemProc sp_denylogin
    syn keyword systemProc sp_depends
    syn keyword systemProc sp_detach_db
    syn keyword systemProc sp_detach_schedule
    syn keyword systemProc sp_drop_agent_parameter
    syn keyword systemProc sp_drop_agent_profile
    syn keyword systemProc sp_dropalias
    syn keyword systemProc sp_dropanonymousagent
    syn keyword systemProc sp_dropapprole
    syn keyword systemProc sp_droparticle
    syn keyword systemProc sp_dropdevice
    syn keyword systemProc sp_dropdistpublisher
    syn keyword systemProc sp_dropdistributiondb
    syn keyword systemProc sp_dropdistributor
    syn keyword systemProc sp_dropdynamicsnapshot_job
    syn keyword systemProc sp_dropextendedproc
    syn keyword systemProc sp_dropextendedproperty
    syn keyword systemProc sp_droplinkedsrvlogin
    syn keyword systemProc sp_droplinkedsrvlogin
    syn keyword systemProc sp_droplogin
    syn keyword systemProc sp_dropmergealternatepublisher
    syn keyword systemProc sp_dropmergearticle
    syn keyword systemProc sp_dropmergefilter
    syn keyword systemProc sp_dropmergepartition
    syn keyword systemProc sp_dropmergepublication
    syn keyword systemProc sp_dropmergepullsubscription
    syn keyword systemProc sp_dropmergesubscription
    syn keyword systemProc sp_dropmessage
    syn keyword systemProc sp_droppublication
    syn keyword systemProc sp_droppullsubscription
    syn keyword systemProc sp_dropremotelogin
    syn keyword systemProc sp_droprolemember
    syn keyword systemProc sp_dropserver
    syn keyword systemProc sp_dropserver
    syn keyword systemProc sp_dropsrvrolemember
    syn keyword systemProc sp_dropsubscriber
    syn keyword systemProc sp_dropsubscription
    syn keyword systemProc sp_droptype
    syn keyword systemProc sp_dropuser
    syn keyword systemProc sp_dsninfo
    syn keyword systemProc sp_enum_login_for_proxy
    syn keyword systemProc sp_enum_proxy_for_subsystem
    syn keyword systemProc sp_enum_sqlagent_subsystems
    syn keyword systemProc sp_enumcustomresolvers
    syn keyword systemProc sp_enumdsn
    syn keyword systemProc sp_enumeratependingschemachanges
    syn keyword systemProc sp_execute
    syn keyword systemProc sp_executesql
    syn keyword systemProc sp_expired_subscription_cleanup
    syn keyword systemProc sp_fkeys
    syn keyword systemProc sp_fkeys
    syn keyword systemProc sp_foreign_keys_rowset
    syn keyword systemProc sp_foreign_keys_rowset;2
    syn keyword systemProc sp_foreign_keys_rowset;3
    syn keyword systemProc sp_foreign_keys_rowset;5
    syn keyword systemProc sp_foreign_keys_rowset_rmt
    syn keyword systemProc sp_foreign_keys_rowset2
    syn keyword systemProc sp_foreign_keys_rowset3
    syn keyword systemProc sp_foreignkeys
    syn keyword systemProc sp_foreignkeys
    syn keyword systemProc sp_generatefilters
    syn keyword systemProc sp_get_distributor
    syn keyword systemProc sp_getagentparameterlist
    syn keyword systemProc sp_getapplock
    syn keyword systemProc sp_getbindtoken
    syn keyword systemProc sp_getdefaultdatatypemapping
    syn keyword systemProc sp_getmergedeletetype
    syn keyword systemProc sp_getqueuedrows
    syn keyword systemProc sp_getsubscriptiondtspackagename
    syn keyword systemProc sp_gettopologyinfo
    syn keyword systemProc sp_grant_login_to_proxy
    syn keyword systemProc sp_grant_proxy_to_subsystem
    syn keyword systemProc sp_grant_publication_access
    syn keyword systemProc sp_grantdbaccess
    syn keyword systemProc sp_grantlogin
    syn keyword systemProc sp_help
    syn keyword systemProc sp_help_agent_default
    syn keyword systemProc sp_help_agent_parameter
    syn keyword systemProc sp_help_agent_profile
    syn keyword systemProc sp_help_alert
    syn keyword systemProc sp_help_category
    syn keyword systemProc sp_help_downloadlist
    syn keyword systemProc sp_help_job
    syn keyword systemProc sp_help_jobactivity
    syn keyword systemProc sp_help_jobcount
    syn keyword systemProc sp_help_jobhistory
    syn keyword systemProc sp_help_jobs_in_schedule
    syn keyword systemProc sp_help_jobschedule
    syn keyword systemProc sp_help_jobserver
    syn keyword systemProc sp_help_jobstep
    syn keyword systemProc sp_help_jobsteplog
    syn keyword systemProc sp_help_log_shipping_alert_job
    syn keyword systemProc sp_help_log_shipping_monitor
    syn keyword systemProc sp_help_log_shipping_monitor_primary
    syn keyword systemProc sp_help_log_shipping_monitor_secondary
    syn keyword systemProc sp_help_log_shipping_primary_database
    syn keyword systemProc sp_help_log_shipping_primary_secondary
    syn keyword systemProc sp_help_log_shipping_secondary_database
    syn keyword systemProc sp_help_log_shipping_secondary_primary
    syn keyword systemProc sp_help_maintenance_plan
    syn keyword systemProc sp_help_notification
    syn keyword systemProc sp_help_operator
    syn keyword systemProc sp_help_peerconflictdetection
    syn keyword systemProc sp_help_proxy
    syn keyword systemProc sp_help_publication_access
    syn keyword systemProc sp_help_schedule
    syn keyword systemProc sp_help_targetserver
    syn keyword systemProc sp_help_targetservergroup
    syn keyword systemProc sp_helparticle
    syn keyword systemProc sp_helparticlecolumns
    syn keyword systemProc sp_helparticledts
    syn keyword systemProc sp_helpconstraint
    syn keyword systemProc sp_helpdatatypemap
    syn keyword systemProc sp_helpdb
    syn keyword systemProc sp_helpdbfixedrole
    syn keyword systemProc sp_helpdevice
    syn keyword systemProc sp_helpdistpublisher
    syn keyword systemProc sp_helpdistributiondb
    syn keyword systemProc sp_helpdistributor
    syn keyword systemProc sp_helpdistributor_properties
    syn keyword systemProc sp_helpdynamicsnapshot_job
    syn keyword systemProc sp_helpextendedproc
    syn keyword systemProc sp_helpfile
    syn keyword systemProc sp_helpfilegroup
    syn keyword systemProc sp_helpindex
    syn keyword systemProc sp_helplanguage
    syn keyword systemProc sp_helplinkedsrvlogin
    syn keyword systemProc sp_helplogins
    syn keyword systemProc sp_helplogreader_agent
    syn keyword systemProc sp_helpmergealternatepublisher
    syn keyword systemProc sp_helpmergearticle
    syn keyword systemProc sp_helpmergearticlecolumn
    syn keyword systemProc sp_helpmergearticleconflicts
    syn keyword systemProc sp_helpmergeconflictrows
    syn keyword systemProc sp_helpmergedeleteconflictrows
    syn keyword systemProc sp_helpmergefilter
    syn keyword systemProc sp_helpmergepartition
    syn keyword systemProc sp_helpmergepublication
    syn keyword systemProc sp_helpmergepullsubscription
    syn keyword systemProc sp_helpmergesubscription
    syn keyword systemProc sp_helpntgroup
    syn keyword systemProc sp_helppeerrequests
    syn keyword systemProc sp_helppeerresponses
    syn keyword systemProc sp_helppublication
    syn keyword systemProc sp_helppublication_snapshot
    syn keyword systemProc sp_helppullsubscription
    syn keyword systemProc sp_helpqreader_agent
    syn keyword systemProc sp_helpremotelogin
    syn keyword systemProc sp_helpreplfailovermode
    syn keyword systemProc sp_helpreplicationdboption
    syn keyword systemProc sp_helpreplicationoption
    syn keyword systemProc sp_helprole
    syn keyword systemProc sp_helprolemember
    syn keyword systemProc sp_helprotect
    syn keyword systemProc sp_helpserver
    syn keyword systemProc sp_helpsort
    syn keyword systemProc sp_helpsrvrole
    syn keyword systemProc sp_helpsrvrolemember
    syn keyword systemProc sp_helpstats
    syn keyword systemProc sp_helpsubscriberinfo
    syn keyword systemProc sp_helpsubscription
    syn keyword systemProc sp_helpsubscription_properties
    syn keyword systemProc sp_helpsubscriptionerrors
    syn keyword systemProc sp_helptext
    syn keyword systemProc sp_helptracertokenhistory
    syn keyword systemProc sp_helptracertokens
    syn keyword systemProc sp_helptrigger
    syn keyword systemProc sp_helpuser
    syn keyword systemProc sp_helpxactsetjob
    syn keyword systemProc sp_indexes
    syn keyword systemProc sp_indexes
    syn keyword systemProc sp_indexes_90_rowset
    syn keyword systemProc sp_indexes_90_rowset_rmt
    syn keyword systemProc sp_indexes_90_rowset2
    syn keyword systemProc sp_indexes_rowset
    syn keyword systemProc sp_indexes_rowset;2
    syn keyword systemProc sp_indexes_rowset;5
    syn keyword systemProc sp_indexes_rowset_rmt
    syn keyword systemProc sp_indexes_rowset2
    syn keyword systemProc sp_indexoption
    syn keyword systemProc sp_invalidate_textptr
    syn keyword systemProc sp_ivindexhasnullcols
    syn keyword systemProc sp_link_publication
    syn keyword systemProc sp_linkedservers
    syn keyword systemProc sp_linkedservers_rowset
    syn keyword systemProc sp_linkedservers_rowset;2
    syn keyword systemProc sp_linkedservers_rowset2
    syn keyword systemProc sp_lock
    syn keyword systemProc sp_lookupcustomresolver
    syn keyword systemProc sp_manage_jobs_by_login
    syn keyword systemProc sp_markpendingschemachange
    syn keyword systemProc sp_marksubscriptionvalidation
    syn keyword systemProc sp_mergearticlecolumn
    syn keyword systemProc sp_mergecleanupmetadata
    syn keyword systemProc sp_mergedummyupdate
    syn keyword systemProc sp_mergemetadataretentioncleanup
    syn keyword systemProc sp_mergesubscription_cleanup
    syn keyword systemProc sp_monitor
    syn keyword systemProc sp_MSchange_distribution_agent_properties
    syn keyword systemProc sp_MSchange_logreader_agent_properties
    syn keyword systemProc sp_MSchange_merge_agent_properties
    syn keyword systemProc sp_MSchange_snapshot_agent_properties
    syn keyword systemProc sp_MShasdbaccess
    syn keyword systemProc sp_msx_defect
    syn keyword systemProc sp_msx_enlist
    syn keyword systemProc sp_msx_get_account
    syn keyword systemProc sp_msx_set_account
    syn keyword systemProc sp_notify_operator
    syn keyword systemProc sp_OACreate
    syn keyword systemProc sp_OADestroy
    syn keyword systemProc sp_OAGetErrorInfo
    syn keyword systemProc sp_OAGetProperty
    syn keyword systemProc sp_OAMethod
    syn keyword systemProc sp_OASetProperty
    syn keyword systemProc sp_OAStop
    syn keyword systemProc sp_oledb_database
    syn keyword systemProc sp_oledb_defdb
    syn keyword systemProc sp_oledb_deflang
    syn keyword systemProc sp_oledb_language
    syn keyword systemProc sp_oledb_ro_usrname
    syn keyword systemProc sp_password
    syn keyword systemProc sp_pkeys
    syn keyword systemProc sp_pkeys
    syn keyword systemProc sp_post_msx_operation
    syn keyword systemProc sp_posttracertoken
    syn keyword systemProc sp_prepare
    syn keyword systemProc sp_primary_keys_rowset
    syn keyword systemProc sp_primary_keys_rowset;2
    syn keyword systemProc sp_primary_keys_rowset;3
    syn keyword systemProc sp_primary_keys_rowset;5
    syn keyword systemProc sp_primary_keys_rowset_rmt
    syn keyword systemProc sp_primary_keys_rowset2
    syn keyword systemProc sp_primarykeys
    syn keyword systemProc sp_primarykeys
    syn keyword systemProc sp_procedure_params_90_rowset
    syn keyword systemProc sp_procedure_params_90_rowset2
    syn keyword systemProc sp_procedure_params_rowset
    syn keyword systemProc sp_procedure_params_rowset;2
    syn keyword systemProc sp_procedure_params_rowset2
    syn keyword systemProc sp_procedures_rowset
    syn keyword systemProc sp_procedures_rowset;2
    syn keyword systemProc sp_procedures_rowset2
    syn keyword systemProc sp_processmail
    syn keyword systemProc sp_procoption
    syn keyword systemProc sp_provider_types_90_rowset
    syn keyword systemProc sp_provider_types_rowset
    syn keyword systemProc sp_publication_validation
    syn keyword systemProc sp_publisherproperty
    syn keyword systemProc sp_purge_jobhistory
    syn keyword systemProc sp_recompile
    syn keyword systemProc sp_refresh_log_shipping_monitor
    syn keyword systemProc sp_refreshsubscriptions
    syn keyword systemProc sp_refreshview
    syn keyword systemProc sp_register_custom_scripting
    syn keyword systemProc sp_registercustomresolver
    syn keyword systemProc sp_reinitmergepullsubscription
    syn keyword systemProc sp_reinitmergesubscription
    syn keyword systemProc sp_reinitpullsubscription
    syn keyword systemProc sp_reinitsubscription
    syn keyword systemProc sp_releaseapplock
    syn keyword systemProc sp_remoteoption
    syn keyword systemProc sp_remove_job_from_targetss
    syn keyword systemProc sp_removedbreplication
    syn keyword systemProc sp_removedistpublisherdbreplication
    syn keyword systemProc sp_rename
    syn keyword systemProc sp_renamedb
    syn keyword systemProc sp_repladdcolumn
    syn keyword systemProc sp_replcmds
    syn keyword systemProc sp_replcounters
    syn keyword systemProc sp_repldone
    syn keyword systemProc sp_repldropcolumn
    syn keyword systemProc sp_replflush
    syn keyword systemProc sp_replication_agent_checkup
    syn keyword systemProc sp_replicationdboption
    syn keyword systemProc sp_replmonitorchangepublicationthreshold
    syn keyword systemProc sp_replmonitorhelpmergesession
    syn keyword systemProc sp_replmonitorhelpmergesessiondetail
    syn keyword systemProc sp_replmonitorhelppublication
    syn keyword systemProc sp_replmonitorhelppublicationthresholds
    syn keyword systemProc sp_replmonitorhelppublisher
    syn keyword systemProc sp_replmonitorhelpsubscription
    syn keyword systemProc sp_replmonitorsubscriptionpendingcmds
    syn keyword systemProc sp_replqueuemonitor
    syn keyword systemProc sp_replrestart
    syn keyword systemProc sp_replsetoriginator
    syn keyword systemProc sp_replshowcmds
    syn keyword systemProc sp_repltrans
    syn keyword systemProc sp_requestpeerresponse
    syn keyword systemProc sp_requestpeertopologyinfo
    syn keyword systemProc sp_resetsnapshotdeliveryprogress
    syn keyword systemProc sp_resetstatus
    syn keyword systemProc sp_restoredbreplication
    syn keyword systemProc sp_restoremergeidentityrange
    syn keyword systemProc sp_resync_targetserver
    syn keyword systemProc sp_resyncmergesubscription
    syn keyword systemProc sp_revoke_login_from_proxy
    syn keyword systemProc sp_revoke_proxy_from_subsystem
    syn keyword systemProc sp_revoke_publication_access
    syn keyword systemProc sp_revokedbaccess
    syn keyword systemProc sp_revokelogin
    syn keyword systemProc sp_schemafilter
    syn keyword systemProc sp_schemata_rowset
    syn keyword systemProc sp_schemata_rowset;3
    syn keyword systemProc sp_script_synctran_commands
    syn keyword systemProc sp_scriptdynamicupdproc
    syn keyword systemProc sp_scriptpublicationcustomprocs
    syn keyword systemProc sp_scriptsubconflicttable
    syn keyword systemProc sp_send_dbmail
    syn keyword systemProc sp_server_info
    syn keyword systemProc sp_server_info
    syn keyword systemProc sp_serveroption
    syn keyword systemProc sp_serveroption
    syn keyword systemProc sp_setapprole
    syn keyword systemProc sp_setdefaultdatatypemapping
    syn keyword systemProc sp_setnetname
    syn keyword systemProc sp_setreplfailovermode
    syn keyword systemProc sp_setsubscriptionxactseqno
    syn keyword systemProc sp_settriggerorder
    syn keyword systemProc sp_showpendingchanges
    syn keyword systemProc sp_showrowreplicainfo
    syn keyword systemProc sp_spaceused
    syn keyword systemProc sp_special_columns
    syn keyword systemProc sp_special_columns
    syn keyword systemProc sp_special_columns_90
    syn keyword systemProc sp_sproc_columns
    syn keyword systemProc sp_sproc_columns
    syn keyword systemProc sp_sproc_columns_90
    syn keyword systemProc sp_srvrolepermission
    syn keyword systemProc sp_start_job
    syn keyword systemProc sp_startpublication_snapshot
    syn keyword systemProc sp_statistics
    syn keyword systemProc sp_statistics
    syn keyword systemProc sp_statistics_rowset
    syn keyword systemProc sp_statistics_rowset;2
    syn keyword systemProc sp_statistics_rowset2
    syn keyword systemProc sp_stop_job
    syn keyword systemProc sp_stored_procedures
    syn keyword systemProc sp_stored_procedures
    syn keyword systemProc sp_subscription_cleanup
    syn keyword systemProc sp_table_constraints_rowset
    syn keyword systemProc sp_table_constraints_rowset;2
    syn keyword systemProc sp_table_constraints_rowset2
    syn keyword systemProc sp_table_privileges
    syn keyword systemProc sp_table_privileges
    syn keyword systemProc sp_table_privileges_ex
    syn keyword systemProc sp_table_privileges_ex
    syn keyword systemProc sp_table_privileges_rowset
    syn keyword systemProc sp_table_privileges_rowset;2
    syn keyword systemProc sp_table_privileges_rowset;5
    syn keyword systemProc sp_table_privileges_rowset_rmt
    syn keyword systemProc sp_table_privileges_rowset2
    syn keyword systemProc sp_table_statistics_rowset
    syn keyword systemProc sp_table_statistics_rowset;2
    syn keyword systemProc sp_table_statistics2_rowset
    syn keyword systemProc sp_table_validation
    syn keyword systemProc sp_tablecollations
    syn keyword systemProc sp_tablecollations_90
    syn keyword systemProc sp_tableoption
    syn keyword systemProc sp_tables
    syn keyword systemProc sp_tables
    syn keyword systemProc sp_tables_ex
    syn keyword systemProc sp_tables_ex
    syn keyword systemProc sp_tables_info_90_rowset
    syn keyword systemProc sp_tables_info_90_rowset_64
    syn keyword systemProc sp_tables_info_90_rowset2
    syn keyword systemProc sp_tables_info_90_rowset2_64
    syn keyword systemProc sp_tables_info_rowset
    syn keyword systemProc sp_tables_info_rowset;2
    syn keyword systemProc sp_tables_info_rowset_64
    syn keyword systemProc sp_tables_info_rowset_64;2
    syn keyword systemProc sp_tables_info_rowset2
    syn keyword systemProc sp_tables_info_rowset2_64
    syn keyword systemProc sp_tables_rowset;2
    syn keyword systemProc sp_tables_rowset;5
    syn keyword systemProc sp_tables_rowset_rmt
    syn keyword systemProc sp_tables_rowset2
    syn keyword systemProc sp_testlinkedserver
    syn keyword systemProc sp_trace_create
    syn keyword systemProc sp_trace_generateevent
    syn keyword systemProc sp_trace_setevent
    syn keyword systemProc sp_trace_setfilter
    syn keyword systemProc sp_trace_setstatus
    syn keyword systemProc sp_unbindefault
    syn keyword systemProc sp_unbindrule
    syn keyword systemProc sp_unprepare
    syn keyword systemProc sp_unregister_custom_scripting
    syn keyword systemProc sp_unregistercustomresolver
    syn keyword systemProc sp_update_agent_profile
    syn keyword systemProc sp_update_alert
    syn keyword systemProc sp_update_category
    syn keyword systemProc sp_update_job
    syn keyword systemProc sp_update_jobschedule
    syn keyword systemProc sp_update_jobstep
    syn keyword systemProc sp_update_notification
    syn keyword systemProc sp_update_operator
    syn keyword systemProc sp_update_proxy
    syn keyword systemProc sp_update_schedule
    syn keyword systemProc sp_update_targetservergroup
    syn keyword systemProc sp_updateextendedproperty
    syn keyword systemProc sp_updatestats
    syn keyword systemProc sp_usertypes_rowset
    syn keyword systemProc sp_usertypes_rowset_rmt
    syn keyword systemProc sp_usertypes_rowset2
    syn keyword systemProc sp_validatelogins
    syn keyword systemProc sp_validatemergepublication
    syn keyword systemProc sp_validatemergesubscription
    syn keyword systemProc sp_validname
    syn keyword systemProc sp_views_rowset
    syn keyword systemProc sp_views_rowset2
    syn keyword systemProc sp_vupgrade_mergeobjects
    syn keyword systemProc sp_vupgrade_replication
    syn keyword systemProc sp_who
    syn keyword systemProc sp_xml_preparedocument
    syn keyword systemProc sp_xml_removedocument
    syn keyword systemProc sp_xml_schema_rowset
    syn keyword systemProc sp_xml_schema_rowset2
    syn keyword systemProc sysmail_add_account_sp
    syn keyword systemProc sysmail_add_principalprofile_sp
    syn keyword systemProc sysmail_add_profile_sp
    syn keyword systemProc sysmail_add_profileaccount_sp
    syn keyword systemProc sysmail_configure_sp
    syn keyword systemProc sysmail_delete_account_sp
    syn keyword systemProc sysmail_delete_log_sp
    syn keyword systemProc sysmail_delete_mailitems_sp
    syn keyword systemProc sysmail_delete_principalprofile_sp
    syn keyword systemProc sysmail_delete_profile_sp
    syn keyword systemProc sysmail_delete_profileaccount_sp
    syn keyword systemProc sysmail_help_account_sp
    syn keyword systemProc sysmail_help_configure_sp
    syn keyword systemProc sysmail_help_principalprofile_sp
    syn keyword systemProc sysmail_help_profile_sp
    syn keyword systemProc sysmail_help_profileaccount_sp
    syn keyword systemProc sysmail_help_queue_sp
    syn keyword systemProc sysmail_help_status_sp
    syn keyword systemProc sysmail_start_sp
    syn keyword systemProc sysmail_stop_sp
    syn keyword systemProc sysmail_update_account_sp
    syn keyword systemProc sysmail_update_principalprofile_sp
    syn keyword systemProc sysmail_update_profile_sp
    syn keyword systemProc sysmail_update_profileaccount_sp
    syn keyword systemProc xp_cmdshell
    syn keyword systemProc xp_deletemail
    syn keyword systemProc xp_enumgroups
    syn keyword systemProc xp_findnextmsg
    syn keyword systemProc xp_findnextmsg
    syn keyword systemProc xp_grantlogin
    syn keyword systemProc xp_logevent
    syn keyword systemProc xp_loginconfig
    syn keyword systemProc xp_logininfo
    syn keyword systemProc xp_msver
    syn keyword systemProc xp_readmail
    syn keyword systemProc xp_revokelogin
    syn keyword systemProc xp_sendmail
    syn keyword systemProc xp_sprintf
    syn keyword systemProc xp_sqlmaint
    syn keyword systemProc xp_sscanf
    syn keyword systemProc xp_startmail
    syn keyword systemProc xp_stopmail
endif
" }}}

" Special values {{{
syn keyword tsqlSpecial false null true
" }}}

" User variables {{{
syn match tsqlVariable "@\a[a-zA-Z0-9@$#_]*\>"
" }}}

" Temp tables {{{
syn match tsqlTempTable "#\{1,2}\a[a-zA-Z0-9@$#_]*\>"
" }}}

" System variables {{{
if exists("sqlserver_highlight_system_vars") && sqlserver_highlight_system_vars != 0
    syn match tsqlSystemVariable "@@CONNECTIONS"
    syn match tsqlSystemVariable "@@CPU_BUSY"
    syn match tsqlSystemVariable "@@CURSOR_ROWS"
    syn match tsqlSystemVariable "@@DATEFIRST"
    syn match tsqlSystemVariable "@@DBTS"
    syn match tsqlSystemVariable "@@ERROR"
    syn match tsqlSystemVariable "@@FETCH_STATUS"
    syn match tsqlSystemVariable "@@IDENTITY"
    syn match tsqlSystemVariable "@@IDLE"
    syn match tsqlSystemVariable "@@IO_BUSY"
    syn match tsqlSystemVariable "@@LANGID"
    syn match tsqlSystemVariable "@@LANGUAGE"
    syn match tsqlSystemVariable "@@LOCK_TIMEOUT"
    syn match tsqlSystemVariable "@@MAX_CONNECTIONS"
    syn match tsqlSystemVariable "@@MAX_PRECISION"
    syn match tsqlSystemVariable "@@NESTLEVEL"
    syn match tsqlSystemVariable "@@OPTIONS"
    syn match tsqlSystemVariable "@@PACK_RECEIVED"
    syn match tsqlSystemVariable "@@PACK_SENT"
    syn match tsqlSystemVariable "@@PACKET_ERRORS"
    syn match tsqlSystemVariable "@@PROCID"
    syn match tsqlSystemVariable "@@REMSERVER"
    syn match tsqlSystemVariable "@@ROWCOUNT"
    syn match tsqlSystemVariable "@@SERVERNAME"
    syn match tsqlSystemVariable "@@SERVICENAME"
    syn match tsqlSystemVariable "@@SPID"
    syn match tsqlSystemVariable "@@TEXTSIZE"
    syn match tsqlSystemVariable "@@TIMETICKS"
    syn match tsqlSystemVariable "@@TOTAL_ERRORS"
    syn match tsqlSystemVariable "@@TOTAL_READ"
    syn match tsqlSystemVariable "@@TOTAL_WRITE"
    syn match tsqlSystemVariable "@@TRANCOUNT"
    syn match tsqlSystemVariable "@@VERSION"
endif
" }}}

" Comments {{{
syn region tsqlComment start="/\*"  end="\*/" contains=tsqlTodo
syn match tsqlComment "--.*$" contains=tsqlTodo
syn sync ccomment tsqlComment
" }}}

" Strings {{{
syn region tsqlString start=+'+ end=+'+
syn region tsqlString start=+"+ end=+"+
" }}}

" Numbers {{{
syn match tsqlNumber "-\=\<\d*\.\=[0-9_]\>"
" }}}

" Data types {{{
syn keyword tsqlType int bigint binary bit char CLR cursor tinyint
syn keyword tsqlType date datetime datetime2 datetimeoffset decimal
syn keyword tsqlType float hierarchyid image int money nchar ntext
syn keyword tsqlType numeric nvarchar real rowversion
syn keyword tsqlType smalldatetime smallint smallmoney sql_variant
syn keyword tsqlType text time timestamp
syn keyword tsqlType varbinary varchar uniqueidentifier xml
syn match tsqlType "\<table\>"
" }}}

" Table actions {{{
syn match tsqlTableAction "\<\(CREATE\|ALTER\|TRUNCATE\|DROP\)\sTABLE\>"
" }}}

" Operators {{{
syn keyword tsqlOperator not and or
syn keyword tsqlOperator in any some all between exists
syn keyword tsqlOperator like escape
syn keyword tsqlOperator union intersect minus
syn keyword tsqlOperator prior distinct
syn keyword tsqlOperator sysdate out
" }}}

" To do {{{
syn keyword tsqlTodo contained TODO FIXME NOTE
" }}}

" Options {{{
if exists("sqlserver_highlight_server_opts") && sqlserver_highlight_server_opts != 0
    syn match svrOption "\<SET ANSI_DEFAULTS \(ON\|OFF\)\>"
    syn match svrOption "\<SET ANSI_NULL_DFLT_OFF \(ON\|OFF\)\>"
    syn match svrOption "\<SET ANSI_NULL_DFLT_ON \(ON\|OFF\)\>"
    syn match svrOption "\<SET ANSI_NULLS \(ON\|OFF\)\>"
    syn match svrOption "\<SET ANSI_PADDING \(ON\|OFF\)\>"
    syn match svrOption "\<SET ANSI_WARNINGS \(ON\|OFF\)\>"
    syn match svrOption "\<SET ARITHABORT \(ON\|OFF\)\>"
    syn match svrOption "\<SET ARITHIGNORE \(ON\|OFF\)\>"
    syn match svrOption "\<SET CONCAT_NULL_YIELDS_NULL \(ON\|OFF\)\>"
    syn match svrOption "\<SET CONTEXT_INFO .\+\>"
    syn match svrOption "\<SET CURSOR_CLOSE_ON_COMMIT \(ON\|OFF\)\>"
    syn match svrOption "\<SET DATEFIRST \([1-7]\|@.\+\)\>" contains=tsqlVariable
    syn match svrOption "\<SET DATEFORMAT .\+\>" contains=tsqlVariable
    syn match svrOption "\<SET DEADLOCK_PRIORITY \(LOW\|NORMAL\|HIGH\|-\?1\?[0-9]\|@.\+\)\>" contains=tsqlVariable
    syn match svrOption "\<SET FIPS_FLAGGER '\(ENTRY\|FULL\|INTERMEDIATE\|OFF\)'\>" contains=tsqlString
    syn match svrOption "\<SET FMTONLY \(ON\|OFF\)\>"
    syn match svrOption "\<SET FORCEPLAN \(ON\|OFF\)\>"
    syn match svrOption "\<SET IDENTITY_INSERT .\+ \(ON\|OFF\)\>"
    syn match svrOption "\<SET IMPLICIT_TRANSACTIONS \(ON\|OFF\)\>"
    syn match svrOption "\<SET LANGUAGE .\+\>" contains=tsqlVariable
    syn match svrOption "\<SET LOCK_TIMEOUT [-]\?\d\+\>"
    syn match svrOption "\<SET NOCOUNT \(ON\|OFF\)\>"
    syn match svrOption "\<SET NOEXEC \(ON\|OFF\)\>"
    syn match svrOption "\<SET NUMERIC_ROUNDABORT \(ON\|OFF\)\>"
    syn match svrOption "\<SET PARSEONLY \(ON\|OFF\)\>"
    syn match svrOption "\<SET QUERY_GOVERNOR_COST_LIMIT .\+\>" contains=tsqlNumber
    syn match svrOption "\<SET QUOTED_IDENTIFIER \(ON\|OFF\)\>"
    syn match svrOption "\<SET REMOTE_PROC_TRANSACTIONS \(ON\|OFF\)\>"
    syn match svrOption "\<SET ROWCOUNT \([0-9]\+\|@.*\>\)\>" contains=tsqlVariable
    syn match svrOption "\<SET SHOWPLAN_ALL \(ON\|OFF\)\>"
    syn match svrOption "\<SET SHOWPLAN_TEXT \(ON\|OFF\)\>"
    syn match svrOption "\<SET SHOWPLAN_XML \(ON\|OFF\)\>"
    syn match svrOption "\<SET STATISTICS IO \(ON\|OFF\)\>"
    syn match svrOption "\<SET STATISTICS PROFILE \(ON\|OFF\)\>"
    syn match svrOption "\<SET STATISTICS TIME \(ON\|OFF\)\>"
    syn match svrOption "\<SET STATISTICS XML \(ON\|OFF\)\>"
    syn match svrOption "\<SET TEXTSIZE [0-9]\+\>"
    syn match svrOption "\<SET TRANSACTION ISOLATION LEVEL \(READ UNCOMMITED\|READ COMMITTED\|REPEATABLE READ\|SNAPSHOT\|SERIALIZABLE\)\>"
    syn match svrOption "\<SET XACT_ABORT \(ON\|OFF\)\>"
endif
" }}}

" TSQL functions {{{
syn match tsqlFunction "\<AVG("he=e-1
syn match tsqlFunction "\<CHECKSUM_AGG("he=e-1
syn match tsqlFunction "\<COUNT("he=e-1
syn match tsqlFunction "\<COUNT_BIG("he=e-1
syn match tsqlFunction "\<GROUPING("he=e-1
syn match tsqlFunction "\<MAX("he=e-1
syn match tsqlFunction "\<MIN("he=e-1
syn match tsqlFunction "\<SUM("he=e-1
syn match tsqlFunction "\<STDEV("he=e-1
syn match tsqlFunction "\<STDEVP("he=e-1
syn match tsqlFunction "\<VAR("he=e-1
syn match tsqlFunction "\<VARP("he=e-1

syn match tsqlFunction "\<CONTAINSTABLE("he=e-1
syn match tsqlFunction "\<FREETEXTTABLE("he=e-1
syn match tsqlFunction "\<OPENDATASOURCE("he=e-1
syn match tsqlFunction "\<OPENQUERY("he=e-1
syn match tsqlFunction "\<OPENROWSET("he=e-1
syn match tsqlFunction "\<OPENXML("he=e-1

syn match tsqlFunction "\<RANK("he=e-1
syn match tsqlFunction "\<DENSE_RANK("he=e-1
syn match tsqlFunction "\<NTILE("he=e-1
syn match tsqlFunction "\<ROW_NUMBER("he=e-1

syn match tsqlFunction "\<CURSOR_STATUS("he=e-1
syn match tsqlFunction "\<SYSDATETIME("he=e-1
syn match tsqlFunction "\<SYSDATETIMEOFFSET("he=e-1
syn match tsqlFunction "\<SYSUTCDATETIME("he=e-1
syn match tsqlFunction "\<GETDATE("he=e-1
syn match tsqlFunction "\<GETUTCDATE("he=e-1
syn match tsqlFunction "\<DATENAME("he=e-1
syn match tsqlFunction "\<DATEPART("he=e-1
syn match tsqlFunction "\<DAY("he=e-1
syn match tsqlFunction "\<MONTH("he=e-1
syn match tsqlFunction "\<YEAR("he=e-1
syn match tsqlFunction "\<DATEDIFF("he=e-1
syn match tsqlFunction "\<DATEADD("he=e-1
syn match tsqlFunction "\<SWITCHOFFSET("he=e-1
syn match tsqlFunction "\<TODATETIMEOFFSET("he=e-1

syn match tsqlFunction "\<ABS("he=e-1
syn match tsqlFunction "\<ACOS("he=e-1
syn match tsqlFunction "\<ASIN("he=e-1
syn match tsqlFunction "\<ATAN("he=e-1
syn match tsqlFunction "\<ATN2("he=e-1
syn match tsqlFunction "\<CEILING("he=e-1
syn match tsqlFunction "\<COS("he=e-1
syn match tsqlFunction "\<COT("he=e-1
syn match tsqlFunction "\<DEGREES("he=e-1
syn match tsqlFunction "\<EXP("he=e-1
syn match tsqlFunction "\<FLOOR("he=e-1
syn match tsqlFunction "\<LOG("he=e-1
syn match tsqlFunction "\<LOG10("he=e-1
syn match tsqlFunction "\<PI("he=e-1
syn match tsqlFunction "\<POWER("he=e-1
syn match tsqlFunction "\<RADIANS("he=e-1
syn match tsqlFunction "\<RAND("he=e-1
syn match tsqlFunction "\<ROUND("he=e-1
syn match tsqlFunction "\<SIGN("he=e-1
syn match tsqlFunction "\<SIN("he=e-1
syn match tsqlFunction "\<SQRT("he=e-1
syn match tsqlFunction "\<SQUARE("he=e-1
syn match tsqlFunction "\<TAN("he=e-1

syn match tsqlFunction "\<ASCII("he=e-1
syn match tsqlFunction "\<CHAR("he=e-1
syn match tsqlFunction "\<CHARINDEX("he=e-1
syn match tsqlFunction "\<DIFFERENCE("he=e-1
syn match tsqlFunction "\<LEFT("he=e-1
syn match tsqlFunction "\<LEN("he=e-1
syn match tsqlFunction "\<LOWER("he=e-1
syn match tsqlFunction "\<LTRIM("he=e-1
syn match tsqlFunction "\<NCHAR("he=e-1
syn match tsqlFunction "\<PATINDEX("he=e-1
syn match tsqlFunction "\<QUOTENAME("he=e-1
syn match tsqlFunction "\<REPLACE("he=e-1
syn match tsqlFunction "\<REPLICATE("he=e-1
syn match tsqlFunction "\<REVERSE("he=e-1
syn match tsqlFunction "\<RIGHT("he=e-1
syn match tsqlFunction "\<RTRIM("he=e-1
syn match tsqlFunction "\<SOUNDEX("he=e-1
syn match tsqlFunction "\<SPACE("he=e-1
syn match tsqlFunction "\<STR("he=e-1
syn match tsqlFunction "\<STUFF("he=e-1
syn match tsqlFunction "\<SUBSTRING("he=e-1
syn match tsqlFunction "\<TEXTVALID("he=e-1
syn match tsqlFunction "\<TEXTPTR("he=e-1
syn match tsqlFunction "\<UNICODE("he=e-1
syn match tsqlFunction "\<UPPER("he=e-1

syn match tsqlFunction "\<APP_NAME("he=e-1
syn match tsqlFunction "\<CAST("he=e-1
syn match tsqlFunction "\<CONVERT("he=e-1
syn match tsqlFunction "\<COALESCE("he=e-1
syn match tsqlFunction "\<COLLATIONPROPERTY("he=e-1
syn match tsqlFunction "\<COLUMNS_UPDATED("he=e-1
syn match tsqlFunction "\<DATALENGTH("he=e-1
syn match tsqlFunction "\<ERROR_LINE("he=e-1
syn match tsqlFunction "\<ERROR_MESSAGE("he=e-1
syn match tsqlFunction "\<ERROR_NUMBER("he=e-1
syn match tsqlFunction "\<ERROR_PROCEDURE("he=e-1
syn match tsqlFunction "\<ERROR_SEVERITY("he=e-1
syn match tsqlFunction "\<ERROR_STATE("he=e-1

syn match tsqlFunction "\<fn_helpcollations("he=e-1
syn match tsqlFunction "\<fn_servershareddrives("he=e-1
syn match tsqlFunction "\<fn_virtualfilestats("he=e-1
syn match tsqlFunction "\<FORMATMESSAGE("he=e-1
syn match tsqlFunction "\<GETANSINULL("he=e-1
syn match tsqlFunction "\<HOST_ID("he=e-1
syn match tsqlFunction "\<HOST_NAME("he=e-1
syn match tsqlFunction "\<IDENT_CURRENT("he=e-1
syn match tsqlFunction "\<IDENT_INCR("he=e-1
syn match tsqlFunction "\<IDENT_SEED("he=e-1
syn match tsqlFunction "\<IDENTITY("he=e-1
syn match tsqlFunction "\<ISDATE("he=e-1
syn match tsqlFunction "\<ISNULL("he=e-1
syn match tsqlFunction "\<ISNUMERIC("he=e-1
syn match tsqlFunction "\<NEWID("he=e-1
syn match tsqlFunction "\<NULLIF("he=e-1
syn match tsqlFunction "\<ORIGINAL_LOGIN("he=e-1
syn match tsqlFunction "\<PARSENAME("he=e-1
syn match tsqlFunction "\<ROWCOUNT_BIG("he=e-1
syn match tsqlFunction "\<SCOPE_IDENTITY("he=e-1
syn match tsqlFunction "\<SERVERPROPERTY("he=e-1
syn match tsqlFunction "\<SESSION_USER("he=e-1
syn match tsqlFunction "\<SESSIONPROPERTY("he=e-1
syn match tsqlFunction "\<STATS_DATE("he=e-1
syn match tsqlFunction "\<sys.dm_db_index_physical_stats("he=e-1
syn match tsqlFunction "\<SYSTEM_USER("he=e-1
syn match tsqlFunction "\<UPDATE("he=e-1
syn match tsqlFunction "\<USER_NAME("he=e-1
syn match tsqlFunction "\<XACT_STATE("he=e-1
" }}}

" Function parameters {{{
syn keyword functionParam year quarter month dayofyear day week weekday hour minute second millisecond
" }}}

" Object Name {{{
syn region tsqlObjectName start=+\[+ end=+\]+
" }}}

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_tsql_syn_inits")
  if version < 508
    let did_tsql_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink tsqlKeyword Statement
  HiLink odbcKeyword Statement
  HiLink futureKeyword Statement
  HiLink undocumentedKeyword Statement
  HiLink tsqlSpecial Statement
  HiLink tsqlString String
  HiLink tsqlNumber Number
  HiLink tsqlVariable Identifier
  HiLink tsqlTempTable Identifier
  HiLink tsqlSystemVariable Identifier
  HiLink tsqlComment Comment
  HiLink tsqlType Type
  HiLink tsqlTableAction Statement
  HiLink tsqlOperator Statement
  HiLink tsqlTodo Todo
  HiLink systemProc Function
  HiLink tsqlFunction Function
  HiLink svrOption PreProc
  HiLink functionParam Statement
  HiLink tsqlObjectName Normal

  delcommand HiLink
endif

let b:current_syntax = "sqlserver"

" vim:ft=vim:fdm=marker:ff=unix
