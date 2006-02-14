Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1EJjB126753
	for <linux-lvm@redhat.com>; Tue, 14 Feb 2006 14:45:11 -0500
Received: from smtp803.mail.ukl.yahoo.com (smtp803.mail.ukl.yahoo.com
	[217.12.12.140])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id k1EJj9vu031183
	for <linux-lvm@redhat.com>; Tue, 14 Feb 2006 14:45:09 -0500
Date: Tue, 14 Feb 2006 18:55:22 +0000
From: Gunther Clasen <gunther_clasen@arcor.de>
Subject: Re: [linux-lvm] can't create a PV
Message-ID: <20060214185522.GB8977@tui.site>
References: <20060206215141.GB7492@tui.site> <20060214091946.GA8977@tui.site>
	<20060214144641.GB12169@agk.surrey.redhat.com>
	<20060206215141.GB7492@tui.site> <20060214091946.GA8977@tui.site>
	<20060214143852.GB21794@percy.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20060214144641.GB12169@agk.surrey.redhat.com>
	<20060214143852.GB21794@percy.comedia.it>
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

On Tue, Feb 14, 2006, Luca Berra wrote:

> On Tue, Feb 14, 2006 at 09:19:46AM +0000, Gunther Clasen wrote:
> >
> >Curiously, these 4 partitions had all been used in a software-RAID
> >volume. So I reckon that lvm somehow picked up the metadata of the
> >MD-device and refused to work.
> 
> this is documented in the manpage for lvm.conf
> 
> - snip -
> md_component_detection (If set to 1, LVM2 will ignore devices
> used as components of software RAID (md) devices by looking  for
> md  superblocks. This doesn't always work satisfactorily e.g. if
> a device has been  reused  without  wiping  the  md  superblocks
> first.
> - end snip -

On Tue, Feb 14, 2006, Alasdair G Kergon wrote:

> Not a good version to use.
> The md/partition detection was improved in 2.00.32.

Thank you for your help! So it is a squashed bug... ;-)

I must admit that I hadn't read man lvm.conf, although it hadn't helped:
above snip is not included in my version of it. :-(

Anyway, seems to work fine now...

Gunther

P.S.: Would have liked to use SuSE 10.0 instead of 9.2, but with support
for my modem broken, it's a non-starter :-(((
