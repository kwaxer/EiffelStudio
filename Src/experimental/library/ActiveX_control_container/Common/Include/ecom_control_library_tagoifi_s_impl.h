/*-----------------------------------------------------------
"Automatically generated by the EiffelCOM Wizard."Added Record tagOIFI
  cb: UINT
      -- No description available.
  fMDIApp: LONG
      -- No description available.
  hwndFrame: typedef
      -- No description available.
  hAccel: typedef
      -- No description available.
  cAccelEntries: UINT
      -- No description available.
  
-----------------------------------------------------------*/

#ifndef __ECOM_CONTROL_LIBRARY_TAGOIFI_S_IMPL_H__
#define __ECOM_CONTROL_LIBRARY_TAGOIFI_S_IMPL_H__

#include "eif_com.h"

#include "eif_eiffel.h"

#include <oleidl.h>

#include "ecom_grt_globals_control_interfaces2.h"

#ifdef __cplusplus
extern "C" {
#endif



#ifdef __cplusplus

#define ccom_tag_oifi_cb(_ptr_) (EIF_INTEGER)(UINT)(((OLEINPLACEFRAMEINFO *)_ptr_)->cb)

#define ccom_tag_oifi_set_cb(_ptr_, _field_) ((((OLEINPLACEFRAMEINFO *)_ptr_)->cb) = (UINT)_field_)

#define ccom_tag_oifi_f_mdiapp(_ptr_) (EIF_INTEGER)(LONG)(((OLEINPLACEFRAMEINFO *)_ptr_)->fMDIApp)

#define ccom_tag_oifi_set_f_mdiapp(_ptr_, _field_) ((((OLEINPLACEFRAMEINFO *)_ptr_)->fMDIApp) = (LONG)_field_)

#define ccom_tag_oifi_hwnd_frame(_ptr_) (EIF_POINTER)(HWND)(((OLEINPLACEFRAMEINFO *)_ptr_)->hwndFrame)

#define ccom_tag_oifi_set_hwnd_frame(_ptr_, _field_) ( (((OLEINPLACEFRAMEINFO *)_ptr_)->hwndFrame) = (HWND)_field_)

#define ccom_tag_oifi_h_accel(_ptr_) (EIF_POINTER)(HACCEL)(((OLEINPLACEFRAMEINFO *)_ptr_)->haccel)

#define ccom_tag_oifi_set_h_accel(_ptr_, _field_) ((((OLEINPLACEFRAMEINFO *)_ptr_)->haccel) = (HACCEL)_field_)

#define ccom_tag_oifi_c_accel_entries(_ptr_) (EIF_INTEGER)(UINT)(((OLEINPLACEFRAMEINFO *)_ptr_)->cAccelEntries)

#define ccom_tag_oifi_set_c_accel_entries(_ptr_, _field_) ((((OLEINPLACEFRAMEINFO *)_ptr_)->cAccelEntries) = (UINT)_field_)

#endif
#ifdef __cplusplus
}
#endif

#endif
