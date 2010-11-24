Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAON8CRT014012
	for <linux-lvm@redhat.com>; Wed, 24 Nov 2010 18:08:12 -0500
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAON845n031286
	for <linux-lvm@redhat.com>; Wed, 24 Nov 2010 18:08:04 -0500
Received: from r74-192-2-154.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.2.154] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1PLORV-0004Zy-JK
	for linux-lvm@redhat.com; Wed, 24 Nov 2010 15:08:01 -0800
Date: Wed, 24 Nov 2010 17:07:57 -0600
From: Ray Morris <support@bettercgi.com>
References: <icjsgr$tm$1@taco.int.tagonline.com>
In-Reply-To: <icjsgr$tm$1@taco.int.tagonline.com> (from
	ag2827189@tagmall.com on Wed Nov 24 14:28:11 2010)
Message-Id: <1290640077.1076.21@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Solving the "metadata too large for circular
 buffer" condition
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

   Taking another look, my estimate of required metadatasize
might be off by a factor of five or so.  128K might be sufficient
for 100 LVs, depending on fragmentation and such.

   Still, the history of computer science is largely a story
of problems caused by people thinking they'd allocated plenty
of space.  Today you can't fdisk a drive or array larger than
2TB because someone thought 32 bits would plenty.  Probably
best to allocate 100 times as much as you think you'll ever
need - a few MB of disk space is cheap.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 11/24/2010 02:28:11 PM, Andrew Gideon wrote:
> 
> We've just hit this error, and it is blocking any expansion of  
> existing
> or creation of new volumes.
> 
> We found:
> 
> http://readlist.com/lists/redhat.com/linux-lvm/0/2839.html
> 
> which appears to describe a solution.  I'm doing some reading, and  
> I've
> set up a test environment to try things out (before doing anything  
> risky
> to production).  But I'm hoping a post here can save some time (and
> angst).
> 
> First: The referenced thread is two years old.  I don't suppose  
> there's a
> better way to solve this problem today?
> 
> Assuming not...
> 
> I'm not sure how metadata is stored.  It seems like, by default, it is
> duplicated on each PV.  I'm guessing this because one can't just add  
> new
> PVs (with larger metadatasize values), but one must also remove the  
> old
> metadata.  Is that right?
> 
> Are there are consequences to removing the metadata from most of the
> physical volumes?  I've six, so I'd be adding a seventh and eighth  
> (two
> for redundancy, though the PVs are all built on RAID sets).
> 
> The "pvcreate --restorefile ... --uuid ... --metadatacopies 0" command
> would be executed on the existing 6 physical volumes?  No data would  
> be
> lost?  I want to be *very* sure of this (so I'm not trashing an  
> existing
> PV).
> 
> What is the default metadatasize?  Judging from lvm.conf, it may be  
> 255.
> 255 Megabytes?  Is there some way to guestimate how much space I  
> should
> expect to be using?  I thought perhaps pvdata would help, but this is
> apparently LVMv1 only.
> 
> [Unfortunately, 'lvm dumpconfig' isn't listing any data in the  
> metadata
> block.]
> 
> There's also mention in the cited thread of reducing fragmentation  
> using
> pvmove.  How would that work?  From what I can see, pvmove will move
> segments.  But even if two segments are moved from dislocated  
> locations
> to immediately adjacent locations, I see nothing which says that these
> two segments would be combined into a single segment.  So I'm not  
> clear
> how fragmentation can be reduced.
> 
> Finally, there was mention of changing lvm.conf - presumably,
> metadata.dirs - to help make more space.  Once lvm.conf is changed,  
> how
> is that change made live?  Is a complete reboot required, or is there  
> a
> quicker way?
> 
> Thanks for any and all help...
> 
> 	Andrew
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
