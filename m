Message-ID: <20000418160645.6431.qmail@servnix.lan.wronline.de>
Date: Tue, 18 Apr 2000 18:06:45 +0200
From: "Stefan Paletta" <paletta@WRonline.de>
Subject: Re: [linux-lvm] Devfs and lvm problems
References: <20000418162852.A22888@pharos.hsp.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="mP3DRpeJDSE+ciuQ"
Content-Transfer-Encoding: 8bit
In-Reply-To: <20000418162852.A22888@pharos.hsp.de>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

matthaes@pharos.hsp.de wrote/schrieb/scribsit:
> 1.) devfsd doesn=EF=BF=BDt create /dev/vg00/group etc files, so vgchange =
-ay
>     fails
>=20
> 2.) vgscan fails with=20
>=20
> vgscan -- found inactive volume group "vg00"
> vgscan -- ERROR "lvm_remouverecursive(): opendir" removing volume group d=
irectory and special files
> vgscan -- ERROR "lvm_remouverecursive(): opendir" creating "/etc/lvmtab" =
and "/etc/lvmtab.d"

The problem is that vgscan wants to recursively remove /dev/vg00 and
its contents but mishandles the case that /dev/vg00 does not even
exist anymore (since after a reboot a devfs is 'clean').

This is easy to fix, I'm attaching a patch.
Would the lvmtools maintainer consider this patch for inclusion into
the tree?

Stefan

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lvm_devfs.patch"

--- 0.8final/tools/lib/lvm_remove_recursive.c.orig	Tue Feb 22 03:09:32 2000
+++ 0.8final/tools/lib/lvm_remove_recursive.c	Tue Apr 18 10:27:44 2000
@@ -33,9 +33,9 @@
 #ifdef DEBUG
    debug_enter ( "lvm_remove_recursive -- CALLED with dir: %s\n", dir);
 #endif
-   if ( dir != NULL) {
+   if ( (dir != NULL) && (lstat ( dir, &sb) == 0) ) {
       /* check beeing called with a file name */
-      if ( lstat ( dir, &sb) == 0 && !S_ISDIR ( sb.st_mode)) unlink ( dir);
+      if (  !S_ISDIR ( sb.st_mode)) unlink ( dir);
       else {
          /* open and read the directory */
          if ( ( this_dir = opendir ( dir)) != NULL) {

--mP3DRpeJDSE+ciuQ--
