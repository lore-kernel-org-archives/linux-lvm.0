Message-ID: <E3A1ACFEDE71D3118C000020352285A01E73C0@nbsjexm2.nbtel.nb.ca>
From: "Shaw, Marco" <marco.shaw@nbtel.nb.ca>
Subject: [linux-lvm] Seg fault on vgscan
Date: Fri, 7 Apr 2000 11:30:18 -0300 
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Not knowing the exact procedure for using lvm's with filesystems already
mounted and in use (/usr, in my case).  I proceeded with the following
commands:

--changed /dev/hda1 (/usr) to 0x8e
--pvcreate /dev/hda1 /dev/hda8
--vgcreate usr_dg /dev/hda8 /dev/hda1

Once this completed, my original /usr had somehow shrunk to 100MB from 300MB
(according to df -k).  I then ran:
--vgchange -an usr_dg

This didn't restore the size expected so rebooted, and the /usr complained
badly about requiring an fsck, which I did, and all appears to be back to
normal.

For now, I'm going to familarize myself more with lvm by using partitions
that are not in use, but I think I need to fix my vgscan problem that
appears to have been caused by my messing around above.  A 'vgscan' output
is below:

#vgscan
....
vg_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
pv_check_consistency -- LEAVING with ret: 0
pv_read_all_pv_of_vg:  pv_name: /dev/hda1  vg_name: usr_dg  p: 0
pv_read_all_pv_of_vg: /dev/hda1[0] hit usr_dg[0]
pv_read_all_pv_of_vg:  pv_name: /dev/hda8  vg_name: usr_dg  p: 1
pv_read_all_pv_of_vg: /dev/hda8[1] hit usr_dg[1]
pv_read_all_pv_of_vg -- LEAVING with ret: 0
vg_read -- pv[0]->pv_name: "/dev/hda1"
vg_read -- pv[1]->pv_name: "/dev/hda8"
vg_copy_from_disk -- CALLED
Segmentation fault

/etc/lvmtab no longer exists, but /etc/lvmconf/usr_dg.conf is still there.


Any ideas?
Marco
