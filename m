From: Andreas Dilger <adilger@home.com>
Message-Id: <200004071919.e37JJ2s05238@webber.adilger.net>
Subject: Re: [linux-lvm] Seg fault on vgscan
In-Reply-To: <E3A1ACFEDE71D3118C000020352285A01E73D0@nbsjexm2.nbtel.nb.ca>
 "from Shaw, Marco at Apr 7, 2000 03:01:24 pm"
Date: Fri, 7 Apr 2000 13:19:01 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Shaw, Marco" <marco.shaw@nbtel.nb.ca>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

Marco writes:
> > This is very bad.  You should not use LVM on existing partitions.  Does it
> > not say anything in this regard in the documentation?  Probably, as a
> > safety measure, the LVM commands should verify that a partition is not
> > mounted before doing a pvcreate/vgcreate on it.
> 
> I've not seen this in writing anywhere, but could have missed it.  I would
> hope there's a way to handle root_vg filesystems.  I thought I saw something
> in the archives regarding 'encapsulating' the root partition...  

I think the "encapsulation" of root is done by copying all of the data to
a new (LVM) filesystem, creating an init ramdisk, fixing up your lilo.conf
and then rebooting.

There was also some mention of modifying your partition table to have two
"overlapping" partitions - one that pointed to the start of the filesystem,
and the other that pointed to the start of the LVM data.  You would normally
boot with the LVM partition, but for lilo you would use the filesystem
partition.  I don't know what happened to this idea.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
