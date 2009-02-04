Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n149lOBN009341
	for <linux-lvm@redhat.com>; Wed, 4 Feb 2009 04:47:24 -0500
Received: from eu1sys200aog118.obsmtp.com (eu1sys200aog118.obsmtp.com
	[207.126.144.145])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n149kpvr024258
	for <linux-lvm@redhat.com>; Wed, 4 Feb 2009 04:46:51 -0500
Received: by mail-fx0-f20.google.com with SMTP id 13so2873056fxm.21
	for <linux-lvm@redhat.com>; Wed, 04 Feb 2009 01:46:45 -0800 (PST)
Date: Wed, 4 Feb 2009 10:46:42 +0100
From: "F-D. Cami" <fcami@winsoft.fr>
Subject: Re: [linux-lvm] Problem With LVM mirroring
Message-ID: <20090204104642.41c7c3a1@winsoft.fr>
In-Reply-To: <a80c86b70902031334r26bdefe6odb0b0d6d80ab85c@mail.gmail.com>
References: <a80c86b70902031334r26bdefe6odb0b0d6d80ab85c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: prateek.donni@gmail.com

On Wed, 4 Feb 2009 03:04:46 +0530
Prateek Donni <prateek.donni@gmail.com> wrote:

> I am trying to mirror a logical Volume with only one duplicate copy.
> I have a 2 hard drives.
> I have a PV on the second hard drive and one on an USB drive. as follows:
> 
> -------------------------------------------------------------------------------------------------------------
>  --- Physical volume ---
>   PV Name               /dev/sda8
>   VG Name               Group
>   PV Size               7.81 GB / not usable 1.09 MB
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              2000
>   Free PE               2000
>   Allocated PE          0
>   PV UUID               sLSoCU-4tMO-z1fk-royV-r8ND-PcoF-c0Wza5
> 
>   --- Physical volume ---
>   PV Name               /dev/sdc
>   VG Name               Group
>   PV Size               3.77 GB / not usable 4.00 MB
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              963
>   Free PE               963
>   Allocated PE          0
>   PV UUID               IWIYlR-UuGy-kFo6-E1j1-qu1B-7KfI-beAjhF
> -----------------------------------------------------------------------------------------------------------
> 
> On top of this i have a VG also consisting of these two PVs.
> I would like to know how can i make a LV in this which is mirroed with
> only one Duplicate copy. As in an original and a copy of the original.
> 
> I have been unable to even create a LV of size 500M using this.

Hi Prateek,

Could you please post the output of vgdisplay -v ?
Thanks

--
fdc
