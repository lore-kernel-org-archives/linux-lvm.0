From: Andreas Dilger <adilger@enel.ucalgary.ca>
Message-Id: <199906211751.LAA11908@munet-d.enel.ucalgary.ca>
Subject: Re: [linux-lvm] lvm-0.6, Linux 2.2.9
Date: Mon, 21 Jun 1999 11:51:57 -0600 (MDT)
In-Reply-To: <m10v3y9-0000YbC@duffy1.franken.de> from "Rolf Jakob" at Jun 18, 99 09:06:29 pm
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM on Linux <linux-lvm@msede.com>, Linux FS development list <linux-fsdevel@vger.rutgers.edu>

Rolf writes:
> Yes, that is very interesting. Ext2fs has been there for quite a long time,
> so chances are good that it still works. I would like to take a look at it.
>
> Could you please send it to me or mail the URL where you put it ?

I have uploaded the old ext2-volume-v0.1.tar.gz to my web site,
http://www-mddsp.enel.ucalgary.ca/People/adilger/ext2-volume-v0.1.tar.gz

as I couldn't connect to tsx-11 lately, which is where I found it originally.
The good news is that the patch was developed for 2.1.42, so it is at least
half-way to working with 2.2.

I had another quick look at the README/code, and it looks like LVM will
help with some of the basic problems mentioned therein, such as handling
multiple disk names, changing e2fsck, changing the mount command.  All
of those problems go away because we are growing an LV, rather than
concatenating volumes.  The one trick will be to build the basic ext2
stuctures on the extended part of the LV without touching the current
filesystem - this may require modifications to mke2fs.  Another good thing
is that this definitely claims to work with a mounted filesystem, although
it requires a remount a-la "mount -o remount,rw...", but I think this will
work on an FS that has open files on it.

One note is that the original author, Miguel de Icaza, is no longer supporting
this code (he's busy working on GNOME), so don't bug him about it.

Cheers, Andreas
-- 
Andreas Dilger   University of Calgary  \"If a man ate a pound of pasta and
                 Micronet Research Group \ a pound of antipasto, would they
Dept of Electrical & Computer Engineering \   cancel out, leaving him still
http://www-mddsp.enel.ucalgary.ca/People/adilger/       hungry?" -- Dogbert
