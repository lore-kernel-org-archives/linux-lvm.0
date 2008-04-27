Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3RJmjuj002482
	for <linux-lvm@redhat.com>; Sun, 27 Apr 2008 15:48:45 -0400
Received: from smtp04.atlngahp.sys.nuvox.net (smtp-out4.atlngahp.sys.nuvox.net
	[70.43.63.22])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3RJmXfW028978
	for <linux-lvm@redhat.com>; Sun, 27 Apr 2008 15:48:34 -0400
Received: from smtp.media-brokers.com (70.43.81.99.nw.nuvox.net [70.43.81.99])
	by smtp04.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m3RJmTD5026509
	for <linux-lvm@redhat.com>; Sun, 27 Apr 2008 15:48:29 -0400
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id D222549ED
	for <linux-lvm@redhat.com>; Sun, 27 Apr 2008 15:48:28 -0400 (EDT)
Message-ID: <4814D88C.3050304@Media-Brokers.com>
Date: Sun, 27 Apr 2008 15:48:28 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Offline fsck (checking snapshots)
References: <48110C2D.5020800@kadzban.is-a-geek.net>	<4813D644.7080003@Media-Brokers.com>
	<4813E225.7040900@kadzban.is-a-geek.net>
In-Reply-To: <4813E225.7040900@kadzban.is-a-geek.net>
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

On 4/26/2008, Bryan Kadzban (bryan@kadzban.is-a-geek.net) wrote:
>>> I've gotten a script that I think is reasonable, that handles 
>>> this. With some help from others, it now works with XFS as well
>>> as ext2/3, and it's supposed to also work with JFS. Since it
>>> requires LVM, I think it might make sense to put something like
>>> it into the LVM userspace tools.

>> Sounds interesting... but any particular reason you're ignoring
>> reiserfs?

> No particular reason, no. I just haven't used it in maybe 6 years, so
> I don't remember much about it. I also assume that nobody listening
> to the discussion on ext3-users uses it either (based on the fact
> that nobody else asked for it). So it didn't get added. :-)

Heh - no worries, I wasn't complaining, just asking... I do use it for 
my /var (maildirs), which is why I was asking...

I know, I've heard all of the horror stories... but my RAID card has a 
BBU on it, and my servers all have good UPS's on them , and are running 
nut sp will safely shut down in the event of a prolonged power failure 
(which has only happened once).

Mine has been rock-solid for almost 4 years now.

> I assume fsck.reiserfs is the right executable to use? (I seem to 
> remember a reiserfsck, but not whether they were equivalent...) What 
> args should be used to get it to check the snapshot FS, preferably 
> making as few changes as possible? (E.g., ext3 requires a pre-check 
> check to clean up orphan inodes, otherwise the real check will exit 
> with a failure status; does reiserfs require anything similar?)

Ouch... I wish I could help, I'd be happy to, but I'm just a lowly sys 
admin pretender, not a programmer... ;)

Right now, I'm just trying to find the time to get an automated backup 
script running to pause some services (postfix+dovecot), take a snapshot 
of my /var, restart the services, run rsnapshot on the snapshot volume, 
then release the snapshot volume...

Right now I'm running my backups on the live filesystem, which, since 
this system isn't used all that heavily, especially at night, isn't 
doesn't worry me *too* much, I'd still prefer to 'do it right'... hence 
my interest in your script...

-- 

Best regards,

Charles
