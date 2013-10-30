Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r9UGFLGA006386
	for <linux-lvm@redhat.com>; Wed, 30 Oct 2013 12:15:22 -0400
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9UGFId9014165
	for <linux-lvm@redhat.com>; Wed, 30 Oct 2013 12:15:19 -0400
Received: by mail-ee0-f53.google.com with SMTP id e51so765147eek.40
	for <linux-lvm@redhat.com>; Wed, 30 Oct 2013 09:15:18 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 30 Oct 2013 10:15:17 -0600
Message-ID: <CAFp1kvNszqemQ4P8miHoUDpzN01ac6FxKuvLpjsCSWXAJZ6kcw@mail.gmail.com>
From: Shi Jin <jinzishuai@gmail.com>
Subject: [linux-lvm] Fail to establish LVM2 RAID-1 to an iSCSI Disk after
	Rebooting RHEL-6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi there,

I have a slightly non-traditional setup of a RHEL-6.4 box where it is
mirrored using LVM2 RAID-1 to a iSCSI target which is connected by the
RHEL-6 itself via open-iscsi after it boots.

I am not doing any ramdisk change to the box to connect to the iSCSI
while kernel is loading since I believe there is a way to do
incremental resynch of the RAID-1 after Linux boots.

Before the reboot, I have a healthy raid-1 between local disk (sda)
and iscsi disk (sdb):

[root@dg-test-rhel2 LinuxOnboarding]#  lvs -a -o +seg_pe_ranges
  LV                 VG             Attr      LSize  Pool Origin Data%
 Move Log Cpy%Sync Convert PE Ranges
  lv_root            vg_dgtestrhel1 rwi-aor-- 15.57g
            100.00         lv_root_rimage_0:0-3985
lv_root_rimage_1:0-3985
  [lv_root_rimage_0] vg_dgtestrhel1 iwi-aor-- 15.57g
                           /dev/sda2:0-3985
  [lv_root_rimage_1] vg_dgtestrhel1 iwi-aor-- 15.57g
                           /dev/sdb2:1-3986
  [lv_root_rmeta_0]  vg_dgtestrhel1 ewi-aor--  4.00m
                           /dev/sda2:4866-4866
  [lv_root_rmeta_1]  vg_dgtestrhel1 ewi-aor--  4.00m
                           /dev/sdb2:0-0
  lv_swap            vg_dgtestrhel1 rwi-aor--  3.44g
            100.00         lv_swap_rimage_0:0-879
lv_swap_rimage_1:0-879
  [lv_swap_rimage_0] vg_dgtestrhel1 iwi-aor--  3.44g
                           /dev/sda2:3986-4865
  [lv_swap_rimage_1] vg_dgtestrhel1 iwi-aor--  3.44g
                           /dev/sdb2:3988-4867
  [lv_swap_rmeta_0]  vg_dgtestrhel1 ewi-aor--  4.00m
                           /dev/sda2:4867-4867
  [lv_swap_rmeta_1]  vg_dgtestrhel1 ewi-aor--  4.00m
                           /dev/sdb2:3987-3987

[root@dg-test-rhel2 LinuxOnboarding]# pvs -v
    Scanning for physical volume names
  PV         VG             Fmt  Attr PSize  PFree   DevSize PV UUID
  /dev/sda2  vg_dgtestrhel1 lvm2 a--  19.51g 504.00m  19.51g
MNbVOF-3d8V-kOFB-Y1X4-6sgw-Ny24-9Knicq
  /dev/sdb2  vg_dgtestrhel1 lvm2 a--  21.87g   2.86g  21.88g
9hlSsu-I8Rc-2IMl-tQyb-NAf0-RqWO-LJBkRf
[root@dg-test-rhel2 LinuxOnboarding]# vgs
  VG             #PV #LV #SN Attr   VSize  VFree
  vg_dgtestrhel1   2   2   0 wz--n- 41.38g 3.35g

After I reboot the box, Linux will automatically connects to the iscsi
LUN but the mirror is broken (if I do any write, I only see disk
activity on sda):
[root@dg-test-rhel2 ~]#  lvs -a -o +seg_pe_ranges
  LV                 VG             Attr      LSize  Pool Origin Data%
 Move Log Cpy%Sync Convert PE Ranges
  lv_root            vg_dgtestrhel1 rwi-aor-- 15.57g
            100.00         lv_root_rimage_0:0-3985
lv_root_rimage_1:0-3985
  [lv_root_rimage_0] vg_dgtestrhel1 iwi-aor-- 15.57g
                           /dev/sda2:0-3985
  [lv_root_rimage_1] vg_dgtestrhel1 iwi-a-r-- 15.57g
                           /dev/sdb2:1-3986
  [lv_root_rmeta_0]  vg_dgtestrhel1 ewi-aor--  4.00m
                           /dev/sda2:4866-4866
  [lv_root_rmeta_1]  vg_dgtestrhel1 ewi-a-r--  4.00m
                           /dev/sdb2:0-0
  lv_swap            vg_dgtestrhel1 rwi-aor--  3.44g
            100.00         lv_swap_rimage_0:0-879
lv_swap_rimage_1:0-879
  [lv_swap_rimage_0] vg_dgtestrhel1 iwi-aor--  3.44g
                           /dev/sda2:3986-4865
  [lv_swap_rimage_1] vg_dgtestrhel1 iwi-a-r--  3.44g
                           /dev/sdb2:3988-4867
  [lv_swap_rmeta_0]  vg_dgtestrhel1 ewi-aor--  4.00m
                           /dev/sda2:4867-4867
  [lv_swap_rmeta_1]  vg_dgtestrhel1 ewi-a-r--  4.00m
                           /dev/sdb2:3987-3987
[root@dg-test-rhel2 ~]# pvs
  PV         VG             Fmt  Attr PSize  PFree
  /dev/sda2  vg_dgtestrhel1 lvm2 a--  19.51g 504.00m
  /dev/sdb2  vg_dgtestrhel1 lvm2 a--  21.87g   2.86g
[root@dg-test-rhel2 ~]# vgs
  VG             #PV #LV #SN Attr   VSize  VFree
  vg_dgtestrhel1   2   2   0 wz--n- 41.38g 3.35g


Please note that the  [lv_root_rimage_1] and  [lv_root_rmeta_1]
devices are no longer open even though LVM reports there is a mirror.

I am looking for a simple LVM command that could force the RAID-1
mirror to resynch (ideally incrementally since we have the bitmap
device which should track all the un-synched data). I am able to
convert the LV to Linear volumes and re-create the mirror once again
but that is very lame.

Please help!
Many thanks,

Shi
PS. My OS information

[root@dg-test-rhel2 ~]# cat /etc/redhat-release
Red Hat Enterprise Linux Server release 6.4 (Santiago)
[root@dg-test-rhel2 ~]# uname -a
Linux dg-test-rhel2.doe.local 2.6.32-358.el6.x86_64 #1 SMP Tue Jan 29
11:47:41 EST 2013 x86_64 x86_64 x86_64 GNU/Linux
[root@dg-test-rhel2 ~]# lvm version
  LVM version:     2.02.98(2)-RHEL6 (2012-10-15)
  Library version: 1.02.77-RHEL6 (2012-10-15)
  Driver version:  4.23.6
[root@dg-test-rhel2 ~]#
