Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p05LMvmp002957
	for <linux-lvm@redhat.com>; Wed, 5 Jan 2011 16:22:57 -0500
Received: from web39310.mail.mud.yahoo.com (web39310.mail.mud.yahoo.com
	[66.94.238.186])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id p05LMlRm022206
	for <linux-lvm@redhat.com>; Wed, 5 Jan 2011 16:22:47 -0500
Message-ID: <413157.10262.qm@web39310.mail.mud.yahoo.com>
References: <581831.19828.qm@web39308.mail.mud.yahoo.com>
	<Pine.LNX.4.64.1101051343590.3928@bmsred.bmsi.com>
Date: Wed, 5 Jan 2011 12:56:06 -0800 (PST)
From: Brian Neu <proclivity76@yahoo.com>
In-Reply-To: <Pine.LNX.4.64.1101051343590.3928@bmsred.bmsi.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] snapshot pools, lvm roadmap
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>


> These guys have snapshot pools  working as an addon product.  It mostly
> works using straight device  mapper - but they have a kernel patch that is
> needed for some deadlock  issues.
> 
> http://zumastor.org/
> 


Thanks Stewart, but the last update to their subversion repo was in Aug-2008. 
 It seems like a great solution, but I don't think I can put into production a 
possibly stale project without a significant user base.  Have you tried it?

I perform SMB consulting and when a Linux solution fits the client's needs, I 
always go with Linux.  But increasingly, I can't justify Linux file servers. 
 I've written some cron scripts that take and release lvm snapshots on a 
schedule, but compared to the Volume Shadow Copy of NTFS that Microsoft released 
in 2003, it's just cumbersome and basic.  We're approaching 8 years without a 
comparable response.  I'm just rather shocked when thinking about it.
