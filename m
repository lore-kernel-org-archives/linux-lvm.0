Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6PEvIpk010459
	for <linux-lvm@redhat.com>; Sun, 25 Jul 2010 10:57:18 -0400
Received: from homiemail-a64.g.dreamhost.com (caiajhbdcahe.dreamhost.com
	[208.97.132.74])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6PEv9Af015244
	for <linux-lvm@redhat.com>; Sun, 25 Jul 2010 10:57:09 -0400
Message-ID: <4C4C50C0.50406@held.org.il>
Date: Sun, 25 Jul 2010 17:57:04 +0300
From: Oren Held <oren@held.org.il>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------080701040402040207050502"
Subject: [linux-lvm] LVM tools return ECMD_FAILED when they shouldn't
	(exported vg)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com
Cc: Meori Oransky <MEORIO@il.ibm.com>

This is a multi-part message in MIME format.
--------------080701040402040207050502
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi All,

We have encountered an unexpected behavior, in which 'lvs' command
behaves well (lists the LV's) but still returns rc==5. Well, the reason
is that we've had an exported vg. It's indeed something the user might
care about, yet its severity should be less than other "failed command"
situations.

What I suggest, is adding a new error type "EXPORTED_VG_WARNING", for
these cases, that would be returned by toollib.c's
process_each_lv_in_vg() function in this specific case of
failure-because-vg-is-exported.

I've used error number 4 (it seemed available), because the erroring
mechanism in process_each_lv cares about the error number's value, so it
should be lower than ECMD_FAILED.

Attached is the patch.

Best Regards

Oren Held

--------------080701040402040207050502
Content-Type: text/x-patch;
	name="lvm-distinguish-between-fail-and-exported-vg-status.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="lvm-distinguish-between-fail-and-exported-vg-status.patch"

? doc/example.conf
? include/.symlinks
? lib/misc/lvm-version.h
? libdm/.exported_symbols_generated
? libdm/ioctl/libdevmapper.so.1.02
? scripts/clvmd_init_red_hat
? scripts/cmirrord_init_red_hat
? scripts/lvm2_monitoring_init_red_hat
? tools/dmsetup
? tools/lvm
Index: lib/commands/errors.h
===================================================================
RCS file: /cvs/lvm2/LVM2/lib/commands/errors.h,v
retrieving revision 1.6
diff -u -r1.6 errors.h
--- lib/commands/errors.h	30 Jun 2009 18:39:31 -0000	1.6
+++ lib/commands/errors.h	25 Jul 2010 13:51:56 -0000
@@ -19,6 +19,7 @@
 #define ECMD_PROCESSED		1
 #define ENO_SUCH_CMD		2
 #define EINVALID_CMD_LINE	3
+#define ECMD_EXPORTED_VG	4
 #define ECMD_FAILED		5
 
 /* FIXME Also returned by cmdlib. */
Index: tools/toollib.c
===================================================================
RCS file: /cvs/lvm2/LVM2/tools/toollib.c,v
retrieving revision 1.207
diff -u -r1.207 toollib.c
--- tools/toollib.c	30 Jun 2010 20:03:53 -0000	1.207
+++ tools/toollib.c	25 Jul 2010 13:51:58 -0000
@@ -101,7 +101,7 @@
 	struct lv_list *lvl;
 
 	if (!vg_check_status(vg, EXPORTED_VG))
-		return ECMD_FAILED;
+		return ECMD_EXPORTED_VG;
 
 	if (tags && !dm_list_empty(tags))
 		tags_supplied = 1;

--------------080701040402040207050502--
