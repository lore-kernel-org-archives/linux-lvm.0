Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2GD3o100305
	for <linux-lvm@redhat.com>; Thu, 16 Mar 2006 08:03:50 -0500
Received: from perdition2.onetel.net.uk (perdition2.onetel.net.uk
	[212.67.120.105])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k2GD3cg8032393
	for <linux-lvm@redhat.com>; Thu, 16 Mar 2006 08:03:43 -0500
Date: Thu, 16 Mar 2006 09:02:50 +0000
From: Gunther Clasen <gunther_clasen@arcor.de>
Subject: Re: [linux-lvm] online resize
Message-ID: <20060316090250.GA9800@tui.site>
References: <200603151527.30115.problems@gmx.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200603151527.30115.problems@gmx.net>
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

On Wed, Mar 15, 2006, Michael Schulz wrote:

> can please anybody tell me where I can found 
> an aktual informaiton about LVM2 and the filesystems
> which are currently support online resizing?

I use reiserfs for quite a number of years now and it seems to work
fine. You can resize the volume when it is mounted, although I prefer
unmounting it first if that is possible. It also shrinks, I believe even
online, but I don't do shrinking very often. (I have done, but
filesystems tend to grow rather than shrink.)

mkreiserfs
resize_reiserfs

Regards,

Gunther
