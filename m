Subject: Re: [linux-lvm] Raid or backups
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <20031121172915.GN10912@riseup.net>
References: <20031121172915.GN10912@riseup.net>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-O3wLcDbbtZ4b0IFgZh7C"
Message-Id: <1069452145.20763.160.camel@pc>
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
Date: Mon Nov 24 08:04:04 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-O3wLcDbbtZ4b0IFgZh7C
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-11-21 at 12:29, Micah Anderson wrote:
>=20
> I don't like a machine that is dependant on one disk any more than the
> next guy, so I put another 120gig disk in the machine, thinking I
> would raid the two together. After reading months of list archives, I
> am seeing that building a raid array on the system at this point is
> not going to be straightforward, especially since the machine is in
> production. It seems the best method for doing this would be to build
> up md raid devices, layer LVM on top of the md's and then create
> filesystems, this isn't easy if you already have things up and running
> (although I am interested to hear if people have done this, and if so,
> how).

Debian Woody's installer has no concept whatsoever of raid and lvm, I
build all my systems with mirrored LVs anyhow.  Here is how I do it:

     1. Start Debian install
     2. Create 20MB /boot filesystem/partition at the start of the disk
     3. Then create a "temporary" root filesystem/partition the size
        that you want swap to eventually be (minimum 200MB or so to get
        minimal debian install onto it)
     4. Then create one partition for all remaining space
     5. Do not specify to mount /boot partition during installation so
        that /boot files are put on "temporary" root filesystem
     6. Do minimal Debian install (no to tasksel and dselect) into 250MB
        partition, specify no swap partition
     7. When all done installing truly minimal install, put second disk
        into machine
     8. Use sfdisk to duplicate partition table to second disk
     9. Create raidtab mapping partition(s) 1, 2 and 3 to md0, md1 and
        md2 respectively
    10. mkraid /dev/md0
    11. Mount /dev/md0 on /mnt and copy /boot to it, remove /boot/* and
        mount /dev/md0 on /boot
    12. mkraid /dev/md2
    13. pvcreate /dev/md2
    14. vgcreate /dev/md2
    15. lvcreate root, mkfs ... /dev/.../root
    16. lvcreate usr, mkfs ... /dev/.../root
    17. lvcreate ...
    18. mount /dev/.../root /mnt, /dev/.../usr /usr, ...
    19. copy -rax / /mnt, cp -rax /usr /mnt, ...
    20. Create initrd to reflect above -- I use Adrian Bunk's
        initrd-tools
    21. Edit /etc/lilo.conf to reflect /dev/md0 is boot partition and
        lvm lv as root partition
    22. edit fstab to reflect above changes
    23. reboot
    24. mkraid /dev/md1
    25. add /dev/md1 to fstab as swap partition and swapon -a

Have fun.

b.

--=20
My other computer is your Microsoft Windows server.

Brian J. Murrell

--=-O3wLcDbbtZ4b0IFgZh7C
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/votxl3EQlGLyuXARAq5YAKCo2FtAJgaMF2Ss3FiPsUIocbNQmwCfTV+a
UMTVJW/8lAgMYgrpVegieA0=
=CPyO
-----END PGP SIGNATURE-----

--=-O3wLcDbbtZ4b0IFgZh7C--
