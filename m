From: Daniel Savard <dsavard@videotron.ca>
Subject: Re: [linux-lvm] root fs on a LVM cause kernel panic
References: <01111617512007.02805@dirac.cids.ca> <20011116171922.M1308@lynx.no>
In-Reply-To: <20011116171922.M1308@lynx.no>
MIME-Version: 1.0
Message-Id: <01111700053800.01209@dirac.cids.ca>
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
Date: Fri Nov 16 23:11:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Andreas Dilger <adilger@turbolabs.com>
Cc: linux-lvm@sistina.com

Number 2 can be dropped. I re-ran lilo after changing the configuration.

I just tested number 1, this time I am getting an error while trying to acc=
ess
/dev/ram0 which doesn't exist at this time in the execution sequence.=20

The error message was as follow:

NET4: Unix domain sockets 1.0/SMP for Linux NET4.0
ds: no socket drivers loaded!
request_module [block-major-1]: Root fs not mounted
VFS: Cannot open root device "100" or 01:00
Please append a correct "root=3D" boot option
Kernel panic: VFS: Unable to mount root fs on 01:00

From this, I decided to check my kernel setup and discovered (silly me) I =
made
a newbie error. The initrd support at boot time was not enabled in my kerne=
l.

So, thanks for help to everyone and particularily to roadrunner on the IRC
channel who give much time on-line to help me and Andreas Dilger.

My system is not fully functionnal yet, however, the LVM problem is solved.

My target configuration is a Linux From Scratch system, mostly based on V 3=
.0
instructions. But, instead of gcc 2.95.3 it is based on gcc 3.0.2 and glibc
2.2.4 with kernel 2.4.13. My remaining errors are with the initialization
scripts for the LFS, this is off topic on this dist list.

So, if I can help in the future with testing. Let me know.

 --=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Daniel Savard
Internet: dsavard@videotron.ca
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

Le ven, 16 nov 2001, Andreas Dilger a =EF=BF=BDcrit :
> On Nov 16, 2001  17:19 -0500, Daniel Savard wrote:
> > While booting I am ending with a kernel panic message. The few last lin=
es of
> > the boot message are as follow:
> >=20
> > VFS: Cannot open root device "3a01" or 3a:01
> > Please append a correct "root=3D" boot option
> > Kernel panic: VFS: Unable to mount root fs on 3a:01
>=20
> Hmm, you only get that message when the initial boot is done, so two=20
> possibilities (I'm not an initrd guru, mind you):
>=20
> 1) you need to change the root=3D line in your lilo.conf to say "root=3D/=
dev/ram0"
>    so that it will boot into the initrd.  Then do the real-root-dev trick
>    (or try pivot_root if running a 2.4 kernel) after configuring the LVM
>    stuff via vgscan; vgchange -a y.
>=20
> 2) You didn't re-run lilo after changing lilo.conf (yes, you probably did,
>    but you can never tell from here, and always safe to ask).
>=20
> > I also tested with ramdisk_size=3DX, where X is the size returned by the
> > lvmcreate_initrd script for the ramdisk.
>=20
> As long as this is larger than the size of the uncompressed ramdisk, you
> should be OK.
>=20
> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
