From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009081707.LAA01055@lynx.turbolabs.com>
Subject: Re: [linux-lvm] LVM and I2O
Date: Fri, 8 Sep 2000 11:07:52 -0600 (MDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>

Jan Niehusmann writes:
> But mkfs and mkswap are tools that are normally only called manually by an
> administrator who should know what he does.

And pvcreate _won't_ be called by the same person?  I don't see any
difference between overwriting your disk with mkfs, fdisk, or pvcreate.
I agree it may be a good idea to verify that a disk isn't mounted before
doing a pvcreate, but IMHO it is a wasted effort to make your code more
complex when trying to prevent people from shooting themselves in the foot.
In the end they will just get a different gun... and learn a bit.

> Some lvm tools are called automatically from startup scripts, and if the
> partition tables or other config have been changed they may try to access
> the wrong partition, so some additional checks may be reasonable.

I hope nobody is calling pvcreate in an rc script...  From what Heinz
said about LVM 0.9, it will finally implement UUID support, so LVM
will be able to identify a PV no matter what device it is on.

> What about making it a command line option? I can see three possible 
> behaviours: 

> no checking of partition types at all

This is my opinion - remove all the code that does this and "solve" the
problems that have appeared on this list in the last few months.  With
Linux 2.4, it supports DOS, BSD, Sun, SGI, Mac, Windows, etc. partitions.
We don't want LVM to re-do all of this again.

> we may have some kind of --force option that skips the checks, some people
> want to be able to shoot themselves in the foot.

As long as we don't erase a mounted filesystem, then IMHO this is the best
we can do without jumping through too many hoops.

Cheers, Andreas
