Received: from [192.168.1.2] (vpn-68-4.surrey.redhat.com [10.32.68.4])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5L8b3iw011276
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 09:37:04 +0100
Message-ID: <4499052F.5080106@redhat.com>
Date: Wed, 21 Jun 2006 09:37:03 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgchange doesn't activate the  logical volume
References: <004001c69509$fa226440$713a14ac@iai.co.il>
In-Reply-To: <004001c69509$fa226440$713a14ac@iai.co.il>
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

Daniel Loney wrote:
> After doing random
>    vgchange -an /dev/vg02
>    vgscan
>    vgchange -ay /dev/vg02
>  
> vgchange no longer sets the volume to available.  The volume remains in
> a *NOT available* state.
>  
> I am using
> lvm2-2.01.14-3.6
>  
> Here is the output of the vgchange and vgdisplay commands:
>  
> suse01:~ # vgchange -vay /dev/vg02
>     Using volume group(s) on command line
>     Finding volume group "vg02"
>   /dev/sda: read failed after 0 of 4096 at 0: Input/output error


I think you need to investigate why LVM can't read /dev/sda - assuming that's
supposed to be one of your disks.

>     Activated logical volumes in volume group "vg02"
>   0 logical volume(s) in volume group "vg02" now active
>  
> suse01:~ # vgdisplay -v vg02| more
>     Using volume group(s) on command line
>     Finding volume group "vg02"
>   /dev/sda: read failed after 0 of 4096 at 0: Input/output error


-- 

patrick
