Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9E6rTr22619
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 02:53:29 -0400
Received: from mtagate1.uk.ibm.com (mtagate1.uk.ibm.com [195.212.29.134])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i9E6rMTI025115
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 02:53:23 -0400
Received: from d06nrmr1307.portsmouth.uk.ibm.com
	(d06nrmr1307.portsmouth.uk.ibm.com [9.149.38.129])
	by mtagate1.uk.ibm.com (8.12.10/8.12.10) with ESMTP id i9E6rBDq068226
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 06:53:11 GMT
Received: from d06ml712.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by d06nrmr1307.portsmouth.uk.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	i9E6rAof145768
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 07:53:11 +0100
Message-ID: <OF83C82802.EC260A74-ONC1256F2D.0025C71D-C1256F2D.00260B55@se.ibm.com>
From: Bengt Heijnesson <bengt_heijnesson@se.ibm.com>
Date: Thu, 14 Oct 2004 08:56:22 +0200
MIME-Version: 1.0
Subject: [linux-lvm] lvextend
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com





Hello,

Have tried to extend a volume group but lvextend fails

# lvextend -v -L+1G /dev/itsdata/smb_home
lvextend -- checking for valid logical volume path
lvextend -- locking logical volume manager
lvextend -- checking existence of logical volume "/dev/itsdata/smb_home"
lvextend -- checking for active logical volume "/dev/itsdata/smb_home"
lvextend -- reading volume group data of volume group "itsdata" from
disk(s)
lvextend -- getting index of logical volume "/dev/itsdata/smb_home" in
volume group "itsdata"
lvextend -- getting status of "/dev/itsdata/smb_home" from VGDA in kernel
lvextend -- rounding size to stripe boundary size
lvextend -- extending logical volume "/dev/itsdata/smb_home" to 23.87 GB
lvextend -- setting up logical volume "/dev/itsdata/smb_home" for extend
lvextend -- not enough free/allocatable physical extents to extend logical
volume "/dev/itsdata/smb_home"

vgdisplay:
--- Volume group ---
VG Name               itsdata
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               1
MAX LV Size           255.99 GB
Max PV                256
Cur PV                20
Act PV                20
VG Size               45.70 GB
PE Size               4 MB
Total PE              11700
Alloc PE / Size       5850 / 22.85 GB
Free  PE / Size       5850 / 22.85 GB
VG UUID               w7CoKp-yGH3-OfuG-UQLY-Mu8l-aknD-Ioko6h

Any Hints ?

_______________________________________________________

"Light the fire within people, not underneath them"
