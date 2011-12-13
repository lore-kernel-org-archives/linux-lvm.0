Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pBDKAiNh019165
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2011 15:10:44 -0500
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pBDKAhTH009092
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2011 15:10:43 -0500
Received: from localhost (r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	[74.192.17.33])
	by www.bettercgi.com (Postfix) with ESMTPA id 31FF521B46
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2011 14:10:40 -0600 (CST)
Date: Tue, 13 Dec 2011 14:10:40 -0600
From: Ray Morris <support@bettercgi.com>
Message-ID: <20111213141040.3b090df3@bettercgi.com>
In-Reply-To: <4EE79B02.5050709@canonical.com>
References: <20111213114558.7acbf2e9@bettercgi.com>
	<4EE79B02.5050709@canonical.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] access through LVM causes D state lock up
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com


On Tue, 13 Dec 2011 13:35:46 -0500
"Peter M. Petrakis" <peter.petrakis@canonical.com> wrote:


> Do you by any chance have active LVM snapshots? If so how many and
> how long have they been provisioned for?

I forgot to mention that. There are now three snapshots, one on each of
three LVs, that have been provisioned for a few hours. These LVs aren't 
in active use, but are backups, synced daily. So basically the only 
activity is rsync once daily, bandwidth limited to be fairly slow. One 
logical volume that locked up when trying to write to it had a snapshot.

Prior to this most recent rebuild, there were a lot of snap shots - 
three on each of fifteen LVs. I replaced that VG with a fresh one 
and it seemed to work for a while. I thought the problem was likely 
related to lots of long lived snapshots, but after completely rebuilding
the VG after deleting all snapshots the problem recurred very quickly, 
before there were many snapshots and before there was a lot of IO 
to the snaps

I realize I'm somewhat abusing snapshots - they weren't designed to 
be long lived. Therefore my "torture test" usage may reveal problems 
that wouldn't happen often with very short lived snapshots. 

Another similar server has more snapshots on more LVs running the 
same rsyncs without obvious trouble.

I should also have mentioned sequential writes to one LV at a time 
don't seem to trigger the problem. I copied the whole VG one LV 
at a time with:
dd if=/dev/oldvg/lv1 of=/dev/newvg/lv1

Copying the entire LVs sequentially saw no problems. Later when I tried 
to rsync to the LVs the problem showed itself.

> >>    filter = [ "a|^/dev/md.*|", "a|^/dev/sd.*|",
> >> "a|^/dev/etherd/.*|","r|^/dev/ram.*|", "r|block|", "r/.*/" ]
> >
> Is it intentional to include sd devices? Just because the MD uses
> them doesn't mean you have to make allowances for them here.


Some /dev/sdX devices were used, but no more and I have now removed 
sd.* and etherd.


> > <     locking_dir = "/var/lock/lvm"
> > ---
> >>     locking_dir = "/dev/shm"
> 
> Why?

This was changed AFTER the problem started.
Because comment in the file says:

  # Local non-LV directory that holds file-based locks while commands
  # are in progress.  

Because /var/lock is on an LV, I tried switching it to a directory that 
will never be on an LV. That didn't seem to have any effect.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php
