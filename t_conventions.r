#-----------------------------------------------------------
# Module        : Conventions
# Author        : Georg Maubach
# Date          : 2016-06-07
# Update        : 2016-12-22
# Description   : Conventions in scripts
# Source System : R 3.3.0 (64 Bit)
# Target System : R 3.3.0 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6

# Comments follow the form
# @ProgrammerInitials (Date in format YYYY-MM-DD)

# ToDo's follow the form
# ToDo @ProgrammerInitials (Date in format YYYY-MM-DD) where
# date is date of creation.
# Done @ProgrammerInitials (Date in format YYYY-MM-DD) where
# date is date of finishing programming of the ToDo.

# @GMA (2016-09-05)
# Annotations
# %ANNO%"  : Annotations of the analyst
# %ROTA%   : Comments on (r)esults (o)f (t)he (A)nalysis
# %ANDE%   : (An)alyst (De)cisions
# %NEXT%   : Starting point for (next) working day
# %PROC%   : Explanation to procdedure or operation
# %EErr%   : Expected error or warning
# %CAUTION%: Attention to this part of code if changes are
#            made to the script.
# %WAVE%   : These code parts need to adjusted if new data
#            is processed in the future.
# %CORR%   : Correction of erroneous code.

# @GMA (2016-12-07)
# Editing marks
# %EM% : Editing Marker
# Example:
# %EM%: Development has to be continued in this section
# --------------------------------------------------------
# %IA% : Adaption for network infrastructure
# %IA%.
# # >>>>> Begin infrastructure adaption <<<<<
# # >>>>> End infrastructure adaption <<<<<
# --------------------------------------------------------
# %CA% : Country adaption necessary in syntax
#        code. If only macros have to be
#        defined with another value what does
#        not effect the syntax code itself
#        the country adaption is marked with %CA%.
#        If there are country specific variables
#        or filters these country specifics have
#        to be regarded and the syntax has to be
#        reworked.
# Example:
# %CA%.
# # ///// Begin Country Adaption \\\\\
# Syntax code to be changed
# # ///// End Country Adaption \\\\\
# --------------------------------------------------------
# %DD% : Data dependent code is marked if
#        syntax programs are used for
#        different market segments. This
#        special code which is not part of
#        the master program should be
#        marked with %DDC% and commented
# Example:
# %DD%.
# # <<<<< Begin data dependent code for EXPRESS data sets >>>>>
# # <<<<< End data dependent code for EXPRESS data sets >>>>>
# --------------------------------------------------------
# %SA% : Special Analysis
# Example:
# %SA%.
# # \\\\\ Begin special analysis /////
# # \\\\\ End special analysis /////
# --------------------------------------------------------
# %##% : Snippets which seem NOT to work proberly
#        are marked with %##% and embedded with:
# Example:
# %##%.
# # /\/\/\ Begin instable code /\/\/\
# # /\/\/\ End instable code /\/\/\
#--------------------------------------------------------*/ .

# @GMA (2016-09-01)
# Abbreviations
# Rational
#  - distinguish user defined objects from objects used by R
#  - keep the environment tab of R Studio neat and clean
# c = constants
# d = datasets
# m = meta data
# p = procedure
# s = customer specific code (confidential, copyright reserved)
# t = toolbox objects, e. g. functions
# v = variables

# @GMA (2016-09-01)
# Environment
# @GMA %TODO% @GMA (2016-12-07): Update to new version
# c_path_project   : Project directory
# ## development   : Directory to store snippets under development which are
#                    not yet productive.
#                    This directory is not read by R or other statistical
#                    software.
# ## documentation : Directory for project documentation. Documentation shall
#                    contain all information making it possible to redo the
#                    analysis with the same results.
#                    This directory is not read by R or other statistical
#                    software.
# c_path_export    : Path to output files in foreign formats, e.g. Excel
#                    (is normally a sub directory to path_project)
# ## fundamentals  : Directory to store background information for the project.
#                    This directory is not read by R or other statistical
#                    software.
# c_path_graphics  : Path to directory for graphics output
#                    (is normally a sub directory to path_project)
# c_path_input     : Path to input files for the project (not altered by R scripts)
#                    (is normally a sub directory to path_project)
# c_path_jobs      : Path to sub directory containing the jobs for a project
#                    (is normally a sub directory to path_project)
# c_path_meta      : Path to R datasets and machine readable information for
#                    storing meta data, e. g. questionnaire text, variable
#                    labels, value labels, etc.
#                    (is normally a sub directory to path_project)
# c_path_modules   : Path to files and modules containing project specific
#                    functions
#                    (is normally a sub directory to path_project)
# c_path_output    : Path to output files produced by R scripts
#                    (is normally a sub directory to path_project)
# ## raw           : Directory in project directory not read by R containing the
#                    source data which is not altered using R or other scripts
#                    but manually to be able to read it in with R or other
#                    statistical software. The manually altered files are stored
#                    in the path defined with c_path_input.

# @GMA (2016-09-01)
# Files
# v_inc_file      : filename for files to include and used
#                   with source()
# v_sub_call_file : filename for sub routines to be used
#                   with source()
# v_file_path     : directory to store a dataset in, can be
#                   set to path_output
# v_file_name     : filename for an RData file
# v_file_location : file.path(v_file_path, v_file_location)

# @GMA (2016-09-01)
# Microsoft Excel
# xls_workbook     : xls workbook object
# xls_sheetname    : sheetname
# xls_ds_to_save   : dataset to be save as an Excel file
# xls_file_name    : filename
# xls_file_path    : directory to store the file in
# xls_file_location: file.path(xls_file_path, xls_file_name)

# @GMA (2016-09-01)
# Object Prefixes
# d_*              : Prefix for dataset objects containing
#                    payloads,
#                    e.g. data.frame, data.table
# c_*              : Prefix for constant values,
#                    e.g. separator for values and value
#                    labels
# m_*              : Prefix for dataset objects containing
#                    (M)eta data, e. g. branch codes
# v_*              : Prefix for variables

# @GMA (2016-12-07)
# Objects
# v_key_variables    : character vector with variables to be
#                      used to identify duplicates
# v_duplicates       : logical vector to indicate if a case
#                      is duplicate or not
# v_unique           : logical vector to indicate if a case
#                      is unique or not
# v_complete         : logical vector to indicate complete
#                      cases
# v_filter_variables : character vector with variables to
#                      define filters for cases
# v_filter           : logical vector to indicate if a case
#                      is filtered or not
# v_keep             : variables to keep
# v_drop             : variables to drop
# v_retain           : cases to keep
# v_discard          : cases to drop
# v_sort_variables   : sorting for variables
# v_order            : sorting for cases

# @GMA (2016-09-01)
# Dates
# v_data_created     : Atomic character vector to store a
#                      date in format "YYYY-MM-DD" as a part
#                      of a filename for data

# @GMA (2016-09-01)
# File Handling
# Files that store interim results are named with immutable
# file names, e. g. "SAP-ERP_Customers_2015_raw.RData.
# Files that reflect an endpoint in an analysis process are
# named with a prefix containing the current data, e. g.
# 2016-06-09_SAP-ERP_Customers_2015_raw.xlsx.
# This file will not be read again within the analysis
# process and can therefore reflect the date it was created
# whereas the RData file will be read in further process
# steps.

# EOF
