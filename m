Subject: Re: [linux-lvm] LVM 1.03 root file system on Redhat 7.3
From: Daniel Savard <dsavard@cids.ca>
In-Reply-To: <E17DJKw-0006ou-00@hermes.sistina.com>
References: <E17DJKw-0006ou-00@hermes.sistina.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1022804412.19446.28.camel@dirac.cids.ca>
Mime-Version: 1.0
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
Date: Thu May 30 19:21:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

le jeu 30-05-2002 =E0 02:22, James B. Byrne a =E9crit :

>=20
> We are using the grub bootloader.  We have followed the=20
> instructions contained in the the lvm howto document provided by=20
> sistina, to the best of my ability to understand them.
>=20
> The problem is that system gives a kernel panic when started using=20
> the lvm boot option.  Is there a way to redirect the boot dialogue=20
> output to a file?  It appears that the most informative messages may=20
> be scrolling of the top of the screen.  What I am seeing is this:
>=20
> kmod: failed to exec /sbin/modeprobe -s -k block-major-7 errno =3D 2=20
>=20
> repeated 16 times, followed by
>=20
> vgvchange -- volume group "vg00" successfully activated
>=20
> VFS: Cannot open root device "vg00"/lv01: or 00:00
> Please append correct "root=3D" boot option
> Kernel panic: VFS: Unable to mount root fs on 00:00
>=20
> Help?
>=20
> Regards,
> Jim
> ---     e-mail is NOT a secure channel=20
> James B. Byrne                mailto:ByrneJB@Harte-Lyne.ca
> Harte & Lyne Limited          http://www.harte-lyne.ca
> 9 Brockley Drive              vox: +1 905 561 1241
> Hamilton, Ontario             fax: +1 905 561 0757
> Canada  L8E 3C3
>=20

Although I am using lilo, I suppose it is the same problem I
encountered.

Don't know GRUB, but I suppose there is a line which specify your root
filesystem. You should have something like: /dev/myvg/mylv instead of
/dev/sdaX or /dev/hdaX or any disk name.

Regards,
--=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Daniel Savard
Consultation Informatique Daniel Savard
551, boul. Sir-Wilfrid-Laurier
suite 105
Beloeil, (Qu=E9bec)
Canada J3G 4J1

T=E9l: (450) 467-8014
Internet: dsavard@cids.ca
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
