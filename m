Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6SEGZa12031
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2004 10:16:35 -0400
Received: from fwproxy.iosmd.com ([195.6.124.189])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i6SEGXe1005590
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2004 10:16:34 -0400
Received: from [1.1.1.20] (pc-dev.ios.loc [1.1.1.20])
	by fwproxy.iosmd.com (AIX4.3/8.9.3p2/8.9.3) with ESMTP id QAA15790
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2004 16:15:43 +0200
Message-ID: <4107B498.5060906@iosmd.com>
Date: Wed, 28 Jul 2004 16:13:44 +0200
From: =?ISO-8859-15?Q?St=E9phane_Danel?= <stephane.danel@iosmd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Restore partial volume group
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

Hi,

one disk crashed in a volume group which have 2 disks.

Heinz told me
"With the missing disk, you need LVM2 (eg, in Fedora > 1) to access
the non-quorum VG."

I installed LVM 2 , it tells me that it expects 2 disks.

    #vgscan
 Reading all physical volumes.  This may take a while...
  1 PV(s) found for VG MonGroupeVolume: expected 2
  Volume group "MonGroupeVolume" not found

    #pvscan
  1 PV(s) found for VG MonGroupeVolume: expected 2
  PV /dev/hdc1    is in exported VG MonGroupeVolume [28.51 GB / 18.51 GB=20
free]
  Total: 1 [18.51 GB] / in use: 1 [18.51 GB] / in no VG: 0 [0   ]

    #lvscan
  1 PV(s) found for VG MonGroupeVolume: expected 2
  Volume group "MonGroupeVolume" not found

    # pvdisplay
  1 PV(s) found for VG MonGroupeVolume: expected 2
  Physical volume "/dev/hdc1" of volume group "MonGroupeVolume" is exported
  --- Physical volume ---
  PV Name               /dev/hdc1
  VG Name               MonGroupeVolume (exported)
  PV Size               28.51 GB / not usable 4.22 MB
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              7298
  Free PE               4738
  Allocated PE          2560
  PV UUID               Wpa9Ti-SAI0-rhCh-03K6-7D55-m7XA-42Twvh

=20
What I have to do now without mistakes ?

Is it possible to attach this physical volume to another VG and get his=20
datas ?


thank you,


St=EF=BF=BDphane Danel
