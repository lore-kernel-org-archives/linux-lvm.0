Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8K3MpRe026648
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2006 23:22:51 -0400
Received: from arvo.suso.org (mail.suso.org [216.9.132.134])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8K3MgbC022000
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2006 23:22:42 -0400
Date: Wed, 20 Sep 2006 03:22:23 +0000
From: Mark Krenz <mark@suso.org>
Subject: Re: [linux-lvm] Misleading documentation (was: HDD Failure)
Message-ID: <20060920032222.GF28043@arvo.suso.org>
References: <1158603016.7182.12.camel@localhost.localdomain>
	<450EEEA0.7020703@mdmiller.com>
	<1158606792.7182.15.camel@localhost.localdomain>
	<1158607438.19905.30.camel@bounty.rider.geekspirit.net>
	<1158608077.7182.18.camel@localhost.localdomain>
	<20060918193728.GC28043@arvo.suso.org>
	<4B875923-CB76-4792-837B-EDA3B9E53756@slamb.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4B875923-CB76-4792-837B-EDA3B9E53756@slamb.org>
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


  Personally I like it when documentation is kept simple and uses simple
examples.  There is nothing worse than when you are trying to learn
something and it tells you how to how to intantiate a variable, and then
it immediately goes on to show you how to make some complicated reference
to it using some code.

  I agree with you though, its probably a good idea to steer newcomers
in the right direction on disk management and a few notes about doing
LVM ontop of RAID being a good idea couldn't hurt.  This is especially
so since I've heard three mentions of people using LVM on a server
without doing RAID this week alone. :-/

  I suppose it could also be said that people who are causually doing
LVM on their systems using something like a GUI are most likely not
going to be referencing the man pages or LVM documentation until after
their system is setup, at which point it is probably too late to put the
physical volumes on a RAID array.  So I think its more the
responsibility of the GUI/ncurses installer to alert you to be using
RAID.

Mark


On Tue, Sep 19, 2006 at 10:40:43PM GMT, Scott Lamb [slamb@slamb.org] said the following:
> On Sep 18, 2006, at 12:37 PM, Mark Krenz wrote:
> >  LVM != RAID
> >
> >  You should have been doing RAID if you wanted to be able to  
> >handle the
> >failure of one drive.
> 
> This is my biggest beef with LVM - why doesn't *any* of the  
> documentation point this out? There are very few good reasons to use  
> LVM without RAID, and "ignorance" certainly isn't among them. I don't  
> see any mention of RAID or disk failures in the manual pages or in  
> the HOWTO.
> 
> For example, the recipes chapter [1] of the HOWTO shows a non-trivial  
> setup with four volume groups split across seven physical drives.  
> There's no mention of RAID. This is a ridiculously bad idea - if  
> *any* of those seven drives are lost, at least one volume group will  
> fail. In some cases, more than one. This document should be showing  
> best practices, and it's instead showing how to throw away your data.
> 
> The "lvcreate" manual page is pretty bad, too. It mentions the  
> ability to tune stripe size, which on casual read, might suggest that  
> it uses real RAID. Instead, I think this is just RAID-0.
> 
> [1] - http://tldp.org/HOWTO/LVM-HOWTO/recipeadddisk.html
> 
> -- 
> Scott Lamb <http://www.slamb.org/>
> 
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
