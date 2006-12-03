Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kB3LAIPF012805
	for <linux-lvm@redhat.com>; Sun, 3 Dec 2006 16:10:18 -0500
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kB3LAGRC013958
	for <linux-lvm@redhat.com>; Sun, 3 Dec 2006 16:10:16 -0500
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] phisical resize
Date: Sun, 3 Dec 2006 15:10:05 -0600
References: <1164762747.11838.4.camel@zago.boston.ximian.com>
In-Reply-To: <1164762747.11838.4.camel@zago.boston.ximian.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200612031510.05741.krakrjak@volumehost.net>
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
To: linux-lvm@redhat.com
Cc: Federico Lucifredi <flucifredi@acm.org>

On Tuesday 28 November 2006 19:12, Federico Lucifredi wrote:
> Hello All,
>  I have installed an fc4 box with LVM2 and softraid. Very nice, but I
> also noticed that physical extent resizing is marked as not implemented
> yet (pvresize). Now, I just looked at  the man pages in the repository,
> and there is a page for pvresize (yay!). When was this implemented
> (released version?) and, if you happen to know, did it make it into
> fc6 ?
It's been in for a while now.  Since version 2.02.00 released November 10, 
2005.

-- 
Zac Slade
krakrjak@volumehost.net
ICQ:1415282 YM:krakrjak AIM:ttyp99
