Message-Id: <199906021129.HAA17118@tequila.cs.yale.edu>
From: "Stefan Monnier" <news+lists.linux.lvm@tequila.cs.yale.edu>
Subject: [linux-lvm] Re: root filesystem in lvm
Date: 02 Jun 1999 06:43:23 -0400
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

[ I apologize if you receive multiple copies, but it seems that
  my earlier attempts didn't make it through.  Is this a closed
  mailing-list ?   - sm ]

A while ago, Michael Marxmeier (mike@msede.com) mentioned:
> However it should be possible to use LILO. As far as i understand
> LILO uses partition relative block numbers to load the kernel image.
> We just need to make sure that they are relative to the dos style
> partition.

How would LILO deal with a kernel image spread over several physical
partitions (or even disks) (in case you not only want a root fs on LVM but
a striped/mirrored/trucmuched one) ?

> If included statically in the kernel the lvm driver could
> execute the equivalent of a vgchange -ay and we should be able to
> mount the root file system.

That would be really neat.  The initrd workaround is just that: a workaround.

> However this will lead to some kernel bloat as some of the code which
> currently resides un user space in lvmlib and vgchange must also be
> present in the kernel.

- how hard would it be ?
- source code bloat:  hopefully, the exact same source code can be shared
  between the kernel and the liblvm/vgchange (I deeply hate code duplication)
- kernel bloat:  how bad would it be ?
  how much of that extra code could be put in __INITFUNC (so that the bloat
  only impacts the on-disk kernel image, but not the in-memory one) ?
  Let's also not forget that the kernel bloat should be measured between
  'linux+lvm+initrd' and 'linux+lvm+lvmroot'.


	Stefan
