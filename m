Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5R8mCPU006731
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 27 Jun 2015 04:48:12 -0400
Received: from mail-vn0-f48.google.com (mail-vn0-f48.google.com
	[209.85.216.48])
	by mx1.redhat.com (Postfix) with ESMTPS id 21EB6C6B07
	for <linux-lvm@redhat.com>; Sat, 27 Jun 2015 08:48:11 +0000 (UTC)
Received: by vnbg1 with SMTP id g1so18477739vnb.12
	for <linux-lvm@redhat.com>; Sat, 27 Jun 2015 01:48:10 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 27 Jun 2015 10:48:10 +0200
Message-ID: <CAE8gLhnpcpOsoyiO5i6FSX7-5Lo+3fMciJgzrppScFDQAWNEQA@mail.gmail.com>
From: MegaBrutal <megabrutal@gmail.com>
Subject: [linux-lvm] Difficulties with creating RAID1 LV
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

Hi all,

Nowadays it's difficult to create raid1 LVs, or converting linear LVs
to raid1. If I try hard, once it succeeds, but it's not supposed to
work like this. I'm on Ubuntu Vivid. I've never experienced this
before, but I didn't create much raid1 LVs before I added plus PVs.
But I don't remember ever having this problem, so whatever it is,
probably it's introduced with Vivid.


Case 1: Creating raid1 LV

root@vmhost:~# lvcreate --verbose --type raid1 --mirrors 1 --extents 1
--name testlv vmhost-vg
    DEGRADED MODE. Incomplete RAID LVs will be processed.
    Setting logging type to disk
    Finding volume group "vmhost-vg"
    Archiving volume group "vmhost-vg" metadata (seqno 112).
    Creating logical volume testlv
    Creating logical volume testlv_rimage_0
    Creating logical volume testlv_rmeta_0
    Creating logical volume testlv_rimage_1
    Creating logical volume testlv_rmeta_1
    activation/volume_list configuration setting not defined: Checking
only host tags for vmhost-vg/testlv_rmeta_0
    Creating vmhost--vg-testlv_rmeta_0
    Loading vmhost--vg-testlv_rmeta_0 table (252:122)
    Resuming vmhost--vg-testlv_rmeta_0 (252:122)
    Clearing metadata area of vmhost-vg/testlv_rmeta_0
    Initializing 512 B of logical volume "vmhost-vg/testlv_rmeta_0"
with value 0.
    Removing vmhost--vg-testlv_rmeta_0 (252:122)
    activation/volume_list configuration setting not defined: Checking
only host tags for vmhost-vg/testlv_rmeta_1
    Creating vmhost--vg-testlv_rmeta_1
    Loading vmhost--vg-testlv_rmeta_1 table (252:122)
    Resuming vmhost--vg-testlv_rmeta_1 (252:122)
    Clearing metadata area of vmhost-vg/testlv_rmeta_1
    Initializing 512 B of logical volume "vmhost-vg/testlv_rmeta_1"
with value 0.
    Removing vmhost--vg-testlv_rmeta_1 (252:122)
    Creating volume group backup "/etc/lvm/backup/vmhost-vg" (seqno 114).
    Activating logical volume "testlv" exclusively.
    activation/volume_list configuration setting not defined: Checking
only host tags for vmhost-vg/testlv
    Creating vmhost--vg-testlv_rmeta_0
    Loading vmhost--vg-testlv_rmeta_0 table (252:122)
    Resuming vmhost--vg-testlv_rmeta_0 (252:122)
    Creating vmhost--vg-testlv_rimage_0
    Loading vmhost--vg-testlv_rimage_0 table (252:123)
    Resuming vmhost--vg-testlv_rimage_0 (252:123)
    Creating vmhost--vg-testlv_rmeta_1
    Loading vmhost--vg-testlv_rmeta_1 table (252:124)
    Resuming vmhost--vg-testlv_rmeta_1 (252:124)
    Creating vmhost--vg-testlv_rimage_1
    Loading vmhost--vg-testlv_rimage_1 table (252:125)
    Resuming vmhost--vg-testlv_rimage_1 (252:125)
    Creating vmhost--vg-testlv
    Loading vmhost--vg-testlv table (252:126)
  device-mapper: reload ioctl on  failed: Device or resource busy
    Removing vmhost--vg-testlv (252:126)
  Failed to activate new LV.
    Creating volume group backup "/etc/lvm/backup/vmhost-vg" (seqno 115).

Result: nothing is actually created according to "lvs -a".


Case 2: Create linear LV and then convert it to raid1

root@vmhost:~# lvcreate --verbose --extents 1 --name testlv vmhost-vg
    DEGRADED MODE. Incomplete RAID LVs will be processed.
    Setting logging type to disk
    Finding volume group "vmhost-vg"
    Archiving volume group "vmhost-vg" metadata (seqno 115).
    Creating logical volume testlv
    Creating volume group backup "/etc/lvm/backup/vmhost-vg" (seqno 116).
    Activating logical volume "testlv".
    activation/volume_list configuration setting not defined: Checking
only host tags for vmhost-vg/testlv
    Creating vmhost--vg-testlv
    Loading vmhost--vg-testlv table (252:126)
    Resuming vmhost--vg-testlv (252:126)
    Wiping known signatures on logical volume "vmhost-vg/testlv"
    Initializing 4.00 KiB of logical volume "vmhost-vg/testlv" with value 0.
    Creating volume group backup "/etc/lvm/backup/vmhost-vg" (seqno 116).
  Logical volume "testlv" created

root@vmhost:~# lvs -a | grep testlv
  testlv                    vmhost-vg -wi-a-----   4.00m

root@vmhost:~# lvconvert --verbose --type raid1 --mirrors 1 vmhost-vg/testlv
    DEGRADED MODE. Incomplete RAID LVs will be processed.
    Archiving volume group "vmhost-vg" metadata (seqno 116).
    Creating logical volume testlv_rmeta_0
    Creating logical volume testlv_rmeta_1
    Creating logical volume testlv_rimage_0
    activation/volume_list configuration setting not defined: Checking
only host tags for vmhost-vg/testlv_rmeta_0
    Creating vmhost--vg-testlv_rmeta_0
  device-mapper: create ioctl on vmhost--vg-testlv_rmeta_0 failed:
Device or resource busy
  Failed to activate localy testlv_rmeta_0 for clearing

root@vmhost:~# lvs -a | grep testlv
  testlv                    vmhost-vg -wi-a-----   4.00m
  testlv_rimage_1           vmhost-vg -wi-------   4.00m
  testlv_rmeta_0            vmhost-vg -wi-------   4.00m
  testlv_rmeta_1            vmhost-vg -wi-------   4.00m

Result: mirror and meta LVs are created as distinct linear LVs and are
not bound together to form a raid1 LV.
