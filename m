Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6UHtDIT002839
	for <linux-lvm@redhat.com>; Fri, 30 Jul 2010 13:55:13 -0400
Received: from smtp-vbr11.xs4all.nl (smtp-vbr11.xs4all.nl [194.109.24.31])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6UHt1lD030793
	for <linux-lvm@redhat.com>; Fri, 30 Jul 2010 13:55:02 -0400
Received: from [10.0.0.1] (oscardijkhoff.nl [83.163.62.3])
	by smtp-vbr11.xs4all.nl (8.13.8/8.13.8) with ESMTP id o6UHt0aa028263
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 30 Jul 2010 19:55:01 +0200 (CEST)
	(envelope-from admin@oscardijkhoff.nl)
From: Oscar Dijkhoff <admin@oscardijkhoff.nl>
In-Reply-To: <Pine.LNX.4.64.1007301115350.15016@bmsred.bmsi.com>
References: <20100730034644.GA18951@bdmcc-us.com>
	<Pine.LNX.4.64.1007301115350.15016@bmsred.bmsi.com>
Date: Fri, 30 Jul 2010 19:54:59 +0200
Message-ID: <1280512499.3913.47.camel@flinter.oscardijkhoff.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On vr, 2010-07-30 at 11:26 -0400, Stuart D. Gathman wrote:
> On Thu, 29 Jul 2010, Brian McCullough wrote:
> 
> > I guess I didn't understand the implications of switching to Grub 2, because
> > I let Ubuntu 10.04 do so when I was trying to dual boot a Grub 1 machine that
> > I had.  Once it was finished, I could not find the old system at all, and the
> > menu.lst ( or grub.conf or whatever ) in /boot/grub seems to have no effect
> > on anything.  At least changes that I make seem to do nothing.
> > 
> > Certainly I can mount the LVs that comprised the old system, so I know that
> > the install did not overwrite the LVs that I did not tell it to use, but I
> > can not seem to boot the old system.
> 
> Ubuntu installed a new grub, with config files in a new location, probably
> in the Ubuntu root filesystem.  Those are the only config files (that
> instance of) grub will use.  I've not used grub 2 yet.  Unlikely, but perhaps
> they renamed the config?  Check man pages.
> 
> Possible approaches:
> 
> 1) You could mount that Ubuntu filesystem in other oses to modify its menu.lst.
> 
> 2) You could add a Chain entry to the Ubuntu grub to load the old grub1
>    in /boot/grub.  This will require reinstalling grub1 to the partition
>    boot sector instead of the master boot sector.
> 
> 3) Reinstall grub2 to a partition boot sector, reinstall grub1 to the
>    master boot sector, and add a chain entry to grub1 to boot grub2.
> 
> 4) Reinstall grub2 to reside in the /boot/grub filesystem, overwriting
>    grub1.  Mount that filesystem in Ubuntu and create symlinks as
>    necessary so that Ubuntu updates work properly.
> 
> In all cases, before playing with all that, go burn yourself a copy of
> Super Grub on CD.  Very handy when your system is unbootable...
> 
> Distro LiveCDs are also handy, but Super Grub is much faster when you
> just want to boot grub.
> 


The configuration system for GRUB 2 is completely different than what it
was in GRUB. The menu.lst file now gets created automatically based on
other config files. Look at /etc/default/grub. Search the web for GRUB 2
configuration if you need more info.
