Date: Thu, 24 Aug 2000 20:04:38 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM and sw RAID1
Message-ID: <20000824200438.A32379@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <20000824124613.B19952@colombina.comedia.it> <200008241747.e7OHlNd04033@webber.adilger.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200008241747.e7OHlNd04033@webber.adilger.net>; from adilger@turbolinux.com on Thu, Aug 24, 2000 at 11:47:23AM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com

On Thu, Aug 24, 2000 at 11:47:23AM -0600, Andreas Dilger wrote:
> Luca Berra write:
> > anyway i found the bug, well there is more than one preventing you to use
> > raid and LVM,
> 
> Can you send your fixes to the list?  At least then everyone else doesn't
> need to fix the same bugs.  It would be even better if Heinz made a new
> bugfix release, but I watch the list for fixes anyways...
Andreas _please_ read my emails
i said that my fix was trashed due to fs failure, i will post it to
the list as soon as i write it again.
i posted what i remembered, tomorrow i dun't have to work so i will look
into it.
i also watch for fixes, i even made a nice big patch encmpassing
everithing that went on the list, sadly it was on a reiserfs fs.

> > fixed that and pvmoved everything onto my lvm+raid5 (fixing another bug
> > in the process).  Well, i discovered that reiserfs + LVM + raid DOES NOT
> > WORK, it actually filled 95% of my files with zeroes :)
> 
> No journalling filesystem will work properly with RAID 5 - not reiserfs
> and not ext3.  You need to stick with a non-journalling filesystem, or
> use RAID1.  It may be that this is supposed to be fixed in 2.4, but I'm
> not 100% sure...
> 
I probably dinna specify but it i am running 2.4.0-test7pre5
so i can confirm reiserfs not working on raid+lvm with 2.4
AFAIR the problem with journaling and raid was due to raid's usage
of the buffer cache during recnstruction, there was no reconstrucion
happening on my system. i will also try reiserfs on raid without
lvm, i cannot try ext3 since there isn't any patch for 2.4

L.

-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.
