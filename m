From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Strange file system errors
Message-ID: <20040114142444.GA2837@redhat.com>
References: <20040114113509.GA745@glorybox.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040114113509.GA745@glorybox.de>
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
Date: Wed Jan 14 18:22:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Wed, Jan 14, 2004 at 12:35:09PM +0100, Kai Weber wrote:
> Hi,
>=20
> if I have to reboot my system without a clean shutdown the recovered
> filesystems are corrupt. Files which I edited recently and maybe not ye=
t
> written to the buffer are recovered with no or corrupt contents.=20
>=20
> For example:
>=20
> $ ls -l config
> -rw-------    1 bond     bond        19622 Jan 14 12:04 .config
> $ stat config
>   File: `config'
>   Size: 19622           Blocks: 0          IO Block: 4096   regular fil=
e
> Device: fe01h/65025d    Inode: 20967432    Links: 1
> Access: (0600/-rw-------)  Uid: ( 1000/    bond)   Gid: ( 1000/    bond=
)
> Access: 2004-01-14 12:27:01.000000000 +0100
> Modify: 2004-01-14 12:04:16.000000000 +0100
> Change: 2004-01-14 12:04:16.000000000 +0100
> $ cat config
> $ less config
> "config" may be a binary file.  See it anyway?
> ^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@
> [...]
> $ strace -e write cat config
> write(1, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4=
096) =3D 4096
> write(1, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4=
096) =3D 4096
> write(1, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4=
096) =3D 4096
> write(1, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4=
096) =3D 4096
> write(1, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 3=
238) =3D 3238
>=20
> I can force this error by pressing the reset button with an open file i=
n my
> text editor. It seems to have nothing to do with the underlying file
> system. I have XFS and ext3 partitions. I would like to know, if it is =
a
> LVM problem.=20

No.

>=20
> Kernel 2.6.1
> LVM version:     2.00.08 (2003-11-14)
> Library version: 1.00.07-ioctl (2003-11-21)
> Driver version:  4.0.0
>=20
> --=20
>   Kai Weber
> =BB kai.weber@glorybox.de
>   http://www.glorybox.de
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--=20

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
