Return-Path: <lewis@sistina.com>
Date: Thu, 14 Jun 2001 09:36:38 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] LVM kernel patch request
Message-ID: <20010614093637.A22499@sistina.com>
References: <000601c0f4bd$f1bbb1e0$3533a8c0@leo2000>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <000601c0f4bd$f1bbb1e0$3533a8c0@leo2000>; from leowong@i-stt.com.hk on Thu, Jun 14, 2001 at 06:36:54PM +0800
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

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 14, 2001 at 06:36:54PM +0800, Leo Wong wrote:
> I am using RedHat7.1 with Kernel version 2.4.2-2. I downloaded the binari=
es patch-generator0.91beta7 rpm. i follow the instructions(i.e. ./configure=
 and then make in PATCHES, then a patch -p1 < /xx/xxx/PATCHES/xxxxx.patch) =
 to patch the kernel and everything wents well when i do a make config in t=
he /usr/src/linux, configuring the LVM as a modules.=20

Where is your kernel source located?  Did you specify this location when you
ran ./configure?  (ie, './configure --with-kernel_dir=3D/usr/src/linux-2.4.=
2-2')

> But i cannot do a make modules, after i make dep;make clean;make bzlilo, =
lots of compilation errors jump out.

A log of the exact errors would be nice.  I really don't have any idea what
is going wrong unless I can see those.

> I then try compile the LVM in the kernel by running make config again. af=
ter i build everything, when i run the vgscan, it says "lvmiopversion -- LV=
M driver/module not loaded?"

Did you install the new kernel and reboot?  It may be possible to get along
without rebooting if you are building the kernel modules, but you will
definitely need to reboot if LVM is built into the kernel.

> Seemingly the LVM module/compilation doesn't work for this kernel.

It should work, but RedHat puts a lot of additional patches into their
kernels, and it is possible there is a conflict somewhere.  Did the patch
apply cleanly?

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
Hope is NOT a thing with feathers, the thing with feathers is my nephew,
and I have to take him to a specialist in Zurich. - Woody Allen
-----End Obligatory Humorous Quote------------------------------------------

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7KMv1pE6/iGtdjLERAvBXAKCbJvfKWheXXo7m1yX5jd7mMnY5JQCfTmfm
KyGgYQxRamnfk6eEodqfBmc=
=nJ3q
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
