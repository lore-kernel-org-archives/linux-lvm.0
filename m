Return-Path: <vidalrod@informatik.tu-muenchen.de>
Message-ID: <3B0B9B31.57000FFC@in.tum.de>
Date: Wed, 23 May 2001 13:12:49 +0200
From: David Vidal Rodriguez <vidalrod@informatik.tu-muenchen.de>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------70979C02EA60FD112D811B52"
Subject: [linux-lvm] Patch for Fragments-2.4.0
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
To: lvm <linux-lvm@sistina.com>

This is a multi-part message in MIME format.
--------------70979C02EA60FD112D811B52
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Can someone apply this patch to the LVM CVS-version? It adds the lines
missing in the file PATCHES/fragments-2.4.0 in order for the kernel to
compile.

Thanks!

--
  ------------------------------------------------------------------------
 David Vidal R. (vidalrod <at> in DOT tum DOT de)



--------------70979C02EA60FD112D811B52
Content-Type: text/plain; charset=us-ascii;
 name="fragments-2.4.0.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="fragments-2.4.0.patch"

--- LVM/PATCHES/fragments-2.4.0	Tue Apr 24 16:29:19 2001
+++ LVM/PATCHES/Fragments-2.4.0	Wed May 23 13:06:37 2001
@@ -1,3 +1,7 @@
 fragments/remove_procfs_config-2.4.patch
 fragments/export_kiobuf_wait_for_io.patch
 fragments/remove_lvm_init_from_ll_rw_block.patch
+fragments/add_lvm_fs_2.4.patch
+fragments/remove_lvm_snap_h_2.4.patch
+fragments/register_ioctl_2.4.patch
+

--------------70979C02EA60FD112D811B52--
