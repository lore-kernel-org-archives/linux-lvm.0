Date: Mon, 7 Feb 2000 14:11:59 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Configuring boot partition with LVM
Message-ID: <20000207141159.A1222@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <Pine.LNX.4.20.0002041218580.416-100000@claudius.mgmt-inc.com> <20000207103719.A1170@suse.de>
Mime-Version: 1.0
In-Reply-To: <20000207103719.A1170@suse.de>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Mon, Feb 07, 2000 at 10:37:19AM +0100, Fabian.Herschel@suse.de wrote:
> At this point of time lilo is not ready to boot a kernel fom a lv. Lilo
actually you can, if you play tricks with your partition table :)
but being real, you will need to move vgscan into kernel space.

> should also learn how to boot a kernel fom a striped volume...
this seems impossible to me, unless you add a boot area
to the VG structure.
lilo is a multi stage boot process
a small 512-byte loader is placed in the mbr
this loader then loads lilo itself from the disk
now if you want a striped vg for /boot
you must also find somewere to store the second stage boot loader.
and it must be possible to load it from a 512-byte program.

L.

-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.
