From: "Joost van der Locht" <mailinglists@e-cube.nl>
Subject: RE: [linux-lvm] root fs on a LVM cause kernel panic
Message-ID: <NEBBKOJLIGMCKNCJJACPIEOFGIAA.mailinglists@e-cube.nl>
MIME-Version: 1.0
In-Reply-To: <01111514345801.02805@dirac.cids.ca>
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
Date: Fri Nov 16 10:08:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hello,

Be sure that you compiled the SCSI drivers into the kernel. Because when =
you
use lvmcreate_initrd script it doesn't load in any modules for it.

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
> Verzonden: donderdag 15 november 2001 20:31
> Aan: linux-lvm@sistina.com
> Onderwerp: Re: [linux-lvm] root fs on a LVM cause kernel panic
>
>
> Yes I did.
>
> The behavior is exactly as you stated. It seems the VGs are never
> detected and
> then the device for the root filesystem remains invalid.
>
> Is there anything I can do to check what is going wrong? I am new
> to the initrd
> and its usage. I don't know how to work with this beast... I
> don't think it is
> related to the lilo.conf. I saw a comment in the linux-lvm
> mailing list from Les
> Hazelton Sat, 13 Jan 2001 01:11:05-0500, it is very similar to my probl=
em.
> However, no solution is described.
>
> I looked at the lvmcreate_initrd script and found the actual
> libraries where
> not included in the image, just the symlinks where taken. I
> modified the script
> in order to include the actual libraries. It didn't work.
>
> The exact message is as follow:
>
> (snip)
> VFS: Cannot open root device "3a01" or 3a:01
> Please append a correct "root=3D" boot option
> Kernel panic: VFS: Unable to mount root fs on 3a:01
>
> Daniel Savard
>
> Le jeu, 15 nov 2001, vous avez =E9crit :
> > On Nov 15, 2001  00:41 -0500, Daniel Savard wrote:
> > > I read the lvmcreate_initrd man page and followed the
> instructions to create
> > > the kernel image with LVM support. However, I am unsuccessful
> to make it
> > > working properly. The system boot and is showing its
> messages, including the
> > > message about LVM support in the kernel and while it is
> trying to mount the
> > > root filesystem, I am getting a kernel panic message saying
> the "root=3D" stanza
> > > should be provided with a valid device for the root filesystem.
> > >
> > > What am I doing wrong? Is there anything missing? Any way to get ex=
tra
> > > debugging messages?
> >
> > Did you add the initrd image to the kernel stanza in lilo.conf
> and re-run
> > lilo?  It sounds like your kernel is booting, but the VGs are
> not active.
> >
> > Cheers, Andreas
> > --
> > Andreas Dilger
> > http://sourceforge.net/projects/ext2resize/
> > http://www-mddsp.enel.ucalgary.ca/People/adilger/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
