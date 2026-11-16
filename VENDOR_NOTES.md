# vendor/samsung/scx30g2-common - Android 9 adaptation notes

Source: android_vendor_samsung_scx30g2-common (cm-14.1, 49 proprietary files).
Kept: 40 files. Dropped: 9 files + 1 placeholder. Rules used:

## Dropped (the Android 9 tree already builds its own version from source)
- bin/rild, lib/libril.so, lib/libsecril-client.so, lib/libatchannel.so
  -> built from hardware/ril / hardware/sprd, rild lives in /vendor/bin/hw (HIDL radio). A stock copy in
  /system/lib would shadow the Android 9 library of the same name.

## Dropped (cannot work on Android 9 as shipped)
- bin/engpc: needs libefuse.so / libgpspc.so which exist nowhere in the tree (factory tool, not needed to boot)
- lib/libsoundalive.so, lib/lib_SoundAlive_play_plus_ver126a.so, lib/soundfx/libaudiosa_sec.so:
  Samsung SoundAlive effects; depend on libs not present in the repo or on removed libgcc EH helpers
- lib/libawb.so: was never listed in the 14.1 makefile (unused)
- lib/libboost.so: 643-byte text placeholder, not an ELF library

## Changed
- lib/egl/libGLES_mali.so and lib/hw/gralloc.sc8830.so: DT_NEEDED libion.so rewritten to libion_sprd.so
  (patchelf). Android 9 libion has no ion_invalidate_fd; hardware/sprd/libion_sprd provides it.

## Kept but known to be fragile on Android 9 (not needed for first boot)
- bin/gpsd: references OpenSSL symbols (CRYPTO_malloc) that BoringSSL does not export -> GPS will not work
- lib/libreference-ril_sp.so: needs the old Parcel::writeString16 ABI -> handled through libril_shim (LD_SHIM_LIBS)
- lib/libomx_*_sprd.so: hardware codecs, depend on hardware/sprd libstagefright shims
