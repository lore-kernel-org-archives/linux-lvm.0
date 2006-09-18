Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8IJYuUD006668
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 15:34:56 -0400
Received: from nibiru.epicideas.net (nibiru.mogmail.net [213.208.82.181] (may
	be forged))
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8IJYn4i004177
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 15:34:50 -0400
Received: from [192.168.0.2] (unknown [192.168.0.2])
	by nibiru.epicideas.net (Postfix) with ESMTP id 58953680C7
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 20:34:38 +0100 (BST)
Subject: Re: [linux-lvm] HDD Failure
From: Nick <lists@mogmail.net>
In-Reply-To: <1158607438.19905.30.camel@bounty.rider.geekspirit.net>
References: <1158603016.7182.12.camel@localhost.localdomain>
	<450EEEA0.7020703@mdmiller.com>
	<1158606792.7182.15.camel@localhost.localdomain>
	<1158607438.19905.30.camel@bounty.rider.geekspirit.net>
Date: Mon, 18 Sep 2006 20:34:37 +0100
Message-Id: <1158608077.7182.18.camel@localhost.localdomain>
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

Hi Fabien,

Yes, just one LV - "Vol1-share". 

Does this mean I've lost *everything*? I would have though I should be
still be able to access everything on the two working disks? 

I don't have a backup of this data.

Thanks, Nick

root@nibiru:~# pvdisplay
  --- Physical volume ---
  PV Name               /dev/hda4
  VG Name               Vol1
  PV Size               106.79 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              27339
  Free PE               27339
  Allocated PE          0
  PV UUID               Cq9xKF-W33m-BCLt-YyIc-EEfm-Btqc-eZLHNh

  --- Physical volume ---
  PV Name               /dev/hdb1
  VG Name               Vol1
  PV Size               111.75 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              28609
  Free PE               28609
  Allocated PE          0
  PV UUID               hwQrhH-iXHO-Bots-6zUQ-w8JG-Nmb3-shqZiX

root@nibiru:~# vgdisplay
  --- Volume group ---
  VG Name               Vol1
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  3
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               218.55 GB
  PE Size               4.00 MB
  Total PE              55948
  Alloc PE / Size       0 / 0
  Free  PE / Size       55948 / 218.55 GB
  VG UUID               RORj4f-LAOJ-83YS-34lD-4YRM-FKP8-8hgXLg


On Mon, 2006-09-18 at 21:23 +0200, Fabien Jakimowicz wrote:
> did you have only one lv in your vg ?
> 
> if yes, you can go to your backups.
> 
> what does pvdisplay and vgdisplay says ?
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
