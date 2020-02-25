file(READ ${GDAL_CONFIG_INPUT} GDAL_CONFIG_CONTENTS)

string(JOIN "\n" HDR
    "#!/bin/sh"
    "CONFIG_LIBS=\"${GDAL_LIB_LOCATION}\""
    "CONFIG_DEP_LIBS=\"-lpthread -lm -lrt -ldl\""
    "CONFIG_PREFIX=\"${INSTALL_PREFIX}\""
    "CONFIG_CFLAGS=\"${GDAL_CFLAGS}\""
    "CONFIG_DATA=\"${GDAL_DATADIR}\""
    "CONFIG_VERSION=\"${GDAL_VERSION}\""
    "CONFIG_OGR_ENABLED=yes"
    "CONFIG_GNM_ENABLED=no"
    "CONFIG_FORMATS=\"gtiff aigrid aaigrid raw mem vrt gif jpeg png pcraster zlib\""
)

file(WRITE ${GDAL_CONFIG_OUTPUT} "${HDR}\n${GDAL_CONFIG_CONTENTS}")