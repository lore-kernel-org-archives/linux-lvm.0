Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7RG9Htw030933
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 12:09:17 -0400
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l7RG99oO029194
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 12:09:10 -0400
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id 7B4A153BD8
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 18:08:59 +0200 (CEST)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 3C5E69325
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 18:08:59 +0200 (CEST)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id odtwcaeWhKj8 for <linux-lvm@redhat.com>;
	Mon, 27 Aug 2007 18:08:55 +0200 (CEST)
Received: from [192.168.10.145] (xdsl-87-79-96-91.netcologne.de [87.79.96.91])
	by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 18:08:55 +0200 (CEST)
Message-ID: <46D2F715.9000308@wpkg.org>
Date: Mon, 27 Aug 2007 18:08:53 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] "cannot allocate memory" when trying to do a snapshot?
References: <46CEE6FF.1090000@wpkg.org>
In-Reply-To: <46CEE6FF.1090000@wpkg.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Tomasz Chmielewski schrieb:
> I have a server with ~1.5T PV, on which I have several logial volumes 
> (LVs).
> 
> I decided to do a snapshot for five of these LVs, and it succeeded, but 
> only few times.
> 
>   dom-dc1           san1 owi-ao   8.00G
>   dom-oss1          san1 owi-ao  16.00G
>   dom-sql1          san1 owi-ao   8.00G
>   dom-sql1-2        san1 owi-ao  50.00G
>   dom-ts1           san1 owi-ao  16.00G
> 
> For each of the LVs, I made 5G snapshots.
> I could make three snapshots for all of them, but the fourth snapshot 
> failed for some LVs (in all, I could only make 18 * 5GB snapshots).
> 
> Why?
> 
> I'm using Debian Etch, with its 2.6.18 64 bit kernel.
> The machine has 512 MB RAM, and 3 GB swap:

Some more info on that.
Apparently, this whole snapshotting thing is not very stable, and there 
are bugs in it.

I just played a bit more with creating snapshots.

Below, although creating a snapshot fails, a new logical volume is created:

# lvcreate -L100G -s -n backup-snapshot /dev/san1/backup
File descriptor 3 left open
File descriptor 5 left open
File descriptor 7 left open
   device-mapper: reload ioctl failed: Cannot allocate memory
   Failed to suspend origin backup


# lvs
File descriptor 3 left open
File descriptor 5 left open
File descriptor 7 left open
   LV                     VG   Attr   LSize   Origin          Snap% 
Move Log Copy%
   backup                 san1 -wi-ao 628.28G
   backup-snapshot        san1 -wi-d- 100.00G
(...)


So, if it fails, at least it shouldn't create any phantom volumes.

Does lvm snapshotting work any better with newer kernels?


-- 
Tomasz Chmielewski
http://wpkg.org
