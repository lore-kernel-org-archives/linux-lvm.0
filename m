Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2GD8i101679
	for <linux-lvm@redhat.com>; Thu, 16 Mar 2006 08:08:44 -0500
Received: from bluewhale.planbit.co.uk (82-71-36-240.dsl.in-addr.zen.co.uk
	[82.71.36.240])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2GD8XwQ001175
	for <linux-lvm@redhat.com>; Thu, 16 Mar 2006 08:08:35 -0500
Received: from wolverine (unknown [192.168.0.5])
	by bluewhale.planbit.co.uk (Postfix) with ESMTP id 5D17912ED4
	for <linux-lvm@redhat.com>; Thu, 16 Mar 2006 13:08:27 +0000 (GMT)
From: "Roger Lucas" <roger@planbit.co.uk>
Subject: RE: [linux-lvm] online resize
Date: Thu, 16 Mar 2006 13:08:33 -0000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20060316090250.GA9800@tui.site>
Message-Id: <20060316130827.5D17912ED4@bluewhale.planbit.co.uk>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

We use Reiser3 here and it can grow a volume whilst it is mounted, but you
have to unmount the volume before you can shrink it.

The man pages for resize_reiserfs indicate that it should be used on
unmounted volumes...

AFAIK, Reiser is the only filesystem in common use that allows volumes to be
reduced.

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of Gunther Clasen
> Sent: 16 March 2006 09:03
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] online resize
> 
> On Wed, Mar 15, 2006, Michael Schulz wrote:
> 
> > can please anybody tell me where I can found
> > an aktual informaiton about LVM2 and the filesystems
> > which are currently support online resizing?
> 
> I use reiserfs for quite a number of years now and it seems to work
> fine. You can resize the volume when it is mounted, although I prefer
> unmounting it first if that is possible. It also shrinks, I believe even
> online, but I don't do shrinking very often. (I have done, but
> filesystems tend to grow rather than shrink.)
> 
> mkreiserfs
> resize_reiserfs
> 
> Regards,
> 
> Gunther
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
