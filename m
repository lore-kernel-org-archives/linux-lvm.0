Message-ID: <1058748940.3f1b3a0c7b145@webmail.phys.unsw.edu.au>
From: Melinda Taylor <melinda@phys.unsw.edu.au>
Subject: Re: [linux-lvm] problem building LVM2 for 2.6 kernel
References: <Pine.LNX.4.53.0307181659170.6115@localhost.localdomain> <20030719004618.J31325@uk.sistina.com>
In-Reply-To: <20030719004618.J31325@uk.sistina.com>
MIME-Version: 1.0
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
Date: Sun Jul 20 19:56:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Alasdair G Kergon <agk@uk.sistina.com>

Quoting Alasdair G Kergon <agk@uk.sistina.com>:

> On Fri, Jul 18, 2003 at 05:02:29PM -0400, Robert P. J. Day wrote:
> > 2.6.0-test1-ac2 version and selected device mapper and v4 ioctl
>=20
> I've not tried this kernel, but assuming it contains BLKGETSIZE64
> you'll need to compile LVM2 against newer glibc kernel headers
> (e.g. update the package for your linux distribution or symlink=20
> /usr/include/linux to include/linux in your -ac tree)


Yes excellent - this worked for me with the 2.4.20 kernel

ln -sf /usr/src/linux/include/linux /usr/include/linux

and lvm2 tools will now compile without the "device/dev-io.c:215: `BLKGET=
SIZE64'"
error.

Thanks very much, now back to seeing if LVM2 will help me recover my 2 re=
maining
LV from a a 4xLV VG.

Melinda :)
