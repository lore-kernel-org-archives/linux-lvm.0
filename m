Date: Wed, 2 Jun 1999 14:22:11 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Re: root filesystem in lvm
Message-ID: <19990602142211.D16040@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <5l3e0adgs4.fsf@tequila.cs.yale.edu>
Mime-Version: 1.0
In-Reply-To: <5l3e0adgs4.fsf@tequila.cs.yale.edu>; from Stefan Monnier on Wed, Jun 02, 1999 at 06:43:23AM -0400
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Wed, Jun 02, 1999 at 06:43:23AM -0400, Stefan Monnier wrote:
> How would LILO deal with a kernel image spread over several physical
> partitions (or even disks) (in case you not only want a root fs on LVM but
> a striped/mirrored/trucmuched one) ?
Hard, real hard, lilo uses only bios calls, and in 512bytes
you just cannot fit anithing better, all other os that use lvm
have a /stand partition at the beginning of the disk,
it can be mirrored but it must necessarily be contiguous

> > If included statically in the kernel the lvm driver could
> > execute the equivalent of a vgchange -ay and we should be able to
> > mount the root file system.
> 
> That would be really neat.  The initrd workaround is just that: a workaround.

i personally love modular kernels, so i'd use initrd anyway, but
i agree vgchange -a y could be handled by the kernel.

but i also believe that this would be easier to debug/mantain in
user space.
L.

-- 
Luca Berra -- bluca@comedia.it
    Communications Media & Services S.r.l.
