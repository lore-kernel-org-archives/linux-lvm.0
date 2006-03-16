Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2GISe103392
	for <linux-lvm@redhat.com>; Thu, 16 Mar 2006 13:28:40 -0500
Received: from mail.davidb.org (mail.davidb.org [66.93.32.219])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2GISWg8020547
	for <linux-lvm@redhat.com>; Thu, 16 Mar 2006 13:28:32 -0500
Received: from davidb by mail.davidb.org with local (Exim 4.54 #1 (Debian))
	id 1FJxD5-0004ol-IL
	for <linux-lvm@redhat.com>; Thu, 16 Mar 2006 10:28:31 -0800
Date: Thu, 16 Mar 2006 10:28:31 -0800
From: David Brown <lvm@davidb.org>
Subject: Re: [linux-lvm] online resize
Message-ID: <20060316182831.GA18032@old.davidb.org>
References: <20060316130827.5D17912ED4@bluewhale.planbit.co.uk>
	<Pine.LNX.4.63.0603161210200.30335@tungsten.msp.technicality.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.63.0603161210200.30335@tungsten.msp.technicality.org>
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

On Thu, Mar 16, 2006 at 12:12:34PM -0600, Nate Carlson wrote:
> On Thu, 16 Mar 2006, Roger Lucas wrote:
> >We use Reiser3 here and it can grow a volume whilst it is mounted, but 
> >you have to unmount the volume before you can shrink it.
> >
> >The man pages for resize_reiserfs indicate that it should be used on 
> >unmounted volumes...
> >
> >AFAIK, Reiser is the only filesystem in common use that allows volumes 
> >to be reduced.
> 
> Note that Reiser4 no longer supports this.  :(

According to the wikipedia page on Reiser4
<http://en.wikipedia.org/wiki/Reiser4>, Namesys will add this if someone
pays them to.

ext2/3 has supported resizing for quite some time.

Dave Brown
