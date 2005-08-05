Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j75KSTV02975
	for <linux-lvm@redhat.com>; Fri, 5 Aug 2005 16:28:29 -0400
Received: from mailhub.lss.emc.com (mailhub.lss.emc.com [168.159.2.31])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j75KSRM8021487
	for <linux-lvm@redhat.com>; Fri, 5 Aug 2005 16:28:27 -0400
Received: from srexchimc2.eng.emc.com (srexchimg2.eng.emc.com [168.159.100.11]
	(may be forged))
	by mailhub.lss.emc.com (Switch-3.1.6/Switch-3.1.6) with ESMTP id
	j75KSPTC022695
	for <linux-lvm@redhat.com>; Fri, 5 Aug 2005 16:28:26 -0400 (EDT)
Message-ID: <82CC5B790FEB854BBD58EEBA156E5C68C0D0CE@SRMOON.eng.emc.com>
From: "krishnakumar, narasimha" <krishnakumar_narasimha@emc.com>
Date: Fri, 5 Aug 2005 16:28:21 -0400 
MIME-Version: 1.0
Subject: [linux-lvm] Problem with Metadata at the beginning of the disk
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
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@redhat.com'" <linux-lvm@redhat.com>

Hi All,

I am having a problem with the metadata at the beginning of the disk. The
disk is a whole disk with a valid partition table. The disk is part of a
volume group. The operations I am trying to do are the following

1. pvcreate /dev/sdf
2. vgcreate samplevg  /dev/sdf
3. Open the device (/dev/sdf) read only (using open system call)
4. read 512 bytes from the beginning of the device.

 I expect atleast the ID "HM" to be at the beginning of the disk but the
first block (512 bytes) is all 0. Anybody have any ideas how I can get the
information like the id, version etc. Any help would be appreciated.

Thanks,
Narasimha Krishnakumar.
