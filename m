Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Wed, 7 Feb 2001 11:40:18 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] 0.9.1 vgscan doesn't detect upgraded vg's
Message-ID: <20010207114018.C525@tykepenguin.com>
References: <3A7F6413.A80D1803@twisted.net> <200102070944.f179iw508184@webber.adilger.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200102070944.f179iw508184@webber.adilger.net>; from adilger@turbolinux.com on Wed, Feb 07, 2001 at 02:44:58AM -0700
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Feb 07, 2001 at 02:44:58AM -0700, Andreas Dilger wrote:
> 
> The problem is that UUIDs are being created as we go, so the UUID list
> on the first PV only has the first PV UUID in it.  Exactly the problem
> you are having.  I would think this problem would also show up with the
> PV namelist as well, but maybe things were done slightly differently then.
> It is probably that if you make more than one change which writes out the
> VGDA, the problem is gone because the UUIDs now exist on all PVs.
> 
> The fix is to verify/fix the UUID list before we start writing PV info.
> It appears that vg_write_with_pv_and_lv() is the only place that the UUID
> list is written, via pv_write_uuidlist().

Excellent, thanks Andrea that works for me. I'll put into CVS.
 
> Unfortunately, this doesn't help anyone that currently has a problem, but
> it will prevent such problems for anyone else upgrading their system.

No, but the patch below at least can get them running. It's necessary to
do some metadata changes to get the UUID list committed to disk after this
though.

patrick


diff -u -r1.3.2.3 tools/lib/pv_read_all_pv_of_vg.c
--- pv_read_all_pv_of_vg.c      2001/01/17 14:45:28     1.3.2.3
+++ pv_read_all_pv_of_vg.c      2001/02/06 15:42:40
@@ -114,7 +114,7 @@
             np++;
          }
       }
-
+#if 0 // PJC: work around UUID list problems.
       /* in case this PV already holds a uuid list: check against this list */
       if ( uuids > 0) {
          for ( p = 0; pv_this[p] != NULL; p++) {
@@ -135,7 +135,7 @@
          np = 0;
          while ( pv_this[np] != NULL) np++;
       }
-
+#endif
       /* avoid multiple access pathes */
       if (pv_this) {
          for ( p = 0; pv_this[p] != NULL; p++) {
