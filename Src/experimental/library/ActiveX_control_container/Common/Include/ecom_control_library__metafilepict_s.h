/*-----------------------------------------------------------
"Automatically generated by the EiffelCOM Wizard."Added Record _METAFILEPICT
  mm: LONG
      -- No description available.
  xExt: LONG
      -- No description available.
  yExt: LONG
      -- No description available.
  hMF: Pointed Type
      -- No description available.
  
-----------------------------------------------------------*/

#ifndef __ECOM_CONTROL_LIBRARY__METAFILEPICT_S_H__
#define __ECOM_CONTROL_LIBRARY__METAFILEPICT_S_H__
#ifdef __cplusplus
extern "C" {
#endif


namespace ecom_control_library
{
struct tag_METAFILEPICT;
typedef struct ecom_control_library::tag_METAFILEPICT _METAFILEPICT;
}

namespace ecom_control_library
{
struct tag_userHMETAFILE;
typedef struct ecom_control_library::tag_userHMETAFILE _userHMETAFILE;
}

#ifdef __cplusplus
}
#endif

#include "eif_com.h"

#include "eif_eiffel.h"

#ifdef __cplusplus
extern "C" {
#endif



namespace ecom_control_library
{
struct tag_METAFILEPICT
{ LONG mm;
  LONG xExt;
  LONG yExt;
  ecom_control_library::_userHMETAFILE * hMF;
};
}
#ifdef __cplusplus
}
#endif

#endif
