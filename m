Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m29NbjFt010230
	for <linux-lvm@redhat.com>; Sun, 9 Mar 2008 19:37:45 -0400
Received: from mail.linbit.com (aug.linbit.com [212.69.162.22])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m29NbBod002819
	for <linux-lvm@redhat.com>; Sun, 9 Mar 2008 19:37:11 -0400
Received: from racke.linbit (office.linbit [86.59.100.100])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.linbit.com (LINBIT Mail Daemon) with ESMTP id 88AE12E0373C
	for <linux-lvm@redhat.com>; Mon, 10 Mar 2008 00:37:10 +0100 (CET)
Date: Mon, 10 Mar 2008 00:37:24 +0100
From: Lars Ellenberg <linux-lvm@linbit.com>
Subject: Re: [linux-lvm] Snapshot of a Snapshot
Message-ID: <20080309233724.GB6688@racke.local>
References: <A374F37068535C46BFCF8D48CF29AA7FA60102@zen.zetex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <A374F37068535C46BFCF8D48CF29AA7FA60102@zen.zetex.com>
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
To: linux-lvm@redhat.com

On Mon, Mar 03, 2008 at 09:13:05AM -0000, Karl Wagner wrote:
> Not quite, although this would also be nice. Maybe I should explain my
> current setup better.
> 
> Firstly, I have a Xen DomU machine running several Dom0's. As each Dom0
> is very similar, I started off with a Base install, then created
> snapshots to modify to create each Dom0. This had the advantage of
> allowing me to set up a new Dom0 very easily, while taking less physical
> disk space (and also the side effect that it runs quicker, think that's
> something to do with the block device cache being used for the origin,
> but I'm no expert so it may not...)
> 
> What I would like to be able to do is:
> (a) be able to take a snapshot of one of these snapshots in order to
> make backups, or have a bookmark in time if I am doing something I am
> not sure of (in this instance a 'revert to snapshot' would be nice too)
> (b) if I need to restore a backup, it would be nice to just be able to
> dd the image I took as backup onto the snapshot device, without it
> copying on every write, only copying the sectors (or chunks, whatever
> the allocation unit for the snapshot COW device is) which are different.
> 
> These would also be useful for the SAN I am putting together.
> 
> Both of these I can do manually, the first by creating a snapshot using
> device-mapper, the second by comparing the sector between the current
> and the backup before writing. Snapshot of a snapshot done this way is
> very useful but a pain to set up, although I have written a script to do
> this for me.

just make sure you never ever write to the origin accidentally
while having a snapshot of a snapshot of it.
if it was for an area that needed COW,
it would deadlock kcopyd. hard.
because kcopyd would recurse into itself from the
completion callbacks it was told to call back. :(

> Restoration of a snapshot this way is painfully slow
> (although if functionality of this sort either is not going to be
> implemented or will take a long time I will recode it in C to
> (hopefully) speed things up, currently I am using a hack together of
> bash and perl scripts, just to get it done quickly).

see my other post in that other thread
 "Restore LVM snapshot without creating a full dump"
maybe that script is of some use for you, too?

-- 
: Lars Ellenberg                            Tel +43-1-8178292-55 :
: LINBIT Information Technologies GmbH      Fax +43-1-8178292-82 :
: Vivenotgasse 48, A-1120 Vienna/Europe    http://www.linbit.com :
