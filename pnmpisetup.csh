setenv PNMPIBASE $PWD
setenv PNMPI_LIB_PATH $PNMPIBASE/lib/#SYS_TYPE
setenv PNMPI_INC_PATH $PNMPIBASE/include
if ($?LD_LIBRARY_PATH) then
setenv LD_LIBRARY_PATH $PNMPI_LIB_PATH":"$LD_LIBRARY_PATH
else
setenv LD_LIBRARY_PATH $PNMPI_LIB_PATH
endif

