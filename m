Message-ID: <39879448.8414ED6@inet.net.nz>
Date: Wed, 02 Aug 2000 15:23:52 +1200
From: Dale Kemp <dale@inet.net.nz>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Generic resize tool
References: <200008011842.e71IgcS27484@webber.adilger.net>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM <linux-lvm@msede.com>

Andreas Dilger wrote:

> Hello,
> I'm wondering if people are interested in having a more generic resize tool
> than the current e2fsadm.  I've updated e2fsadm to have support for the
> GNU ext2resize tools (ext2resize and ext2online) in addition to resize2fs,
> but I was wondering about adding support for reiserfs resizing as well.
> At this point e2fsadm isn't a very good name for it anymore.
>
> I was thinking if renaming it to "chfs" the same as AIX LVM tool which
> handles both LV and FS resizing, among other things, and does not sound
> fs-specific.
>
> Cheers, Andreas

Earlier in discusions I suggested some common ground between volume
managers and filesystems, so that we can move forward in this area.

For the resize situation I suggest a simular way to mkfs which simply adds
a dot extension for each program, ie.

mkfs -t ext2    calls mkfs.ext2
mkfs -t minux calls mkfs.minux

I suggest we simply have:

resizefs -t ext2    calls resizefs.ext2
resizefs -t jfs calls resizefs.jfs

(Note resizefs.jfs can have its own unique options just like mkfs.<X> has,
all thats needed are some common elements)

Here we need a common set of options for resizing across all filesystems,
eg. --size [+|-]X[G|M|k]

eg.

resizefs -t ext2  --size +50M <partiton>

However we need volumes not just partitions.

resizevol -l lvm -t ext2 --size +50M /dev/lvm/lvol1

or,

resizevol -l ibmlvms -t jfs --size +50M lvol4

Exactly how this is implemented I haven't given too much thought,
but I would like IBM, SGI and LVM team get together on this but maybe
I'm dreaming again... Are you listening IBM? Lets get it tidy now not
later. I'm not asking IBM to give up there JFS/LVMS port (which is a very
good idea) I'm asking them to help work towards a better solution for
linux in general. If "chfs" is generic enough then we can make that the
"linux standard".

-- Dale.
