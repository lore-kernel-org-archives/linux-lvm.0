Message-ID: <3955D87A.590E9C2C@inet.net.nz>
Date: Sun, 25 Jun 2000 22:01:30 +1200
From: Dale Kemp <dale@inet.net.nz>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM /dev and /proc problems and change proposal
References: <3955A848.D5071D8E@inet.net.nz> <20000625103032.A3124@hmsysv.t-online.de>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>

> But It dissallows the user to do it and there's still plenty of free namespace
> to find a meaningfull name for the Volume Group.

I'm refering to the future when a new device gets added that just might
clash with a volume group name that a user has chosen. And we don't know
what users are going to call their volume groups and we don't know what
device names will be created in the future.

> There's a preprocessor definition LVM_DIR_PREFIX in the code, which
> supports this already.

So I see. The simplest solution is to change this default prefix, and have the
lvm stuff self-contained in its own subdirectory. Even without the name
clash this is just tidier, already /dev is very wide but not very deep.

> I don't like both, because they break the hierarchy of LVs (like virtual
> partitions) contained in VGs (like virtual disks containing physical disks).

Fair enough :-)  Just throwing some ideas around.

Can I `propose' that simply by changing the default (LVM_DIR_PREFIX) in the
original LVM code and we begin `standardizing' now the LVM directories.

eg.

  /dev/lvm/ (all previuos
    |
    +-- lvm [c:109,0] (need to change constant LVM_DIR in "liblvm.h" too]
    |
    +-- vdisk1/
         |
         +-- group [c:109,0]
         +-- lvol1 [b:58,0]
         +-- lvol2 [b:58,1]


> > Also I think there should be a sub-directory for lvm itself in /proc
> > ie. /proc/lvm/lvm instead of /proc/lvm.
>
> Yep.
> Already on the TODO list.
> I share your point of view in regard to /proc.

The need for /proc/lvm/... is simular to that for /dev/lvm/...

-- Dale.
