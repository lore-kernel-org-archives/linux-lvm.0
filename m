From: Daniel Savard <dsavard@videotron.ca>
Subject: Re: [linux-lvm] root fs on a LVM cause kernel panic
MIME-Version: 1.0
Message-Id: <01111514345801.02805@dirac.cids.ca>
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
Date: Thu Nov 15 13:40:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Yes I did.

The behavior is exactly as you stated. It seems the VGs are never detected =
and
then the device for the root filesystem remains invalid.

Is there anything I can do to check what is going wrong? I am new to the in=
itrd
and its usage. I don't know how to work with this beast... I don't think it=
 is
related to the lilo.conf. I saw a comment in the linux-lvm mailing list fro=
m Les
Hazelton Sat, 13 Jan 2001 01:11:05-0500, it is very similar to my problem.
However, no solution is described.

I looked at the lvmcreate_initrd script and found the actual libraries where
not included in the image, just the symlinks where taken. I modified the sc=
ript
in order to include the actual libraries. It didn't work.

The exact message is as follow:

(snip)
VFS: Cannot open root device "3a01" or 3a:01
Please append a correct "root=3D" boot option
Kernel panic: VFS: Unable to mount root fs on 3a:01

Daniel Savard

Le jeu, 15 nov 2001, vous avez =EF=BF=BDcrit :
> On Nov 15, 2001  00:41 -0500, Daniel Savard wrote:
> > I read the lvmcreate_initrd man page and followed the instructions to c=
reate
> > the kernel image with LVM support. However, I am unsuccessful to make it
> > working properly. The system boot and is showing its messages, includin=
g the
> > message about LVM support in the kernel and while it is trying to mount=
 the
> > root filesystem, I am getting a kernel panic message saying the "root=
=3D" stanza
> > should be provided with a valid device for the root filesystem.
> >=20
> > What am I doing wrong? Is there anything missing? Any way to get extra
> > debugging messages?
>=20
> Did you add the initrd image to the kernel stanza in lilo.conf and re-run
> lilo?  It sounds like your kernel is booting, but the VGs are not active.
>=20
> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
