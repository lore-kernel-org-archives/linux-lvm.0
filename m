Return-Path: <jay@lazy.accessus.net>
Date: Thu, 14 Dec 2000 04:34:32 -0600 (CST)
From: Jay Weber <jay@lazy.accessus.net>
Message-ID: <Pine.OSF.4.21.0012140413110.28008-100000@lazy.accessus.net>
MIME-Version: 1.0
Subject: [linux-lvm] PATCH - LVM 0.9 CVS as of 12/14/00.
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

Quick patch to fix issue with output of improper Totat PE's on vgdisplay
and so it will update Total PE's properly when doing a vgextend.  Think
somebody might have just added this line in the wrong spot. :)

--- lvm.c	Mon Dec 11 18:31:32 2000
+++ lvm.c.fix	Thu Dec 14 02:40:27 2000
@@ -2104,6 +2104,7 @@
 				ret = lvm_do_pv_create(arg, vg_ptr, p);
 				if ( ret != 0) return ret;
 				pv_ptr = vg_ptr->pv[p];
+				vg_ptr->pe_total += pv_ptr->pe_total;
 				lvm_do_create_proc_entry_of_pv ( vg_ptr, pv_ptr);
 				return 0;
 			}
@@ -2287,7 +2288,6 @@
 	pv_ptr->pv_status = PV_ACTIVE;
 	vg_ptr->pv_act++;
 	vg_ptr->pv_cur++;
-	vg_ptr->pe_total += pv_ptr->pe_total;
 
 	return 0;
 } /* lvm_do_pv_create() */
