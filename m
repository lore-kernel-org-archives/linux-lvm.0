Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6LK7hxM006077
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 16:07:43 -0400
Received: from esri3.esri.com (esrismtp2.esri.com [198.102.62.103])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6LK7T5W016214
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 16:07:30 -0400
Received: from leoray.esri.com (leoray.esri.com [10.27.102.12])
	by esri3.esri.com (8.11.7p3+Sun/8.11.7) with ESMTP id n6LK7Tc15653
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 13:07:29 -0700 (PDT)
Received: from leoray.esri.com (leoray.esri.com [127.0.0.1])
	by leoray.esri.com (8.14.3/8.14.3) with ESMTP id n6LK7T82030494
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 13:07:29 -0700
Received: (from ray5147@localhost)
	by leoray.esri.com (8.14.3/8.14.3/Submit) id n6LK7TbQ030493
	for linux-lvm@redhat.com; Tue, 21 Jul 2009 13:07:29 -0700
Date: Tue, 21 Jul 2009 13:07:29 -0700
From: Ray Van Dolson <rvandolson@esri.com>
Subject: Re: [linux-lvm] Can't mount or run fdisk on an existing logical
	volume, help!
Message-ID: <20090721200728.GA30327@esri.com>
References: <2473b43f0907211255u7c116b1er9c3483bec2472cd@mail.gmail.com>
	<20090721195830.GA30206@esri.com>
	<2473b43f0907211301m7e4092b3t8ccd496bb1371fe7@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2473b43f0907211301m7e4092b3t8ccd496bb1371fe7@mail.gmail.com>
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
To: linux-lvm@redhat.com

On Tue, Jul 21, 2009 at 01:01:39PM -0700, Adam Olsen wrote:
> imgserv:/storage/# vgchange -ay
>   device-mapper: resume ioctl failed: Invalid argument
>   Unable to resume storage-storage (254:0)
>   1 logical volume(s) in volume group "storage" now active

Hmm... can you do an fdisk on your LV now?  That error doesn't look
good though.

Are you able to run fdisk on each of the member physical volumes
successfully?

> imgserv:/storage/# pvs
>   PV         VG      Fmt  Attr PSize PFree
>   /dev/sda3  storage lvm2 a-   1.44T    0
>   /dev/sdb1  storage lvm2 a-   1.09T    0
>   /dev/sdc1  storage lvm2 a-   1.09T 4.98G
> 
> imgserv:/storage/# pvdisplay
>   --- Physical volume ---
>   PV Name               /dev/sda3
>   VG Name               storage
>   PV Size               1.44 TB / not usable 1.51 MB
>   Allocatable           yes (but full)
>   PE Size (KByte)       4096
>   Total PE              378339
>   Free PE               0
>   Allocated PE          378339
>   PV UUID               ddnHh1-BvAl-5zpd-8KFT-YnZ8-MWHp-pQAWs1
> 
>   --- Physical volume ---
>   PV Name               /dev/sdb1
>   VG Name               storage
>   PV Size               1.09 TB / not usable 3.73 MB
>   Allocatable           yes (but full)
>   PE Size (KByte)       4096
>   Total PE              285949
>   Free PE               0
>   Allocated PE          285949
>   PV UUID               Qhl3tF-JWTY-ORbb-liI9-XteR-vlY9-wtInW5
> 
>   --- Physical volume ---
>   PV Name               /dev/sdc1
>   VG Name               storage
>   PV Size               1.09 TB / not usable 3.73 MB
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              285949
>   Free PE               1275
>   Allocated PE          284674
>   PV UUID               Z6h80h-oZfP-QMPW-iZdt-dGL0-haBJ-r93Ooi

Ray
