Return-Path: <hopper@omnifarious.mn.org>
Date: Fri, 20 Jul 2001 09:28:28 -0500
From: "Eric M. Hopper" <hopper@omnifarious.org>
Subject: Re: [linux-lvm] 2 LVM questions
Message-ID: <20010720092828.A11098@omnifarious.org>
References: <200107201334.QAA26563@easymail.hol.gr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline
In-Reply-To: <200107201334.QAA26563@easymail.hol.gr>; from moka@hol.gr on Fri, Jul 20, 2001 at 04:34:15PM +0300
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
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 20, 2001 at 04:34:15PM +0300, moka@hol.gr wrote:
>=20
> Hi there, new to LVM, so I would appreciate if you can=20
> point me to answers to these questions:
>=20
> 1) I have a system with 3 hard disks, and only one of=20
> them is presently used. This contains boot, root and=20
> swap plus a logical  partition(not LVM) containing
> /var and /home.
>=20
> I have big database tables, so I would like
>  to create one volume group consisting of the 2
>  unused disks plus the /var. Is this possible
>  without losing what is in /var?
> 2) The reason I need  a lot of space is that mysql
>   which I am using stores the database tables in /var.
>  Can I somehow "name" the volume group /var
>   so that mysql will not be confused?

	I would use pvcreate on your two disks, then vgcreate to bind
them together in a volume group.  A volume group is like a virtual disk
drive.  You have to 'partition' it.  This is what creating a 'logical'
volume us.  lvcreate is used for tihs.  You can create a logical volume
named whatever you want, but that name has nothing to do with where it's
mounted.

	Now, supposing you created a volume group called 'MyOnlyVG' and
created a logical volume on it called 'LVMvar', you now need to do a
mkfs on that logical volume.

mkfs /dev/MyOnlyVG/LVMvar

	After you do this, you should move the contents of /var to your
new filesystem.

mount /dev/MyOnlyVG/LVMvar /mnt/tmp
cp -ax /var /mnt/tmp

	Now, you can try using your new logical volume as '/var'.  I
think you can do this by going to single user mode then doing:

unmount /var
mount /dev/MyOnlyVG/LVMvar /var
init 3  # Goes back to multi-user mode.  init 5 for graphical login

	If everything seems to work fine, your new var should be OK.

	Now you can run pvcreate on your old /var device, run vgextend
to add it to the MyOnlyVG volume group, lvextend to resize the
/dev/MyOnlyVG/LVMvar logical volume/virtual partition, and a file system
resize utility to modifiy the size of the /var filesystem.

Have fun (if at all possible),
--=20
"It does me no injury for my neighbor to say there are twenty gods or no Go=
d.
It neither picks my pocket nor breaks my leg."  --- Thomas Jefferson
"Go to Heaven for the climate, Hell for the company."  -- Mark Twain
-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper)=
 --

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7WEAMG4QeWBeRdS8RAl55AJ9I3fapvv2i5xwZ6Ig3Jsj2PjHFPwCfZJp5
H/GzIK6QZf2sMYoaAo9mPT0=
=ZdFb
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
