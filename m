From: "William Blunn" <bill@tao-group.com>
Subject: Re: [linux-lvm] To compile
Message-Id: <001801c1bddc$b32b51e0$216410ac@tao.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <wxxzo1yecqu.fsf@nommo.uio.no>
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
Date: Mon Feb 25 03:13:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Terje Kvernes <terjekv@math.uio.no> wrote:
> "William Blunn" <bill@tao-group.com> writes:
> > Er, you might find that it is a good idea to put your LVM shared
> > library in /lib.
> >=20
> > Otherwise you might have difficulting starting up the system if /usr
> > or /usr/local is on an LVM volume.
>=20
>   right.  this also goes for vgscan and vgchange.  now, site-specific
>   software around where I work gets tossed to /site.  which of course
>   is either a partition or a volume.  either way, doing:
>=20
> [root@host /sbin]# ln -s /site/sbin/vgchange && ln -s =
/site/sbin/vgscan
>=20
>   isn't as bright as one first thinks. =20
>=20
>   of course, when testing for volumegroups only / has been mounted, in
>   case any other mountpoints are logical volumes.  *sigh*

I set up:

   /opt/lvm-1.0.1             in the (small) root FS
   /usr/local/opt/lvm-1.0.1   in the /usr filesystem (on LVM)

I put the LVM tools at /opt/lvm-1.0.1/sbin, and symlinked them from =
/sbin.

I put the manpages in /usr/local/opt/lvm-1.0.1/man, and symlinked them
from /usr/local/man.

I put the runtime/shared-object (.so) library directly in /lib.

I put the development/static (.a) library in
/usr/local/opt/lvm-1.0.1/lib, and symlinked it from /usr/local/lib.

After all this, I wondered how difficult it would be to make a
Debian/Potato package out of it.

Bill
