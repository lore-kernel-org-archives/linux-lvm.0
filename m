From: "Joost van der Locht" <mailinglists@e-cube.nl>
Subject: RE: [linux-lvm] root fs on a LVM cause kernel panic
Message-ID: <NEBBKOJLIGMCKNCJJACPKEPGGIAA.mailinglists@e-cube.nl>
MIME-Version: 1.0
In-Reply-To: <01111700053800.01209@dirac.cids.ca>
Content-Transfer-Encoding: quoted-printable
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
Date: Mon Nov 19 02:53:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Does Lilo support JFS? I use XFS instead of EXT2 but for that I needed to
patch lilo with XFS support.


Joost van der Locht
Technisch Directeur

E*Cube BV
Toernooiveld 214 - 6525 EC Nijmegen
T: 024-3500437 - F: 024-3500613
http://www.e-cube.nl
e-mail: joost@e-cube.nl             ICQ UIN: 494145

> -----Oorspronkelijk bericht-----
> Van: linux-lvm-admin@sistina.com
> [mailto:linux-lvm-admin@sistina.com]Namens Daniel Savard
> Verzonden: zaterdag 17 november 2001 5:10
> Aan: Andreas Dilger
> CC: linux-lvm@sistina.com
> Onderwerp: Re: [linux-lvm] root fs on a LVM cause kernel panic
>
>
> Number 2 can be dropped. I re-ran lilo after changing the configuration.
>
> I just tested number 1, this time I am getting an error while
> trying to access
> /dev/ram0 which doesn't exist at this time in the execution sequence.
>
> The error message was as follow:
>
> NET4: Unix domain sockets 1.0/SMP for Linux NET4.0
> ds: no socket drivers loaded!
> request_module [block-major-1]: Root fs not mounted
> VFS: Cannot open root device "100" or 01:00
> Please append a correct "root=3D" boot option
> Kernel panic: VFS: Unable to mount root fs on 01:00
>
> >From this, I decided to check my kernel setup and discovered
> (silly me) I made
> a newbie error. The initrd support at boot time was not enabled
> in my kernel.
>
> So, thanks for help to everyone and particularily to roadrunner on the =
IRC
> channel who give much time on-line to help me and Andreas Dilger.
>
> My system is not fully functionnal yet, however, the LVM problem
> is solved.
>
> My target configuration is a Linux From Scratch system, mostly
> based on V 3.0
> instructions. But, instead of gcc 2.95.3 it is based on gcc 3.0.2
> and glibc
> 2.2.4 with kernel 2.4.13. My remaining errors are with the initializati=
on
> scripts for the LFS, this is off topic on this dist list.
>
> So, if I can help in the future with testing. Let me know.
>
>  --
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> Daniel Savard
> Internet: dsavard@videotron.ca
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>
> Le ven, 16 nov 2001, Andreas Dilger a =E9crit :
> > On Nov 16, 2001  17:19 -0500, Daniel Savard wrote:
> > > While booting I am ending with a kernel panic message. The
> few last lines of
> > > the boot message are as follow:
> > >
> > > VFS: Cannot open root device "3a01" or 3a:01
> > > Please append a correct "root=3D" boot option
> > > Kernel panic: VFS: Unable to mount root fs on 3a:01
> >
> > Hmm, you only get that message when the initial boot is done, so two
> > possibilities (I'm not an initrd guru, mind you):
> >
> > 1) you need to change the root=3D line in your lilo.conf to say
> "root=3D/dev/ram0"
> >    so that it will boot into the initrd.  Then do the
> real-root-dev trick
> >    (or try pivot_root if running a 2.4 kernel) after configuring the =
LVM
> >    stuff via vgscan; vgchange -a y.
> >
> > 2) You didn't re-run lilo after changing lilo.conf (yes, you
> probably did,
> >    but you can never tell from here, and always safe to ask).
> >
> > > I also tested with ramdisk_size=3DX, where X is the size returned b=
y the
> > > lvmcreate_initrd script for the ramdisk.
> >
> > As long as this is larger than the size of the uncompressed ramdisk, =
you
> > should be OK.
> >
> > Cheers, Andreas
> > --
> > Andreas Dilger
> > http://sourceforge.net/projects/ext2resize/
> > http://www-mddsp.enel.ucalgary.ca/People/adilger/
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
