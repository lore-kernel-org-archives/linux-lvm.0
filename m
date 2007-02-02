Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l12GQ7XP001989
	for <linux-lvm@redhat.com>; Fri, 2 Feb 2007 11:26:08 -0500
Received: from mail4.sv.ziprealty.com (mail4.ziprealty.com [66.77.108.26])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l12GQ2St029988
	for <linux-lvm@redhat.com>; Fri, 2 Feb 2007 11:26:02 -0500
Received: from hqmail1.ziprealty.corp (netscaler-map.sv.ziprealty.com
	[10.1.3.182])
	by mail4.sv.ziprealty.com (8.12.11/8.12.11) with ESMTP id
	l12GQ0Z0011841
	for <linux-lvm@redhat.com>; Fri, 2 Feb 2007 08:26:00 -0800
Subject: Re: [linux-lvm] LVM changing bios from legacy/IDE to AHCI/Sata
From: Michael Davis <mdavis@ziprealty.com>
In-Reply-To: <45C2EB9A.81EB.0099.0@charter.net>
References: <45C2EB9A.81EB.0099.0@charter.net>
Date: Fri, 02 Feb 2007 08:25:59 -0800
Message-Id: <1170433559.18411.9.camel@beethoven.hq.office.ziprealty.com>
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

I just ran into this problem.  After trying a whole bunch of things
(including importing/exporting) that didn't work, it turns out that all
it took was adding the ahci driver to the initrd image (mkinitrd
--preload ahci).

  Michael




On Fri, 2007-02-02 at 07:43 -0800, Dwight Morgan wrote:
> HTML document attachment (Text.htm)
> I am running LVM on FC6 2.6.19 and would like to switch over from
> Legacy/IDE in the intel 965 bios to AHCI/SATA.  Of course, as soon as
> I change the bios setting fedora won't boot as it can't find any
> volumes.  I can see how to export the LVM settings, change the text
> file from hda1 to sda1, and restore it.  But I figure the odds of me
> screwing this up are good, and I don't see a good recovery method.
>  
> Any help on process/recovery?
>  
> Thanks,
> -Dwight
>  
> PS.  Same drive, nothing changing other than a bios setting.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
