From: Andreas Dilger <adilger@enel.ucalgary.ca>
Message-Id: <199906300435.WAA17970@webber.adilger.net>
Subject: Re: [linux-lvm] Alpha testers rqd for ext2 fs extend utility.
Date: Tue, 29 Jun 1999 22:35:37 -0600 (MDT)
In-Reply-To: <3779A456.15F5@erols.com> from "guruju@erols.com" at Jun 29, 99 10:00:06 pm
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: guruju@erols.com
Cc: Linux LVM mailing list <linux-lvm@msede.com>

You write:
> There is no limit in sun solaris 2.7, the file system can be more than 
> 2gigs. This is one of the nice features in solaris2.7

You misunderstood my posting.  For AIX 4.1.5, the hard FS limit is 64GB,
and for AIX 4.3 it is 256GB or something like that.  The 2GB limit I
mentioned is a "soft" limit which is set for a FS which starts life at
less than 2GB, otherwise the soft limit = current FS size.

Because it is so easy to grow AIX filesystems, and you do it on a
regular basis on running systems, there is a "safety" built in which you
have to override when growing a FS past this size, so you don't
accidentally grow a 160MB filesystem to 16GB instead of 1.6GB and use up
all of the space on your disks.  It is easy to grow a filesystem, but
lots of work to shrink it (ie backup, rebuild, restore).

Cheers, Andreas
-- 
Andreas Dilger  University of Calgary \ "If a man ate a pound of pasta and
                Micronet Research Group \ a pound of antipasto, would they
Dept of Electrical & Computer Engineering \  cancel out, leaving him still
http://www-mddsp.enel.ucalgary.ca/People/adilger/      hungry?" -- Dogbert
