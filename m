Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4EExo0A012117
	for <linux-lvm@redhat.com>; Mon, 14 May 2007 10:59:50 -0400
Received: from mail.igb.uiuc.edu (mail.igb.uiuc.edu [128.174.124.10])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l4EExk4X030570
	for <linux-lvm@redhat.com>; Mon, 14 May 2007 10:59:48 -0400
Received: from [128.174.124.103] (arthur.igb.uiuc.edu [128.174.124.103])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by mail.igb.uiuc.edu (Postfix) with ESMTP id 733C4114402C
	for <linux-lvm@redhat.com>; Mon, 14 May 2007 09:59:42 -0500 (CDT)
Subject: RE: [linux-lvm] LVM on SATA/PATA disks
From: Daniel Davidson <danield@igb.uiuc.edu>
In-Reply-To: <00a601c7959c$dc6594b0$6600a8c0@idefix>
References: <001e01c794de$7a54b210$6600a8c0@idefix>
	<Pine.LNX.4.44.0705122102150.27083-100000@bmsred.bmsi.com>
	<00a601c7959c$dc6594b0$6600a8c0@idefix>
Date: Mon, 14 May 2007 09:59:41 -0500
Message-Id: <1179154781.4632.16.camel@arthur.igb.uiuc.edu>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

For linux, I prefer anything 3ware makes for SATA or PATA.  I have not
been happy with promise boards.  The newer higher end boards are
expensive, but you can buy the older boards for significantly less.
With the 3ware boards you could even avoid having to use lvm since they
have raid included.

Dan

On Sun, 2007-05-13 at 22:25 +0200, Bertrand Renuart wrote:
> > However, even the $50 adapters are way faster than what you could get
> > 10 years ago.  I would start with a higher end $50+ adapter (you want
> > it reliable).  If you get a lot of "system" CPU time during heavy disk
> > IO, then the $300 adapter will relieve that.  For example, a super cheap
> > ATA adapter was giving us 25% system CPU on backups on a 1.8Ghz Celeron.
> > Replacing that with a more expensive (but < $100) IDE adapter reduced
> > system time to 1% or so.
> > 
> 
> What adapter would you recommend for a descent setup?
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
