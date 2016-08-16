#-------------------------------------------------------------------------------
# Module        : Conventions
# Author        : Georg Maubach
# Date          : 2016-06-07
# Update        : 2016-08-15
# Description   : Conventions in scripts
# Source System : R 3.3.0 (64 Bit)
# Target System : R 3.3.0 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7---------8

# Annotations
# %ANNO%"  : Annotations of the analyst
# %ROTA%   : Comments on (r)esults (o)f (t)he (A)nalysis
# %ANDE%   : (An)alyst (De)cisions
# %NEXT%   : Starting point for (next) working day
# %PROC%   : Explanation to procdedure or operation
# %EErr%   : Expected error or warning

# Abbreviations
# Rational
#  - distinguish the objects from objects used by R functions
#  - keep the environment tab of R Studio neat and clean
# c = constants
# d = datasets
# m = meta data
# v = variables

# Environment
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

# Files
# inc_file       : filename for files to include and used with source()
# sub_call_file  : filename for sub routines to be used with source()
# v_file_path    : directory to store a dataset in, can be set to path_output
# v_file_name    : filename for an RData file
# v_file_location: file.path(v_file_path, v_file_location)

# xls_workbook     : xls workbook object
# xls_sheetname    : sheetname
# xls_ds_to_save   : dataset to be save as an Excel file
# xls_file_name    : filename
# xls_file_path    : directory to store the file in
# xls_file_location: file.path(xls_file_path, xls_file_name)

# Objects
# sub_name         : Name of a subroutine
# sub_version      : Version of a subroutine in "YYYY-MM-DD" format
# d_*              : Prefix for dataset objects containing payloads,
#                    e.g. data.frame, data.table
# c_*              : Prefix for constant values,
#                    e.g. separator for values and value labels
# m_*              : Prefix for dataset objects containing (M)eta data,
#                    e. g. branch codes
# v_*              : Prefix for variables
# key_variables    : character vector with variables to be used to identify
#                    duplicates
# duplicates       : logical vector to indicate if a case is duplicate or not
# filter_variables : character vector with variables to define filters for cases
# filter           : logical vector to indicate if a case is filtered or not

# Dates
# data_created     : Atomic character vector to store a date in format
#                    "YYYY-MM-DD" as a part of a filename for data

# File Handling
# Files that store interim results are named with immutable file names, e. g.
# "SAP-ERP_Customers_2015_raw.RData.
# Files that reflect an endpoint in an analysis process are named with a prefix
# containing the current data, e. g. 2016-06-09_SAP-ERP_Customers_2015_raw.xlsx.
# This file will not be read again within the analysis process and can therefore
# reflect the date it was created whereas the RData file will be read in further
# process steps.

# EOF

