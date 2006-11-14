Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAEIhF2F016167
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 13:43:15 -0500
Received: from mail6.sea5.speakeasy.net (mail6.sea5.speakeasy.net
	[69.17.117.8])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kAEIhE91025886
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 13:43:14 -0500
Received: from shell3.sea5.speakeasy.net ([69.17.116.4])
	(envelope-sender <jerith@speakeasy.org>)
	by mail6.sea5.speakeasy.net (qmail-ldap-1.03) with AES256-SHA encrypted
	SMTP for <linux-lvm@redhat.com>; 14 Nov 2006 18:43:08 -0000
Date: Tue, 14 Nov 2006 13:43:07 -0500 (EST)
From: Matt McHenry <jerith@speakeasy.org>
Subject: Re: [linux-lvm] lvcreate gives 'device-mapper: reload ioctl failed:
	Invalid argument'
In-Reply-To: <20061114183159.GI30653@agk.surrey.redhat.com>
Message-ID: <Pine.LNX.4.58.0611141334290.18875@shell3.speakeasy.net>
References: <Pine.LNX.4.64.0610281720370.9047@localhost>
	<20061114183159.GI30653@agk.surrey.redhat.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Tue, 14 Nov 2006, Alasdair G Kergon wrote:

> On Sat, Oct 28, 2006 at 05:26:55PM -0400, Matt McHenry wrote:
> > thought that maybe one of my pvs was bad, so I tried to add a new pv
> > (sda12) and migrate off of the most-recently-added one (sda11), but the
>
> Could you have created the new one by subtracting space from the old one?
> You need to undo that change to the partition table.

	It's possible that I may have screwed up and thought that sda11
wasn't yet under LVM, deleted it, and then created a new sda11 and sda12
in its place (each taking half the space originally occupied by sda11).
But it was a while ago so unfortunately I don't remember for sure.

	So how can I repair this? I see two options:

1) remove the unused sda12 pv; remove the sda12 partition; delete and
re-create the sda11 partition to take up the space formerly occupied by
the sda12 partition

2) use pvmove to move all data off of the sda11 pv; remove the sda11 pv;
create a new pv on the sda11 partition, which should pick up the correct
size

	(2) seems better to me, except that I already tried the pvmove and
it and was getting the same 'reload ioctl' errors.  For (1), it seems like
there's more risk of data loss, and I'd need some way to figure out
exactly how big to make the new sda11 partition.  What do you think?  Is
there a third option I'm not seeing?

----------------------
Matt McHenry
http://www.speakeasy.org/~jerith/
jerith@speakeasy.org
be052@scn.org
