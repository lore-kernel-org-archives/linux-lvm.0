Subject: Re: [linux-lvm] Trouble switching from LVM2 to LVM1
References: <yw1x4r4yfiab.fsf@zaphod.guide>
	<20030417214241.F14411@uk.sistina.com>
From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@users.sourceforge.net>
In-Reply-To: Alasdair G Kergon's message of "Thu, 17 Apr 2003 21:42:41 +0100"
Message-ID: <yw1xista3owx.fsf@manganonaujakasit.e.kth.se>
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
Date: Sat Apr 19 02:52:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Alasdair G Kergon <agk@uk.sistina.com> writes:

> > without errors, but all the LV device nodes are created with minor 0.
>=20
> Some time back, LVM1 introduced persistent minors, so the minor number =
is=20
> stored on disk and remembered for subsequent activations.
>=20
> In LVM2, persistent minors are optional and the default is *not* to use
> them, so the minor number may be different each time a device is
> activated, and no minor number is stored on disk.
>=20
>=20
> IIRC Exporting the VG and then importing it again will reassign LVM1=20
> minor numbers.

OK, thanks.  I patched my 2.4 kernel with device-mapper instead and it
seems to be working, but it's nice to know what was going on.

--=20
M=E5ns Rullg=E5rd
mru@users.sf.net
