Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i3FN0Kj26187
	for <linux-lvm@redhat.com>; Thu, 15 Apr 2004 19:00:20 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.130])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i3FN0J87022291
	for <linux-lvm@redhat.com>; Thu, 15 Apr 2004 19:00:19 -0400
Received: from westrelay04.boulder.ibm.com (westrelay04.boulder.ibm.com
	[9.17.193.32])
	by e32.co.us.ibm.com (8.12.10/8.12.2) with ESMTP id i3FN0DkV546452
	for <linux-lvm@redhat.com>; Thu, 15 Apr 2004 19:00:13 -0400
Received: from austin.ibm.com (d03av02.boulder.ibm.com [9.17.193.82])
	by westrelay04.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	i3FN0CIY151586
	for <linux-lvm@redhat.com>; Thu, 15 Apr 2004 17:00:12 -0600
Received: from forte.austin.ibm.com (forte.austin.ibm.com [9.53.85.27])
	by austin.ibm.com (8.12.10/8.12.10) with ESMTP id i3FN08bs050222
	for <linux-lvm@redhat.com>; Thu, 15 Apr 2004 18:00:08 -0500
Received: from localhost (ahuja@localhost)
	by forte.austin.ibm.com (AIX4.3/8.9.3/8.9.3-client1.01) with ESMTP id
	SAA72584 for <linux-lvm@redhat.com>; Thu, 15 Apr 2004 18:00:08 -0500
Date: Thu, 15 Apr 2004 18:00:08 -0500 (CDT)
From: ahuja@austin.ibm.com
Message-ID: <Pine.A41.4.44.0404151739370.74660-100000@forte.austin.ibm.com>
MIME-Version: 1.0
Subject: [linux-lvm] Lvdisplay crashes: Bug ???
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


I tried to post this on lvm-devel but seemingly the website for
registration seems to be down so posting it here. I hope some of the lvm
developers will be looking at this mailing list as well.

To recreate:

1. If necessary, create a physical volume, a volume group, and a logical
volume.
2. Create a snapshot of the logical volume.
3. Run 'lvdisplay' on either the original logical volume or its snapshot
lv.

Actual Results:
With 2.4.19 (shipped with SLES 8 base install), the kernel panics.  With
2.4.21-80, messages about bad vfree's appear /var/log/messages.  lvdisplay
sometimes segfaults, sometimes works, but the messages show up regardless.

Expected Results:
Successful completion of lvdisplay without panics or vfree messages or
segfaults.


Here is the sequence of commands I use to reproduce the problem:
# pvcreate /dev/sda4
# vgcreate test_vg /dev/sda4
# lvcreate -L 500M -n test_lv test_vg
# lvcreate -s -L 100M -n test_snap_lv /dev/test_vg/test_lv
# lvdisplay /dev/test_vg/test_lv


Probable cause:

In vg_free.c

vg_free
nt vg_free ( vg_t *vg, int all) {
   int l = 0;
   int p = 0;
   int ret = 0;

   debug_enter ( "vg_free Manish-1- CALLED\n");

   if ( vg == NULL || ( all != TRUE && all != FALSE)) ret = -LVM_EPARAM;
   else {
      debug ( "vg_free -- entering PV loop\n");
      for ( p = 0; p < vg->pv_cur; p++) {
         if ( vg->pv[p] != NULL) {
            if ( vg->pv[p]->pe != NULL)
                        free ( vg->pv[p]->pe);

                ^^^^^^^^^ this fails.


Tracking it down to the earlier call, the ptr values seem to be copied
along with the whole structure. Since this maybe a bad idea. Possibly
fixing that will fix the problem.

static int lvm_do_pv_status(vg_t *vg_ptr, void *arg, unsigned long size)
...
...
 if (copy_to_user(pv_status_req.pv, pv_ptr, size) != 0)
                                return -EFAULT;
....


pv_t structure has the following members and a copy_to_user may be a bad
idea here ??

typedef struct pv_v2 {
        char id[2];             /* Identifier */
        unsigned short version; /*
	.....
	.....
	pe_disk_t *pe;          /* HM */
	.....
}pv_t


Thoughts & suggestions.
