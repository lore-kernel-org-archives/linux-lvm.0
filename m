Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i64J0R016079
	for <linux-lvm@redhat.com>; Sun, 4 Jul 2004 15:00:27 -0400
Received: from mail.myself.gen.nz (203-79-83-162.cable.paradise.net.nz
	[203.79.83.162])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i64J0JXn025229
	for <linux-lvm@redhat.com>; Sun, 4 Jul 2004 15:00:20 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.myself.gen.nz (Postfix) with ESMTP id 03C0D403E1
	for <linux-lvm@redhat.com>; Mon,  5 Jul 2004 07:02:46 +1200 (NZST)
Received: from mail.myself.gen.nz ([127.0.0.1])
	by localhost (guardian.cyber.god [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id 04097-03 for <linux-lvm@redhat.com>;
	Mon,  5 Jul 2004 07:02:44 +1200 (NZST)
Received: from fosi (fosi.cyber.god [192.168.1.2])
	by mail.myself.gen.nz (Postfix) with ESMTP id 2F53E403E0
	for <linux-lvm@redhat.com>; Mon,  5 Jul 2004 07:02:44 +1200 (NZST)
From: "Steve Wray" <steve.wray@paradise.net.nz>
Subject: RE: [linux-lvm] pvmove - Can't expand LV:
	Mirrorsupportmissingfromkernel?
Date: Mon, 5 Jul 2004 07:00:19 +1200
Message-ID: <000001c461f9$26b71460$0201a8c0@fosi>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20040704113846.GA12587@agk.surrey.redhat.com>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Alasdair G Kergon wrote:

> On Sun, Jul 04, 2004 at 12:49:06PM +1200, Steve Wray wrote:
> > but pvmove -tv /dev/hdf4 still fails with;
> >   ABORTING: Temporary mirror activation failed.
> 
> That's test mode for you: it's continuing further into
> the pvmove than is possible when all writes are turned off
> (which is what test mode does) - it needs fixing to bail
> out sooner cleanly.

So you are saying that its not really bad and I should run it without test 
mode and it will be ok?

 
> > # lvm version
> >   LVM version:     2.00.08 (2003-11-14)
> >   Library version: 1.00.07-ioctl (2003-11-21)
> 
> You really should update both of those.
> Look at the current WHAT_NEW file to see how many fixed bugs 
> you're running with!

Will do, thanks
