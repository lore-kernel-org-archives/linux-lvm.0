Date: Wed, 9 Aug 2000 08:15:11 +0100
From: Steve McIntyre <stevem@chiark.greenend.org.uk>
Subject: [linux-lvm] Data loss problems
Message-ID: <20000809081511.H397@chiark.greenend.org.uk>
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

I'm having some fun with lvm right now - it appears one (or maybe two)
of my disks have had problems:

...
Aug  9 07:37:13 hammer kernel: dev 3a:01 blksize=512 blocknr=7983929 sector=8370296 size=4096 count=1
Aug  9 07:37:13 hammer kernel: attempt to access beyond end of device
Aug  9 07:37:13 hammer kernel: 08:91: rw=1, want=4185156, limit=4184901
Aug  9 07:37:13 hammer kernel: dev 3a:01 blksize=512 blocknr=7983930 sector=8370304 size=4096 count=1
Aug  9 07:37:13 hammer kernel: attempt to access beyond end of device
Aug  9 07:37:13 hammer kernel: 08:91: rw=1, want=4185160, limit=4184901
...

Since this has happened I've had problems with the lvm. I tried vgck
to make sure things looked OK and it complained that it couldn't read
vg_scratch from the PVs. Using pvdisplay on those PVs said there was
no VG information on them. Even looking at the partition table on the
disks looks very bad:

hammer:/home/steve# fdisk -l /dev/sdj

Disk /dev/sdj: 64 heads, 32 sectors, 4091 cylinders
Units = cylinders of 2048 * 512 bytes

Disk /dev/sdj doesn't contain a valid partition table

I've used vgcfgrestore and now I can get the VG back up (and mounted),
but I'm very worried that the stuff that appears to be on disk is
badly corrupt. I'm about to check it now.

-- 
Steve McIntyre, Cambridge, UK.                   stevem@chiark.greenend.org.uk
<a href=http://www.chiark.greenend.org.uk/~stevem/>My home page</a>
"Can't keep my eyes from the circling sky,                 +------------------
"Tongue-tied & twisted, Just an earth-bound misfit, I..."  |Finger for PGP key
