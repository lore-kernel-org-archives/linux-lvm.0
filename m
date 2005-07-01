Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j61JkGu02287
	for <linux-lvm@redhat.com>; Fri, 1 Jul 2005 15:46:16 -0400
Received: from tauism.org (tauism.org [217.155.219.14])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id j61Jk7AI025538
	for <linux-lvm@redhat.com>; Fri, 1 Jul 2005 15:46:08 -0400
Received: from hub.home ([127.0.0.1])
	by localhost (hub [127.0.0.1]) (amavisd-new, port 10024) with SMTP
	id 00807-07 for <linux-lvm@redhat.com>;
	Fri, 1 Jul 2005 20:46:00 +0100 (BST)
From: Nick Leverton <nickl@icritical.com>
Subject: Re: [linux-lvm] Machine crashed during pvmove, now can't manage VG
Date: Fri, 1 Jul 2005 20:45:56 +0100
References: <20050701112607.GB2770@icritical.com>
In-Reply-To: <20050701112607.GB2770@icritical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200507012045.57585@leverton.icritical.com>
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

On Friday 01 July 2005 12:26, Nick Leverton wrote:
> My machine hung during a pvmove, and now I get kernel panic when
> accessing, in any formatted way, the LV with /usr on.  I've tried running
> just 'pvmove' by itself as per the pvmove man page, but it won't recover.
> The error message is:
> 	pvmove: ABORTING: Mirror percentage check failed

Colour me gobsmacked - but it's been left powered on but idle since 11am, and 
now there is no problem.  All LV's fsck'd perfectly.  Is this sort of 
recovery a feature of LVM2 ?  Or should I distrust it and reformat anyway ?

Nick
