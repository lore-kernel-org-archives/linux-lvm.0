From: Wiktor Wodecki <wodecki@gmx.de>
Message-Id: <20020301185709.GC1654@kakerlak>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="4ZLFUWh1odzi/v6L"
Content-Disposition: inline
Subject: [linux-lvm] bug in lvm 1.0.[23]
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
Date: Fri Mar  1 12:02:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--4ZLFUWh1odzi/v6L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello folks,

On my system there was a volume group called "storage" constructed of 3 har=
ddrives. There were 4 LV's. Well, my harddisks started to fail and I bought=
 new ones,
+reinstalled my system due to this 'opportunity'. Well, my new drives were =
merged to a vg called "storage", lv's were created, everything fine. Now I =
pluged-in
+the old drives, and, well, okay, it was party my fault by now, the old 'st=
orage' vg was accessible, the new one wasn't. I renamed the active vg to vg=
0 and
+rebootet in hope for two vg's to be available. There still was only one vg=
 active, the old one. Suprisingly it was accessible under the new *and* the=
 old name.
+Rather strange. I pluged the old disks of, and started my pc, to discover =
that the new vg was accessible under those two names, too. I could rename t=
hem and work
+with the old and the new vg, but the point is that I have 4 vgs now in my =
system - I only should see two.
It's a nasty bug and one shouldn't be so dumb as I was, but I think some sa=
nity checks in the code wouldn't be bad.
The old vg was created with lvm 1.0.2 on 2.4.16 or so and the new system wa=
s 2.4.18-rc1 with lvm 1.0.3.


--=20
Regards,

Wiktor Wodecki      |    http://johoho.eggheads.org
wodecki@gmx.de      |    IRC: Johoho@IrcNET

--4ZLFUWh1odzi/v6L
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8f88F6SNaNRgsl4MRAhD3AKDImIyvgzlnBCJOuywDUQri6ECtKQCaA7mE
HwBA/4NTBTcW7LjtmKd//XE=
=y6a1
-----END PGP SIGNATURE-----

--4ZLFUWh1odzi/v6L--
