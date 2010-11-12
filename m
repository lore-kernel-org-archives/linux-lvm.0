Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAC9aFXk030688
	for <linux-lvm@redhat.com>; Fri, 12 Nov 2010 04:36:15 -0500
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAC9a07W013435
	for <linux-lvm@redhat.com>; Fri, 12 Nov 2010 04:36:00 -0500
Received: from ALA-MAIL03.corp.ad.wrs.com (ala-mail03 [147.11.57.144])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id oAC9a0m6002575
	for <linux-lvm@redhat.com>; Fri, 12 Nov 2010 01:36:00 -0800 (PST)
Message-ID: <4CDD0B18.8060200@windriver.com>
Date: Fri, 12 Nov 2010 17:38:32 +0800
From: xufeng zhang <xufeng.zhang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Bug: LVM2 create long name device failed but we can see
 it by run lvs
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi,

I found a potential bug in LVM2.2.02.25, but it is also exist in 
LVM2.2.02.76 after I checked.

This is the bug description:
When we create a logic volume with long names(such as 125), LVM2 will 
return "Name too long" error
and create volume failed. However, you will see it exist in volume group 
if you run lvs command.
The reason is that when LVM2 create a empty device in lv_create_empty() 
function, it didn't check the
length of device names, but the empty device activate failed afterward 
because of too long name(vgname+lvname>128).

I made a patch for LVM2.2.02.25 by adding name length check.
--- LVM2.2.01.05.orig/lib/misc/lvm-string.h       2010-11-12 
15:05:52.000000000 +0800
+++ LVM2.2.01.05/lib/misc/lvm-string.h            2010-11-12 
14:57:02.000000000 +0800
@@ -34,4 +34,6 @@
                  char c);
  unsigned count_chars_len(const char *str, size_t size, char c);

+unsigned count_lvname_add_vgname_len(const char *vgname,
+               const char *lvname);
  #endif
--- LVM2.2.01.05.orig/lib/misc/lvm-string.c       2010-11-12 
15:05:52.000000000 +0800
+++ LVM2.2.01.05/lib/misc/lvm-string.c            2010-11-12 
14:57:02.000000000 +0800
@@ -83,6 +83,19 @@
         }
  }

+unsigned count_lvname_add_vgname_len(const char *vgname, const char 
*lvname)
+{
+        unsigned sum_len = 1;
+        int sum_hyphens = 0;
+
+        count_chars(vgname, &sum_len, &sum_hyphens, '-');
+        count_chars(lvname, &sum_len, &sum_hyphens, '-');
+
+        sum_len += sum_hyphens;
+
+        return sum_len;
+}
+
  /*
   * <vg>-<lv>-<layer> or if !layer just <vg>-<lv>.
   */
--- LVM2.2.01.05.orig/lib/metadata/lv_manip.c       2010-11-12 
15:05:52.000000000 +0800
+++ LVM2.2.01.05/lib/metadata/lv_manip.c            2010-11-12 
14:57:02.000000000 +0800
@@ -1494,6 +1494,7 @@
         struct lv_list *ll = NULL;
         struct logical_volume *lv;
         char dname[NAME_LEN];
+       unsigned sum_len;

         if (vg->max_lv && (vg->max_lv == vg->lv_count)) {
                 log_error("Maximum number of logical volumes (%u) reached "
@@ -1501,6 +1502,15 @@
                 return NULL;
         }

+       /* we must ensure the sum length of vgname and lvname don't
+          exceed DM_NAME_LEN before we create an empty logic device */
+       if ((sum_len = count_lvname_add_vgname_len(vg->name, name)) >= 
NAME_LEN) {
+               log_error("Group Name \"%s\" plus Device Name \"%s\" is 
too long\n",
+                       vg->name, name);
+               log_error("Logical volume \"%s\" created failed.\n", name);
+               return NULL;
                                                                                                                                                                                              9,1           61%
   if (strstr(name, "%d") &&
             !(name = generate_lv_name(vg, name, dname, sizeof(dname)))) {
                 log_error("Failed to generate unique name for the new "



Thanks,
Xufeng Zhang
