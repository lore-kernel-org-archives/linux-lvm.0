Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4SNGkCP012316
	for <linux-lvm@redhat.com>; Fri, 28 May 2010 19:16:46 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4SNGbBG027658
	for <linux-lvm@redhat.com>; Fri, 28 May 2010 19:16:38 -0400
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1OI8n4-0003a4-Lf
	for linux-lvm@redhat.com; Fri, 28 May 2010 16:16:35 -0700
Date: Fri, 28 May 2010 18:16:33 -0500
From: Ray Morris <support@bettercgi.com>
In-Reply-To: <Pine.LNX.4.64.1005191524400.29583@bmsred.bmsi.com> (from
	stuart@bmsi.com on Wed May 19 14:34:38 2010)
Message-Id: <1275088593.18190.5@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Adding a disk to expand an existing logical volume
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

>  If you aren't familiar with lvm.conf, then using labeled partitions
> is a safer course.  (initrd uses a copy of lvm.conf to find PVs so it
> can activate the volume group of the root filesystem if necessary.)

   Perhaps my point was obscured by my other text, so I'll highlight it:

> > It makes booting an recovering much more reliable in case of
> > changes or problems.

   Agreed, if all the devices are listed in lvm.conf, mdadm.conf,
etc. and nothing changes or has any problems then whole devices
work fine.  As long as all of the configuration files list everything
and initrd knows about any changes.  It's when something's not exactly
how it was originally configured that it's really handy for raid devices
to be marked as such by using partition type "fd", LVM devices to be
marked as such by using partition type "8e", etc.  That's been my
experience.  Your experience may differ, but that's my experience
from dealing with a lot of "won't boot" situations.

   Having said that, if you use partitions it's important that
the partition types not be WRONG.  I once spent far too long
trying to figure out why my devices were undetected.  It turned
out a RAID or LVM partition was marked with the default "83".
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 05/19/2010 02:34:38 PM, Stuart D. Gathman wrote:
> On Wed, 19 May 2010, Ray Morris wrote:
> 
> >  It's also useful during the boot process.  If, for example, you
> > later add another disk, this disk might become sdd, where it used to
> > be sdc.  That can confuse initrd and friends and result in an
> > unbootable system.  On almost every machine where I've skipped
> > creating partitions for RAID or LVM, this kind of thing has come
> > back to bite me later - maybe years later.  Now, I always create
> > "Linux LVM" partitions for LVM and "Linux raid autodetect"  
> partitions
> > for RAID.  It makes booting an recovering much more reliable in
> > case of changes or problems.
> 
> PVs are identified by UUID.  It doesn't matter whether they change
> names.  And changing names from sdc1 to sdd1 is just as bad as  
> changing
> names from sdc to sdd.
> 
> However, you are correct that the default device searching rules used  
> by
> lvm might work correctly with a Linux LVM labeled partition where  
> they might
> otherwise skip a device.  If you aren't familiar with lvm.conf, then
> using labeled partitions is a safer course.  (initrd uses a copy
> of lvm.conf to find PVs so it can activate the volume group of the
> root filesystem if necessary.)
> 
> --
> 	      Stuart D. Gathman <stuart@bmsi.com>
>     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703  
> 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song  
> for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
