Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0V7Ht121059
	for <linux-lvm@redhat.com>; Tue, 31 Jan 2006 02:17:55 -0500
Received: from mos-eisley-e1.netspot.com.au (mos-eisley-e9.netspot.com.au
	[203.30.161.138])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0V7Hr7f021771
	for <linux-lvm@redhat.com>; Tue, 31 Jan 2006 02:17:54 -0500
Received: from [10.2.2.8] (wicket.int.netspot.com.au [10.2.2.8])
	(authenticated bits=0)
	by mos-eisley-e1.netspot.com.au (8.13.4/8.13.4/Debian-3) with ESMTP id
	k0V7HevW009783
	for <linux-lvm@redhat.com>; Tue, 31 Jan 2006 17:47:41 +1030
Message-ID: <43DF0F13.3060302@netspot.com.au>
Date: Tue, 31 Jan 2006 17:47:39 +1030
From: Tom Lanyon <tom@netspot.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvmove errors
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

Hi List,

I need to move all the data off of my external scsi array and remove it
from my volume group.
The external array is /dev/cciss/c1d0p0, so I issued a pvmove with the
following results:

>/sbin/sh-2.05b# pvmove --version
>pvmove: Logical Volume Manager 1.0.8-2
>Heinz Mauelshagen, Red Hat  26/05/2004 (IOP 10)
>
>/sbin/sh-2.05b# pvscan
>pvscan -- reading all physical volumes (this may take a while...)
>pvscan -- ACTIVE    PV  "/dev/cciss/c1d0p1" of VG "Volume0" [99.99 GB / 99.99 GB Free]
>pvscan -- ACTIVE    PV  "/dev/cciss/c0d0p2" of VG "Volume0" [136.61 GB / 68.89 GB Free]
>pvscan -- total: 2 [236.62 GB] / in use: 2 [236.62 GB] / in  no VG: 0 [0]
>
>/sbin/sh-2.05b# pvmove /dev/cciss/c1d0p1
>pvmove -- moving physical extents in active volume group "Volume0"
>pvmove -- WARNING: if you lose power during the move you may need to restore your LVM metadata from backup!
>pvmove -- do you want to continue? [y/n] y
>/dev/Volume0/group::/dev/Volume0/root: 6901 8704, 6802 8832
>pvmove -- ERROR "Invalid argument" copying extent from "/dev/cciss/c1d0p1"
>pvmove -- ERROR "Invalid argument" remapping
>pvmove -- ERROR "pv_move(): LE of LV remap" moving physical extents
>
I've tried a --force but that didn't help.

Any ideas? Need to get this drive out of the VG asap.

Regards,
Tom

-- 
Tom Lanyon
Systems Administrator
NetSpot Pty Ltd
183 Melbourne Street, North Adelaide, 5006
Ph: +618 8361 6800   Fax: +618 8361 6811
Email: tom@netspot.com.au
