From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200011072036.eA7Ka6s03317@webber.adilger.net>
Subject: Re: [linux-lvm] Re: LVM 2.2 snapshot bug
In-Reply-To: <20001107205137.A7093@inspiron.suse.de> "from Andrea Arcangeli at
 Nov 7, 2000 08:51:37 pm"
Date: Tue, 7 Nov 2000 13:36:06 -0700 (MST)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrea Arcangeli <andrea@suse.de>
Cc: "Stephen C. Tweedie" <sct@redhat.com>, Rik van Riel <riel@conectiva.com.br>, linux-lvm@msede.com, marcelo@conectiva.com.br

Andreas writes:
> The bug that hurted Rik is ext3 that is not able to deal with I/O error
> properly during recovery and if you fix that, then LVM snapshot not setting
> ro_bits will be a minor problem IMHO.

The problem is that I/O errors during journal recovery would mean a
corrupt filesystem.  The ext3 recovery code (now) does the correct thing
and aborts the journal recovery and refuses to mount the filesystem in
this case.  It is up to e2fsck to fix problems inside the journal.

It should be possible to use an ext3 LVM snapshot for backup purposes
by using the ext2 dump program (which does raw partition access), but
currently not for simply mounting the filesystem.

It may be possible to change the ext3 code to continue to mount a
filesystem without journal recovery if it is really on a R/O device.
The real problem with this is that you aren't sure that what is on the
filesystem is consistent, because it may be half in the journal - the
fsync_dev() call should mostly handle this.

It would probably be a lot better to simply change ext3 to handle the
"proper snapshot" stuff that is in ReiserFS, so that at the time of the
snapshot, the journal is flushed and the RECOVER flag is removed from
the superblock (and returned afterwards).  However, this is also a LVM
0.9 fix.

> Infact I'm not even sure if it worth to have LVM snapshot to set ro_bits
> given it will soon become a writeable snapshot (so that we can do recovery
> on it too :).

It would still be good to have a workable solution for the 0.8final code,
because it may be that LVM 0.9 will not make it into the 2.4 kernel,
and even if it does, people may still want to use existing 0.8 LVM.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
