Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4BBcl49003032
	for <linux-lvm@redhat.com>; Thu, 11 May 2006 07:38:47 -0400
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.172])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4BBccsd012938
	for <linux-lvm@redhat.com>; Thu, 11 May 2006 07:38:39 -0400
Received: by ug-out-1314.google.com with SMTP id c2so127577ugf
	for <linux-lvm@redhat.com>; Thu, 11 May 2006 04:38:38 -0700 (PDT)
Message-ID: <539807300605110438i446c188bke97598d6e3105ebe@mail.gmail.com>
Date: Thu, 11 May 2006 19:38:38 +0800
From: "Lee Rocky" <rocky366@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Incorrect metadata are header checksum
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dear all

I tried to craete pv on my xscale system but failed.
create pv command is successful,
but I got the "Incorrect metadata error when scan pvs.
I'm not sure it's a compilation problem or hard disk problem?

does anyone create pv on arm system before?

best regard and have a nice day
Rocky


output log
------------------------------------------------------------------------------------------------------------------
-bash-3.00# pvcreate /dev/sda2 -vv
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
      Locking /var/lock/lvm/P_orphans WB
      /dev/sda2: No label detected
      /dev/sda2: size is 12048750 sectors
      Setting metadata/pvmetadatasize to 1024
      metadata/pvmetadatacopies not found in config: defaulting to 1
      /dev/sda2: size is 12048750 sectors
    Set up physical volume for "/dev/sda2" with 12047598 available sectors
      Scanning for labels to wipe from /dev/sda2
    Zeroing start of device /dev/sda2
      Writing physical volume data to disk "/dev/sda2"
      /dev/sda2: Writing label to sector 1
  Physical volume "/dev/sda2" successfully created
      Unlocking /var/lock/lvm/P_orphans

-bash-3.00# pvscan
  No matching physical volumes found

-bash-3.00# pvscan -vv
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
    Wiping cache of LVM-capable devices
    Wiping internal VG cache
    Walking through all physical volumes
      /dev/sda: size is 17942584 sectors
      /dev/sda1: size is 5879727 sectors
      /dev/sda1: No label detected
      /dev/sda2: size is 12048750 sectors
      /dev/sda2: lvm2 label detected
  Incorrect metadata area header checksum
      /dev/sda2: lvm2 label detected
  Incorrect metadata area header checksum
      /dev/sda2: lvm2 label detected
  Incorrect metadata area header checksum
  PV /dev/sda2         lvm2 [5.74 GB]
  Total: 1 [5.74 GB] / in use: 0 [0   ] / in no VG: 1 [5.74 GB]

-bash-3.00# pvscan --version
  LVM version:     2.02.01 (2005-11-23)
  Library version: 1.02.02 (2005-12-02)
  Driver version:  4.4.0

linux Kernel 2.6.15.4
