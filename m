From: Stefan Weigel <sw@global-linxs.de>
Subject: Re: [linux-lvm] Re: problem with lvm on root-fs
References: <200210170859.03682.sw@global-linxs.de> <20021018095829.GA687@percy.comedia.it> <200210181241.28210.sw@global-linxs.de>
In-Reply-To: <200210181241.28210.sw@global-linxs.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200210181505.11782.sw@global-linxs.de>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Oct 18 08:03:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi Luca!
I should be happy now but there's still a problem left. First: now I can =
boot=20
from my lvm-root-fs (yeeehhaaa). My problem: one line in /etc/lilo.conf=20
(ramdisk=3D16384 instead of ramdisk=3D8192).
But if I now want to run lilo I get this message:

Fatal: Sorry, dont know how to handle device 0x3a05

My lilo.conf:

=2E..
boot=3D/dev/rd/c0d0

image =3D /boot/vmlinuz
  root =3D /dev/sysvg/rootlv
  label =3D lvm
  initrd =3D /boot/initrd-lvm-2.4.7-4GB.gz
  ramdisk =3D 16384
=2E..

Best regards

Stefan Weigel



Am Freitag, 18. Oktober 2002 12:41 schrieb Stefan Weigel:
> Am Freitag, 18. Oktober 2002 11:58 schrieb Luca Berra:
> > On Fri, Oct 18, 2002 at 10:13:56AM +0200, Stefan Weigel wrote:
> > >Am Donnerstag, 17. Oktober 2002 22:30 schrieb Luca Berra:
> > >> do you have any hint printed above this?
> > >
> > >Hi!
> > >I don't know exactly what you guess. I've used this one:
> > >http://tldp.org/HOWTO/LVM-HOWTO/upgraderoottolvm.html
> >
> > I meant, could you maybe connect a serial cable and provide the boot
> > messages up to the kernel panic, or something like that
> >
> > i am especially interested whether you have devfs or not,
> > messages from vgchange and the 'Mounted root' message
> >
> > L.
>
> Oh..ok. This should be no problem. I sent you the output soon.
>
> Greetings
>
> Stefan
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
