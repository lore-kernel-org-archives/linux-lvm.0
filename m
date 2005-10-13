Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9DBICV21555
	for <linux-lvm@redhat.com>; Thu, 13 Oct 2005 07:18:12 -0400
Received: from lcoyle1.ucd.ie (lcoyle1.ucd.ie [193.1.134.79])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9DBIB8J027357
	for <linux-lvm@redhat.com>; Thu, 13 Oct 2005 07:18:12 -0400
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by lcoyle1.ucd.ie (8.13.4/8.13.4) with ESMTP id j9DBIZOJ023724
	for <linux-lvm@redhat.com>; Thu, 13 Oct 2005 12:18:35 +0100
Received: from localhost (localhost [[UNIX: localhost]])
	by localhost.localdomain (8.13.4/8.13.4/Submit) id j9DBIZ7G023723
	for linux-lvm@redhat.com; Thu, 13 Oct 2005 11:18:35 GMT
From: Robin Green <greenrd@greenrd.org>
Subject: Re: [linux-lvm] Linux LVM - half baked?
Date: Thu, 13 Oct 2005 11:18:34 +0000
References: <6.2.5.6.0.20051012165544.08ef32a0@nersc.gov>
In-Reply-To: <6.2.5.6.0.20051012165544.08ef32a0@nersc.gov>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200510131118.35087.greenrd@greenrd.org>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thursday 13 October 2005 01:30, Jed Donnelley wrote:
> Redhat LVM users,
>
> Since I mentioned a minor bug in Redhat/LVM (9/28 LVM(2) bug in RH ES
> 4.1 /etc/rc.d/sysinit.rc, RAID-1+0) I've done quite a number of
> additional installs using LVM.  I've now had my second system that
> got into an essentially unrecoverable state.  That's enough for me
> and LVM.  I very much like the facilities that LVM provides, but if I
> am going to lose production file systems with it - well, I will have to
> wait.
>
> Below are descriptions of the two problems I've run into.  I have run
> linux rescue from a CD for both systems.  The difficulty of course is
> that since the problem seems to be in the LVM layer, there are no
> file systems to work on (e.g. with fsck).

There should be. If the rescue CD supports LVM (like e.g. Fedora Core 4 CD 1)
then the LVM layer should at least be brought up, I would have thought. Did
you run fsck /dev/VolGroup00/LogVolxx after choosing to have the filesystems 
auto-mounted? If so, what happened when you tried that?

> In the other system (an x86 system) I had a disk failure in a software
> RAID-1 file system for the system file system (/boot /).  I replaced the
> disk and resynced it apparently successfully.  However, after
> a short time that replacement disk apparently failed (wouldn't
> spin up on boot).  I removed the second disk and restarted
> the system.  Here is how that went:
> ...
> Your System appears to have shut down uncleanly
> fsck.ext3 -a /dev/VolGroup00/LogVol02 contains a file system with
> errors, check forced
> /dev/VolGroup00/LogVol02 Inodes that were part of a corrupted orphan
> linked list found.
> /dev/VolGroup00/LogVol02 UNEXPECTED INCONSISTENCY; RUN fsck MANUALLY
> (i.e. without -a or -p options)
> [FAILED]
> *** An error occurred during the file system check.
> *** Dropping you to a shell;  The system will reboot when you leave the
> shell.
>
> Give root password for maintenance (or type Control-D to continue)
>
> ---------------------
>
> All stuff very familiar to those who've worked on corrupted file
> systems.  However, in this
> case if I type Control-D or enter the root password the system goes
> through a sequence
> like:
>
> unmounting ...
> automatic reboot
>
> and reboots.  This starts the problem all over again.

Did you file a bug about this? It's rather hard to fix bugs if people don't 
file reproducable test cases in the relevant bug database.

-- 
Robin
