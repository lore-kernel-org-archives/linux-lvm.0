Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7SB7qV17930
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 07:07:52 -0400
Received: from pc18.dolda2000.com (1-1-3-7a.rny.sth.bostream.se
	[82.182.133.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7SB7fcS026414
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 07:07:46 -0400
Subject: Re: [linux-lvm] vgscan & CDROM
From: Fredrik Tolf <fredrik@dolda2000.com>
In-Reply-To: <20050828101721.GB26065@gutek>
References: <20050828101721.GB26065@gutek>
Date: Sun, 28 Aug 2005 13:07:37 +0200
Message-Id: <1125227257.2225.63.camel@pc7.dolda2000.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>, lvm@osk.ch

On Sun, 2005-08-28 at 12:17 +0200, Chris Osicki wrote:
> Hi 
> 
> I seam not to be able to convince vgscan to let my cdroms alone.
> In the file /etc/lvm/lvm.conf I have this filter:
> 
> [ "r|/dev/cdrom.*" ]

Try it without the dot:
[ "r|/dev/cdrom*" ]

The /dev/cdrom* devices don't usually contain a dot, unless you've
changed your udev rules. Judging from your output of `vgscan -v -v',
however, it seems that you haven't done so.

Hope it helps,
Fredrik Tolf
