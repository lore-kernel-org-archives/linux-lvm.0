From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009071728.LAA08377@lynx.turbolabs.com>
Subject: Re: [linux-lvm] LVM and I2O
Date: Thu, 7 Sep 2000 11:27:59 -0600 (MDT)
In-Reply-To: <20000907161926.B21633@srv.t-online.de> from "Heinz J. Mauelshagen" at Sep 07, 2000 04:19:26 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>

Heinz, you write:
> _But_ in case a partiton is used to set up a Physical Volume it additionally
> checks the partition type identifier to avoid accidents like overwriting
> a native Linux partition.

This is "overly safe" and adds complexity to LVM.  There is no such safety
check for mkfs or mkswap or fdisk or any number of other ways to destroy
your disk...

Cheers, Andreas
