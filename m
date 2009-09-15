Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8FLf5YZ013242
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2009 17:41:05 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8FLelHh014915
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2009 17:40:47 -0400
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1MnflW-0007Yb-LW
	for linux-lvm@redhat.com; Tue, 15 Sep 2009 14:40:46 -0700
Date: Tue, 15 Sep 2009 16:40:45 -0500
From: Ray Morris <support@bettercgi.com>
Subject: Re: RE: [linux-lvm] vg availability during boot
References: <4AAFD056.2030100@tonarchiv.ch>
In-Reply-To: <4AAFD056.2030100@tonarchiv.ch> (from g4-lisz@tonarchiv.ch on
	Tue Sep 15 12:35:18 2009)
Message-Id: <1253050845.6319.4@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

   I spent four days messing with this before I found 
this procedure for rebuilding initrd, which worked for me.
This howto talks specifically about switching to RAID, but
it also worked for me switching to LVM on RAID:
http://www.howtoforge.com/software-raid1-grub-boot-fedora-8
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 09/15/2009 12:35:18 PM, Till Wimmer wrote:
> > Did you rebuild initrd? During boot, initrd uses staticly linked
> modules to load what otherwise would be kernel modules. It does, if
> LVM is enabled, do a vgchange -y a as part of that process. Since LVM
> is part of the default initrd, it may be the drivers for your SAN 
> that
> you need to get in place - remember to include the high-end Ethernet
> drivers too that your NAS (I presume?) uses. 
> >
> Hi,
> 
> i have a quite similar problem with my server. But in my case, it
> occurs from time to time only.
> Before i had another issue with mounting the root partition because 
> of
> swapped SCSI IDs (sda becomes sdb, sdc, becomes sda, and so on). But 
> i
> could solve this with ext2fs labels.
> 
> I'm using Debian Lenny.
> 
> Is the vgchange -ay in initrd executed for every volume group or is
> this hard coded by update-initrd?
> 
> Could the swapping of SCSI-IDs be the reason for this issue, too?
> 
> 
> Thank you,
> TW
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
