Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4KBA2027793
	for <linux-lvm@redhat.com>; Thu, 20 May 2004 07:10:02 -0400
Date: 20 May 2004 23:9:41 +1200
From: "Tom Parker" <tom@carrott.org>
Subject: Re: [linux-lvm] Bad block detection
In-Reply-To: <40AC8A34.7090608@shoenix.net>
Message-ID: <2239.636T2050T13894433tom@carrott.org>
MIME-Version: 1.0
Content-transfer-encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@sistina.com>

Martijn Schoemaker <lvm@shoenix.net> wrote:

>My question is, how can you prevent this ? I was personally thinking about
>doing a badblock check every now and then to assure there are no lurking
>problems. It would be nice to put in some sanity scanning feature in either
>LVM or md so you can periodically scan for prone errors so you dont run
>into problems when another disk is already failing. Or should you do it
>yourself using cron or whatever ?

I had a similar problem except I didn't have a mirror and the bad block
appeared in an allocated part of the disk, so I lost a file. What follows is
what I learnt while diagnosing this problem. I certainly don't proclaim to be
an expert, and some of the information I found was contradictory, so I'm
quite willing to be corrected.

When a disc reads a block, it knows how "good" it is and when it decides
it is about to fail, it will reallocate internally, the computer will
never know this has happened. However if you don't access the "prefailure"
block before it fails completely, the drive cannot help you. It knows that the
block is bad, but it cannot recover the data, so it tells the computer, and
you see drive errors.

When you write to such a block, the drive performs the internal reallocation
rendering the bad block good again. When the drive runs out of space to
reallocate bad blocks, it's probably time to throw it away.

You can use smartctl to see how many blocks have been reallocated
(on my WD Caviar, Reallocated_Event_Count) and how many are waiting to be
reallocated (Current_Pending_Sector). If you have a pending sector and you
write to it, you should see the pending sector count go down and the
reallocated event count go up.

Smartctl also has a function to ask the drive to perform self tests. Some of
these test check the whole surface of the disk and, I hope, let it detect
prefailure sectors and reallocate them before they fail completely. I run the
tests weekly, I don't know if I should do it more or less often though.

I don't know if running bad blocks would be better or worse from an error
detection or performance point of view. I guess it would consume more disc
bandwidth.

--
Tom Parker - tom@carrott.org
           - http://www.carrott.org
