Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6UFQcLb030646
	for <linux-lvm@redhat.com>; Fri, 30 Jul 2010 11:26:38 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6UFQSDS018766
	for <linux-lvm@redhat.com>; Fri, 30 Jul 2010 11:26:28 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o6UFQRnw017484
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 30 Jul 2010 11:26:27 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o6UFQRAF015171
	for <linux-lvm@redhat.com>; Fri, 30 Jul 2010 11:26:27 -0400
Date: Fri, 30 Jul 2010 11:26:27 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <20100730034644.GA18951@bdmcc-us.com>
Message-ID: <Pine.LNX.4.64.1007301115350.15016@bmsred.bmsi.com>
References: <20100730034644.GA18951@bdmcc-us.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Grub 1 vs 2
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 29 Jul 2010, Brian McCullough wrote:

> I guess I didn't understand the implications of switching to Grub 2, because
> I let Ubuntu 10.04 do so when I was trying to dual boot a Grub 1 machine that
> I had.  Once it was finished, I could not find the old system at all, and the
> menu.lst ( or grub.conf or whatever ) in /boot/grub seems to have no effect
> on anything.  At least changes that I make seem to do nothing.
> 
> Certainly I can mount the LVs that comprised the old system, so I know that
> the install did not overwrite the LVs that I did not tell it to use, but I
> can not seem to boot the old system.

Ubuntu installed a new grub, with config files in a new location, probably
in the Ubuntu root filesystem.  Those are the only config files (that
instance of) grub will use.  I've not used grub 2 yet.  Unlikely, but perhaps
they renamed the config?  Check man pages.

Possible approaches:

1) You could mount that Ubuntu filesystem in other oses to modify its menu.lst.

2) You could add a Chain entry to the Ubuntu grub to load the old grub1
   in /boot/grub.  This will require reinstalling grub1 to the partition
   boot sector instead of the master boot sector.

3) Reinstall grub2 to a partition boot sector, reinstall grub1 to the
   master boot sector, and add a chain entry to grub1 to boot grub2.

4) Reinstall grub2 to reside in the /boot/grub filesystem, overwriting
   grub1.  Mount that filesystem in Ubuntu and create symlinks as
   necessary so that Ubuntu updates work properly.

In all cases, before playing with all that, go burn yourself a copy of
Super Grub on CD.  Very handy when your system is unbootable...

Distro LiveCDs are also handy, but Super Grub is much faster when you
just want to boot grub.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
