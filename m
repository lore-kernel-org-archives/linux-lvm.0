Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k86IAdPh003911
	for <linux-lvm@redhat.com>; Wed, 6 Sep 2006 14:10:39 -0400
Received: from mxsf41.cluster1.charter.net (mxsf41.cluster1.charter.net
	[209.225.28.173])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k86IAZXV009090
	for <linux-lvm@redhat.com>; Wed, 6 Sep 2006 14:10:35 -0400
Received: from mxip10a.cluster1.charter.net (mxip10a.cluster1.charter.net
	[209.225.28.140])
	by mxsf41.cluster1.charter.net (8.12.11.20060308/8.12.11) with ESMTP id
	k86IATCL023338
	for <linux-lvm@redhat.com>; Wed, 6 Sep 2006 14:10:29 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <17663.3860.585020.697171@smtp.charter.net>
Date: Wed, 6 Sep 2006 14:10:28 -0400
From: "John Stoffel" <john@stoffel.org>
Subject: [linux-lvm] lvextend fails with: Failed to suspend home_lv
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com


Hi,

I've got a 2.6.18-rc5-mm1 kernel on an Dual processor Xeon 550mhz
system running Debian unstable, updated today.  I've got a pair of
120gb disks mirrored using md, setup so that the single partition
on the disks is /dev/md0.  I've got a PV setup on there, with a couple
of LVs, which then have ext3 filesystems on them, mounted as /home and
/local respectively.  

I just removed another LV which I didn't need anymore of around 25G in
size.  I'd like to now lvextend one of my two remaining LVs to then
beable to re-size the ext3 filesystem for more space.  But I get:

  # lvextend -v -L +1g /dev/data_vg/home_lv
    Finding volume group data_vg
    Archiving volume group "data_vg" metadata (seqno 16).
    Extending logical volume home_lv to 52.00 GB
    Creating volume group backup "/etc/lvm/backup/data_vg" (seqno 17).
    Found volume group "data_vg"
    Found volume group "data_vg"
    Loading data_vg-home_lv table
    device-mapper: reload ioctl failed: Invalid argument
    Failed to suspend home_lv

My details:

  # lvm version
    LVM version:     2.02.06 (2006-05-12)
    Library version: 1.02.08 (2006-07-17)
    Driver version:  4.8.0

  # vgs
    VG      #PV #LV #SN Attr   VSize   VFree 
    data_vg   1   3   0 wz--n- 111.79G 24.79G

  # pvs --segments
    PV         VG      Fmt  Attr PSize   PFree  Start SSize
    /dev/md0   data_vg lvm2 a-   111.79G 24.79G     0 10240
    /dev/md0   data_vg lvm2 a-   111.79G 24.79G 10240  7680
    /dev/md0   data_vg lvm2 a-   111.79G 24.79G 17920  2816
    /dev/md0   data_vg lvm2 a-   111.79G 24.79G 20736  1280
    /dev/md0   data_vg lvm2 a-   111.79G 24.79G 22016   256
    /dev/md0   data_vg lvm2 a-   111.79G 24.79G 22272  6345

  # lvs --segments
    LV       VG      Attr   #Str Type   SSize  
    home_lv  data_vg -wi-ao    1 linear 40.00G 
    home_lv  data_vg -wi-ao    1 linear 11.00G 
    local_lv data_vg -wi-ao    1 linear 30.00G 
    local_lv data_vg -wi-ao    1 linear  5.00G 
    test     data_vg -wi-a-    1 linear  1.00G 


In my dmesg log I'm seeing the following:

  device-mapper: table: 253:0: linear: dm-linear: Device lookup failed
  device-mapper: ioctl: error adding target to table

Any hints on what I need to do here?  I can create a test LV (as shown
above) but I can't extend either LV which already exists.

Thanks,
John
