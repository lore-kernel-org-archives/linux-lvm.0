Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8OGsLD0022421
	for <linux-lvm@redhat.com>; Wed, 24 Sep 2008 12:54:22 -0400
Received: from smtp-3.tky.hut.fi (smtp03.tky.fi [82.130.63.73])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m8OGrUtt008517
	for <linux-lvm@redhat.com>; Wed, 24 Sep 2008 12:53:58 -0400
Received: from depili.fi ([82.130.16.250])
	by smtp-3.tky.hut.fi (SMSSMTP 4.1.9.35) with SMTP id
	M2008092419532930400
	for <linux-lvm@redhat.com>; Wed, 24 Sep 2008 19:53:29 +0300
Received: from localhost (localhost [127.0.0.1])
	by depili.fi (Postfix) with ESMTP id 75B609A03
	for <linux-lvm@redhat.com>; Wed, 24 Sep 2008 16:53:29 +0000 (UTC)
Date: Wed, 24 Sep 2008 19:53:29 +0300 (EEST)
From: Vesa-Pekka Palmu <palmu@aski.hut.fi>
Subject: Re: [linux-lvm] LVM label lost on MD RAID5 reshape?
In-Reply-To: <Pine.LNX.4.64.0809231711250.4246@gremlin.fruitbat.org>
Message-ID: <alpine.DEB.1.10.0809241950340.11522@depili.fi>
References: <20080923210233.GA32676@newbie.thebellsplace.net>
	<Pine.LNX.4.64.0809231419010.4246@gremlin.fruitbat.org>
	<1c748a490809231456q4a0d2656y48427f57a8bbcb0c@mail.gmail.com>
	<Pine.LNX.4.64.0809231711250.4246@gremlin.fruitbat.org>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 23 Sep 2008, Peter A. Castro wrote:

> > > My understanding of RAID5 is that once you configure the set of disks to
> > > the array, you can't just add an additional disk to it.  Attempting to do
> > > so does more than just "reshape" the array, it changes the logical layout
> > > of the sectors completely.  It's no wonder that LVM can't find anything,
> > > since it's data (if it survived the reorg) is no longer where it should
> > > be.  And, once you've done this, there's really no going back to recover.
> > > This is assuming my understanding of RAID5 is correct.
> >
> > I disagree, because assuming the md reshape operates intuitively, the old
> > 320 GB of data should still be visible as the first 320 GB of data on the
> > new VIRTUAL 640GB device. And LVM should know nothing about the underlying
> > RAIDing, so it should be happy to look there. However, I have no idea what
> > "bumped the values in /proc/sys/dev/raid/" means, or if it causes LVM to
> > look in the wrong places for things.
>
> I don't believe the MD/RAID5 operates in this way.  He started with a
> 2-disk RAID5 (effectively having the data logically interleaved between
> the two drives), then he added an additional disk.  The way RAID works,
> it doesn't just add the disk space to the end of the array (that would
> not create a recoverable scenario should it or one of the others fail),
> it re-integrates and effectively re-interleaves the logical sectors to
> re-spread the data across all three drives.  The trouble is, I don't
> think you can actually do this with current MD tech (I could be wrong).
>
> Perhaps a better question would be to ask how, exactly, Bob create his
> array initially (what commands) and what steps he took to add the new
> drive (again, what commands did he issue).  That would give us a better
> idea of how the array looked before and after.
>
> All of this is orthogonal to LVM, however.  I suspect a RAID/MD email
> list would be a better forum to discuss this.
>

Current linux MD-raid can reshape raid-5 arrays, the operation just takes
really long time and there is a critical section at the start, which means
if your computer crashes during the first second or two at the start all
data is pretty much lost.

The raid-5 reshape is quite new feature in md-raid and I don't know how
stable it is.
