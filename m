Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2MLMdj01427
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2004 16:22:39 -0500
Received: from ms-smtp-02-eri0.texas.rr.com (ms-smtp-02.texas.rr.com
	[24.93.47.41])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2MLMcWA013928
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2004 16:22:38 -0500
Received: from tor.tx.mcbf.net (cs68203215-240.rgv.rr.com [68.203.215.240])
	by ms-smtp-02-eri0.texas.rr.com (8.12.10/8.12.7) with ESMTP id
	i2MLMZHv026315
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2004 15:22:36 -0600 (CST)
Received: from adler.tx.mcbf.net ([10.10.10.11])
	by tor.tx.mcbf.net with esmtp (Exim 4.30) id 1B5X0V-0006sZ-Fv
	for linux-lvm@redhat.com; Mon, 22 Mar 2004 15:30:51 -0600
Subject: Re: [linux-lvm] How do I pvresize?
From: David Mohr <damailings@mcbf.net>
In-Reply-To: <405E029E.6070405@gbrmpa.gov.au>
References: <405E029E.6070405@gbrmpa.gov.au>
Message-Id: <1079989821.13263.1.camel@adler>
Mime-Version: 1.0
Date: Mon, 22 Mar 2004 15:10:21 -0600
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

I'm pretty new to LVM, so take my comment with a grain of salt.

Why do you need to resize the PV at all? If you need more space, create
a new PV and add it to the LV, that should do the trick.

~David

On Sun, 2004-03-21 at 15:01, Glen Harris wrote:
> We started running out of space on our backup server, so I bought a
> couple of new 250Gb disks, added them to the 16 bay FC RAID array
> and expanded the RAID, followed by the slice.
> 
> I then went to expand the PV, and got a "Command not implemented yet."
> message.
> 
> This is a problem. This is a *BIG* problem.
> 
> What are my options, short of destroying the volume and starting
> from scratch?
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
