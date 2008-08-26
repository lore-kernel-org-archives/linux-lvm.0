Message-ID: <48B43C1B.6060801@redhat.com>
Date: Tue, 26 Aug 2008 18:23:39 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] VG won't activate upon reboot
References: <BAY107-W8ADCAC071D0CAF22B6B488F640@phx.gbl>	
	<48B3DFD4.5030502@redhat.com>
	<b646832c0808261009u6a6888bdy720d5a44a2e2e7ae@mail.gmail.com>
In-Reply-To: <b646832c0808261009u6a6888bdy720d5a44a2e2e7ae@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: =?windows-1252?Q?Yajith_Ajantha_Dayarathna_=7C_=3F=3F=3F=3F=3F?= =?windows-1252?Q?_=3F=3F=3F=3F=3F_=3F=3F=3F=3F=3F=3F=3F?= <yajith@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Yajith Ajantha Dayarathna
> mkinitrd might help...perhaps.

Why?

Most distribution initramfs scripts should only bring up the VG that
contains the root volume group. If this were a root VG then the system
would not boot at all.

Auxiliary volume groups should be activated later on by the boot scripts
(possibly after loading drivers and initialising other subsystems on
which they depend).

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFItDwb6YSQoMYUY94RAkD/AKDS3usW1y7iVbnKPSw53zqORXhJqwCeJ024
zY46lV7EwHV7pjmSi8tqKeM=
=sStt
-----END PGP SIGNATURE-----
