function(deploy_msvc)
    if(MSVC)
        if(${MSVC_TOOLSET_VERSION} GREATER_EQUAL 142)
            set(VC_REDIST_DIR $ENV{VCToolsRedistDir}$ENV{Platform}/Microsoft.VC${MSVC_TOOLSET_VERSION}.CRT CACHE STRING "Location of the msvc dll")
            string(REPLACE "\\" "/" VC_REDIST_DIR ${VC_REDIST_DIR})
            message(STATUS ${VC_REDIST_DIR})

            install (FILES ${VC_REDIST_DIR}/msvcp140.dll DESTINATION "./")
            install (FILES ${VC_REDIST_DIR}/msvcp140_1.dll DESTINATION "./" OPTIONAL)
            install (FILES ${VC_REDIST_DIR}/vcruntime140.dll DESTINATION "./")
            install (FILES ${VC_REDIST_DIR}/vcruntime140_1.dll DESTINATION "./" OPTIONAL)
        endif()
    endif()
endfunction()
