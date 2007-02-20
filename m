Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1KF5IUX012611
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 10:05:18 -0500
Received: from lion.drogon.net (lion.drogon.net [195.10.231.26])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1KF5D1J015312
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 10:05:13 -0500
Received: from lion.drogon.net (localhost [127.0.0.1])
	by lion.drogon.net (8.13.8/8.13.8) with ESMTP id l1KF57at005528
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 15:05:07 GMT
Received: from localhost (gordon@localhost)
	by lion.drogon.net (8.13.8/8.13.8/Submit) with ESMTP id l1KF57aA005516
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 15:05:07 GMT
Date: Tue, 20 Feb 2007 15:05:06 +0000 (GMT)
From: Gordon Henderson <gordon@drogon.net>
Subject: Re: [linux-lvm] LVM & snapshots
In-Reply-To: <20070220134026.GD7742@soda.linbit>
Message-ID: <Pine.LNX.4.64.0702201502430.27267@lion.drogon.net>
References: <Pine.LNX.4.64.0702201132560.27267@lion.drogon.net>
	<20070220134026.GD7742@soda.linbit>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 20 Feb 2007, Lars Ellenberg wrote:

> lvm works fine for me :-)
> but it won't work with 30 snapshots on one origin. not useful, anyways.
> it would work ok with two to three snapshots.

I wondered if that was the case - performance?

> but, just in case you want to stay with what you know,
> while optimizing it: to cut the time used for your cp -al:
> skip it. use the "--link-dest" option to rsync (I'm not sure which
> version of rsync you need, mine is 2.6.6).

My platforms are Debian sarge - rsync is 2.6.4, but they support the 
--link-dest option (which would appear to be a new one for me!)

> so I would do a lvm snapshot on the source, then
> rsync $other_rsopts_like_include_exclude_whatever \
>  -POazv '--log-format=%i %9l %n%L' \
>  --link-dest /previous/backup /snapshot/mountpoint backupserver:/target
> (or, if you prefer to pull, pull...)
> and after that throw away the snapshot on the source machine again.
>
> so not "snapshots as backups" on the backup server,
> but as a means to get a consistent fs view on the source
> for the duration of the rsync.

Right. Thanks - I'll have a look into this. I actually have 2 of these 
backup boxes, one on-site with the tape monster and one off-site, so this 
may be just what's needed for the one with the tape unit.

Cheers,

Gordon
