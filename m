From: Torsten Neumann <torsten@londo.rhein-main.de>
Subject: Re: [linux-lvm] Problems with raid1 and LVM and initrd
Date: 8 Oct 1999 21:21:16 +0200
Message-ID: <7tlg7c$6fe$1@londo.rhein-main.de>
References: <m11ZIFi-000D4UC@londo.rhein-main.de>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

I <torsten@londo.rhein-main.de> wrote:

[ snip ]

> The problem is the vgscan call. It doesn't find vg00, it just finds vg01.
> Inserting some debug code ( pvdisplay, pvscan, bash ) in the above it looks
> to me that /dev/md0 is correctly initialized. But the lvm-commands just
> returns error codes. The result is an error while booting the
> real-root-device, since there are no drivers it couldn't boot. (init not
> found)

Finally I found what was wrong, because it may be of interest for others:

If starting vgscan,pvscan from my ramdisk they "only" look in /dev/md/ for
md block-devices. They didn't use /dev/md0. Creating /dev/md/ and a
symlink /dev/md/md0 -> /dev/md0 solved the problem.

I didn't figured out why vgscan behaves different when starting via initrd
vs. "normal" bootup-sequence. As said before booting from a 3rd drive works
and there was also no /dev/md dir. 

	Torsten
