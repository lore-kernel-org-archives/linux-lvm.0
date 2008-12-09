Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB9L4ZeG017227
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 16:04:35 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB9L3bhS028494
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 16:03:38 -0500
Date: Tue, 9 Dec 2008 16:03:36 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] shift PV from disk to raid device?
In-Reply-To: <VA.000034fb.04c01c18@news.conactive.com>
Message-ID: <Pine.LNX.4.64.0812091558080.18598@bmsred.bmsi.com>
References: <VA.000034ec.0056c987@news.conactive.com>
	<493E48DE.3070705@redhat.com>
	<Pine.LNX.4.64.0812091146560.16428@bmsred.bmsi.com>
	<VA.000034f2.04473327@news.conactive.com>
	<493EB3A0.6020306@redhat.com> <VA.000034f4.0456d5b7@news.conactive.com>
	<Pine.LNX.4.64.0812091325290.17327@bmsred.bmsi.com>
	<VA.000034f7.04a27ead@news.conactive.com>
	<1228852584.32405.37.camel@firewall.xsintricity.com>
	<VA.000034fb.04c01c18@news.conactive.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maillists@conactive.com, LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 9 Dec 2008, Kai Schaetzl wrote:

> > The solution to this problem is to create the raid device with a
> > superblock format of 1.1 or 1.2 (aka, -e 1.1 or -e 1.2).
> 
> Is this an option to mdraid? mdadm --create --help doesn't show me this 
> option. Might mdadm-2.6.4-1.el5 on 5.2 be too old? Or is this an option to 
> fdisk/sfdisk?

I don't think changing the raid superblock will help.  I generally
prefer having the superblock at the end - there are times when you
*do* want sda3/sdb3 to alias md3:

 o many versions of grub will not install on md? - you have to unmount /boot,
 break mirror, mount sd? on /boot, install grub, unmount /boot, mount md? on
 /boot again, add back mirror copy of /boot.

 o Also, when recovering a system, it is helpful to be able to mount a
 partition directly, without setting up the raid devices.  I've had customers
 remove a mirror copy and mail me the disk.  I can then mount the filesystems
 directly, while they keep operating.

The key is breaking the aliasing and copying the data to a proper md? PV.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
