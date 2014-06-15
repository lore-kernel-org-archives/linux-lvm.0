Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s5FJ1Nr2030386
	for <linux-lvm@redhat.com>; Sun, 15 Jun 2014 15:01:23 -0400
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s5FJ1Le5026865
	for <linux-lvm@redhat.com>; Sun, 15 Jun 2014 15:01:22 -0400
Received: by mail-wg0-f45.google.com with SMTP id l18so4774537wgh.16
	for <linux-lvm@redhat.com>; Sun, 15 Jun 2014 12:01:21 -0700 (PDT)
Received: from Yalusas-MacBook-Pro.local
	(105-237-31-228.access.mtnbusiness.co.za. [105.237.31.228])
	by mx.google.com with ESMTPSA id
	o46sm28453163eef.31.2014.06.15.12.01.20 for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 15 Jun 2014 12:01:20 -0700 (PDT)
Message-ID: <539DED80.50704@gmail.com>
Date: Sun, 15 Jun 2014 21:01:20 +0200
From: Jongitech <jongitech@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Has the failed drive been removed from the vg?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi,

I have a 1.5TB drive (/dev/sda) that failed but may have started failing 
over the the previous week (there was a point where the system did a 
fsck on the vg which I thought was related to the system rebooting after 
a power failure). I didn't notice anything untoward until today when I 
gather the drive finally failed.

The thing is that when I run the various commands, there is nothing to 
suggest that this drive is part of the vg yet I know it was

# vgdisplay
   /dev/sda: read failed after 0 of 1024 at 0: Input/output error
   /dev/sda: read failed after 0 of 1024 at 4141940736: Input/output error
   /dev/sda: read failed after 0 of 1024 at 4142043136: Input/output error
   /dev/sda: read failed after 0 of 1024 at 4096: Input/output error
   /dev/sda: read failed after 0 of 2048 at 0: Input/output error
   --- Volume group ---
   VG Name               mythtv
   System ID
   Format                lvm2
   Metadata Areas        3
   Metadata Sequence No  2
   VG Access             read/write
   VG Status             resizable
   MAX LV                0
   Cur LV                1
   Open LV               1
   Max PV                0
   Cur PV                3
   Act PV                3
   VG Size               6.77 TiB
   PE Size               4.00 MiB
   Total PE              1775136
   Alloc PE / Size       1775136 / 6.77 TiB
   Free  PE / Size       0 / 0
   VG UUID               634Wwa-MmIs-MWXO-zm7v-7Hhf-bX27-kO3WMg

# pvdisplay -v
     Scanning for physical volume names
   /dev/sda: read failed after 0 of 1024 at 0: Input/output error
   /dev/sda: read failed after 0 of 1024 at 4141940736: Input/output error
   /dev/sda: read failed after 0 of 1024 at 4142043136: Input/output error
     /dev/sda: read failed after 0 of 1024 at 0: Input/output error
   /dev/sda: read failed after 0 of 1024 at 4096: Input/output error
   /dev/sda: read failed after 0 of 2048 at 0: Input/output error
   --- Physical volume ---
   PV Name               /dev/sdb4
   VG Name               mythtv
   PV Size               2.68 TiB / not usable 4.00 MiB
   Allocatable           yes (but full)
   PE Size               4.00 MiB
   Total PE              702042
   Free PE               0
   Allocated PE          702042
   PV UUID               Mv8MD7-Lfmn-A5Gh-dGrD-jnlA-9XI0-cPcTdg

   --- Physical volume ---
   PV Name               /dev/sdc1
   VG Name               mythtv
   PV Size               1.36 TiB / not usable 4.88 MiB
   Allocatable           yes (but full)
   PE Size               4.00 MiB
   Total PE              357698
   Free PE               0
   Allocated PE          357698
   PV UUID               Yw0lux-Wndt-50np-8HNy-ZE0T-apn0-KbvT8P

   --- Physical volume ---
   PV Name               /dev/sdd1
   VG Name               mythtv
   PV Size               2.73 TiB / not usable 3.00 MiB
   Allocatable           yes (but full)
   PE Size               4.00 MiB
   Total PE              715396
   Free PE               0
   Allocated PE          715396
   PV UUID               1BF9Mi-p2F3-oicD-A9C9-G2X0-LGcW-Eizc7e

 From the above I should be able to physically remove the drive and add 
a new one (to the VG) using the standard procedures?

Thanks in advance,
Jongi
