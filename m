Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8IJbmQ9007941
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 15:37:48 -0400
Received: from arvo.suso.org (mail.suso.org [216.9.132.134])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8IJbjfU011428
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 15:37:45 -0400
Date: Mon, 18 Sep 2006 19:37:28 +0000
From: Mark Krenz <mark@suso.org>
Subject: Re: [linux-lvm] HDD Failure
Message-ID: <20060918193728.GC28043@arvo.suso.org>
References: <1158603016.7182.12.camel@localhost.localdomain>
	<450EEEA0.7020703@mdmiller.com>
	<1158606792.7182.15.camel@localhost.localdomain>
	<1158607438.19905.30.camel@bounty.rider.geekspirit.net>
	<1158608077.7182.18.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1158608077.7182.18.camel@localhost.localdomain>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


  Nick,

  LVM != RAID

  You should have been doing RAID if you wanted to be able to handle the
failure of one drive.


On Mon, Sep 18, 2006 at 07:34:37PM GMT, Nick [lists@mogmail.net] said the following:
> Hi Fabien,
> 
> Yes, just one LV - "Vol1-share". 
> 
> Does this mean I've lost *everything*? I would have though I should be
> still be able to access everything on the two working disks? 
> 
> I don't have a backup of this data.
> 
> Thanks, Nick
> 
> root@nibiru:~# pvdisplay
>   --- Physical volume ---
>   PV Name               /dev/hda4
>   VG Name               Vol1
>   PV Size               106.79 GB / not usable 0
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              27339
>   Free PE               27339
>   Allocated PE          0
>   PV UUID               Cq9xKF-W33m-BCLt-YyIc-EEfm-Btqc-eZLHNh
> 
>   --- Physical volume ---
>   PV Name               /dev/hdb1
>   VG Name               Vol1
>   PV Size               111.75 GB / not usable 0
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              28609
>   Free PE               28609
>   Allocated PE          0
>   PV UUID               hwQrhH-iXHO-Bots-6zUQ-w8JG-Nmb3-shqZiX
> 
> root@nibiru:~# vgdisplay
>   --- Volume group ---
>   VG Name               Vol1
>   System ID
>   Format                lvm2
>   Metadata Areas        2
>   Metadata Sequence No  3
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                0
>   Open LV               0
>   Max PV                0
>   Cur PV                2
>   Act PV                2
>   VG Size               218.55 GB
>   PE Size               4.00 MB
>   Total PE              55948
>   Alloc PE / Size       0 / 0
>   Free  PE / Size       55948 / 218.55 GB
>   VG UUID               RORj4f-LAOJ-83YS-34lD-4YRM-FKP8-8hgXLg
> 
> 
> On Mon, 2006-09-18 at 21:23 +0200, Fabien Jakimowicz wrote:
> > did you have only one lv in your vg ?
> > 
> > if yes, you can go to your backups.
> > 
> > what does pvdisplay and vgdisplay says ?
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


-- 
Mark S. Krenz
IT Director
Suso Technology Services, Inc.
http://suso.org/
