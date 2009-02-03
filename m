Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n13LZ2hQ020593
	for <linux-lvm@redhat.com>; Tue, 3 Feb 2009 16:35:02 -0500
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.239])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n13LYlC5000327
	for <linux-lvm@redhat.com>; Tue, 3 Feb 2009 16:34:47 -0500
Received: by rv-out-0506.google.com with SMTP id f6so2523454rvb.51
	for <linux-lvm@redhat.com>; Tue, 03 Feb 2009 13:34:46 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 4 Feb 2009 03:04:46 +0530
Message-ID: <a80c86b70902031334r26bdefe6odb0b0d6d80ab85c@mail.gmail.com>
From: Prateek Donni <prateek.donni@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problem With LVM mirroring
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

I am trying to mirror a logical Volume with only one duplicate copy.
I have a 2 hard drives.
I have a PV on the second hard drive and one on an USB drive. as follows:

-------------------------------------------------------------------------------------------------------------
 --- Physical volume ---
  PV Name               /dev/sda8
  VG Name               Group
  PV Size               7.81 GB / not usable 1.09 MB
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              2000
  Free PE               2000
  Allocated PE          0
  PV UUID               sLSoCU-4tMO-z1fk-royV-r8ND-PcoF-c0Wza5

  --- Physical volume ---
  PV Name               /dev/sdc
  VG Name               Group
  PV Size               3.77 GB / not usable 4.00 MB
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              963
  Free PE               963
  Allocated PE          0
  PV UUID               IWIYlR-UuGy-kFo6-E1j1-qu1B-7KfI-beAjhF
-----------------------------------------------------------------------------------------------------------

On top of this i have a VG also consisting of these two PVs.
I would like to know how can i make a LV in this which is mirroed with
only one Duplicate copy. As in an original and a copy of the original.

I have been unable to even create a LV of size 500M using this.
Kindly Help.

Thanks,
Prateek
