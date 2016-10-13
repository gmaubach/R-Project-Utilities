#-------------------------------------------------------------------------------
# Module        : Conventions
# Author        : Georg Maubach
# Date          : 2016-06-07
# Update        : 2016-06-07
# Description   : Conventions in scripts
# Source System : R 3.2.5 (64 Bit)
# Target System : R 3.2.5 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7---------8

# Abbreviations
# %ANNO%"  : Annotations of the analyst
# %ROTA%   : Comments on (r)esults (o)f (t)he (A)nalysis
# %ANDE%   : (An)alyst (De)cisions
# %NEXT%   : Starting point for (next) working day
# %PROC%   : Explanation to procdedure or operation
# %EErr%   : Expected error or warning

# Environment
# path_project   : Project directory
# path_script    : Path to project programs
#                  (is normally a sub directory to path_project)
# path_input     : Path to input files for the project (not altered by R scripts)
#                  (is normally a sub directory to path_project)
# path_output    : Path to output files produced by R scripts
#                  (is normally a sub directory to path_project)

# Files
# inc_file       : filename for files to include and used with source()
# sub_call_file  : filename for sub routines to be used with source()
# data_directory : directory to store a dataset in, can be set to path_output
# data_filename  : filename for an RData file

# xls_workbook   : xls workbook object
# xls_sheetname  : sheetname
# xls_ds_to_save : dataset to be save as an Excel file
# xls_filename   : filename
# xls_directory  : directory to store the file in

# Objects
# sub_name         : Name of a subroutine
# sub_version      : Version of a subroutine in "YYYY-MM-DD" format
# ds_*             : Prefix for dataset objects, e.g. data.frame, data.table
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

