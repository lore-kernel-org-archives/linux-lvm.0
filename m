Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1KDeY4X002445
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 08:40:34 -0500
Received: from mail.linbit.com (nudl.linbit.com [212.69.162.21])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1KDeVwC021775
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 08:40:32 -0500
Received: from soda (unknown [86.59.100.100])
	by mail.linbit.com (LINBIT Mail Daemon) with ESMTP id 7F6D32E07872
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 14:40:25 +0100 (CET)
Date: Tue, 20 Feb 2007 14:40:26 +0100
From: Lars Ellenberg <linux-lvm@linbit.com>
Subject: Re: [linux-lvm] LVM & snapshots
Message-ID: <20070220134026.GD7742@soda.linbit>
References: <Pine.LNX.4.64.0702201132560.27267@lion.drogon.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0702201132560.27267@lion.drogon.net>
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

/ 2007-02-20 12:58:11 +0000
\ Gordon Henderson:
> 
> I tried LVM a few years back and "burnt my fingers" as it were - I found it slow and unstable, but times are 
> changing, progress being made, etc. so does anyone have any input on it's current stability and usability?
> 
> Basically, I'm running out of steam on some backup servers I have - trying to copy several TB of data using cp -al, 
> then rsyncing on top of it (and then copying the copy, etc. to give me 30 days of backups) has been working well 
> for some time, but the data-set is increasing all the time, and the cp -al is currently taking 4-5 hours, so 
> snapshotting via LVM is looking like it's something I think I ought to be looking into again.

lvm works fine for me :-)
but it won't work with 30 snapshots on one origin. not useful, anyways.
it would work ok with two to three snapshots.

but, just in case you want to stay with what you know,
while optimizing it: to cut the time used for your cp -al:
skip it. use the "--link-dest" option to rsync (I'm not sure which
version of rsync you need, mine is 2.6.6).

so I would do a lvm snapshot on the source, then
rsync $other_rsopts_like_include_exclude_whatever \
  -POazv '--log-format=%i %9l %n%L' \
  --link-dest /previous/backup /snapshot/mountpoint backupserver:/target
(or, if you prefer to pull, pull...)
and after that throw away the snapshot on the source machine again.

so not "snapshots as backups" on the backup server,
but as a means to get a consistent fs view on the source
for the duration of the rsync.

> The current data-set is 5TB, and having 150TB of storage isn't an
> option right now... Essentially I need to be able to keep 30 cycles
> (days) of snapshots on a server that is not a live server (ie. it's a
> huge disk array, in a secure bunker backing up several remote servers
> every day, and dumping the occasional snapshot to tape for archive.
> Data comes into the server via a 100Mb line & rsync from the remote
> servers).

-- 
: Lars Ellenberg                            Tel +43-1-8178292-55 :
: LINBIT Information Technologies GmbH      Fax +43-1-8178292-82 :
: Vivenotgasse 48, A-1120 Vienna/Europe    http://www.linbit.com :
