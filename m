Date: Tue, 6 Jun 2000 18:21:16 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM 0.8 and reiser filesystem
Message-ID: <20000606182115.A3564@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <H0000aed07d348ed@MHS>
Mime-Version: 1.0
In-Reply-To: <H0000aed07d348ed@MHS>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Tue, Jun 06, 2000 at 05:44:21PM +0200, holger_zecha@hp.com wrote:
> Are you going to implement mirroring in Linux LVM ? Why is it such a big problem to have the root filesystem on a LVM volume ?
> There is no easy way to get mirrored disks with LVM, only without LVM, but there it's not possible to resize partitions.

You can layer lvm above linux-raid, so you get both mirroring, or any other
raid level for that matter and lvm toghether.

It is not a big problem to have root on LVM, the problem is having
the kernel on a LV
just create a normal partition and put the kernel there,
use an initrd to start lvm before mounting root.
the reason for this is that so the kernel is not bloated with code
that should live in userspace (vgscan, vgchange)

L.

-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.
