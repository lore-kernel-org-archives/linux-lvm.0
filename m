Return-Path: <lewis@sistina.com>
Date: Tue, 17 Apr 2001 23:41:27 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Strangenesses with snapshots, 0.9.1-beta6.
Message-ID: <20010417234127.B3388@sistina.com>
References: <20010417220804.T31343@engen.priv.no>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Content-Disposition: inline
In-Reply-To: <20010417220804.T31343@engen.priv.no>; from vegard@engen.priv.no on Tue, Apr 17, 2001 at 10:08:04PM +0200
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

--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Are you sure those files were in a consistant state when you took the
snapshot?  You really need to get your file system into a consistant state,
otherwise the metadata could be partially written out when the snapshot is
made.  There are hooks put into the 2.4x series kernels for ReiserFS to
allow it to prepare for snapshots...but i don't think ext2 uses any
mechanisms like this.  I don't know a whole lot about it, but that's what it
looks like to me.

The other thing you could do to further aid in debugging this is upgrade to
0.9.1 Beta7 (including repatching the kernel) and testing it again to see if
you get the same kind of problem.

Hopefully others will have insight into this.

Regards,
aj

On Tue, Apr 17, 2001 at 10:08:04PM +0200, Vegard Engen wrote:
> Hello,
>=20
> The two last days I started testing 0.9.1-beta6 for my home-machine, hopi=
ng to get rid of the everlasting partitioning pain. Trying out the snapshot=
s, I get
> worrying errors when making a full backup of my ~4 GB /home partition. Th=
is is
> a pretty long mail demonstrating the error....
>=20
> I'm using kernel 2.4.3, with ext2 filesystems on the logical volumes. The
> kernel is patched with LVM 0.9.1-beta6 patches, and these patches succeed=
ed.
> I followed the instructions and made a lvm-0.9.1_beta6-2.4.3.patch - which
> applied flawlessly to the kernel.
>=20
> I have made the following backup-script as a test:
> ----- snip ------
> #!/bin/sh
> if [ -e /dev/backup/home ] ; then
>   umount /dev/backup/home;
>   lvremove -f /dev/backup/home;
> fi
> if [ -e /dev/vg/backup ] ; then
>   umount /dev/vg/backup
>   lvremove -f /dev/vg/backup
> fi
>=20
> lvcreate -L 1000M -s -n backup /dev/vg/nhome
> mount /dev/vg/backup /mnt/backup
> lvcreate -L 5000M -n home backup
> mount /dev/backup/home /mnt/bhome
> cp -a /mnt/backup/* /mnt/bhome
> ----- snip ------
>=20
> I tried it out. There was very little activity at all on the system when
> running this, so filling up the snapshot-volume is not an issue here.
>=20
> Well, the following is output from the script. This is a little long - I'=
m commenting inside the output, so please read....
>=20
> middagspynten:/usr/local/sbin# ./backup_home.sh=20
> lvcreate
> lvcreate -- WARNING: the snapshot must be disabled if it gets full
> lvcreate -- INFO: using default snapshot chunk size of 64 KB for "/dev/vg=
/backup"
> lvcreate -- doing automatic backup of "vg"
> lvcreate -- logical volume "/dev/vg/backup" successfully created
>=20
> mount: block device /dev/vg/backup is write-protected, mounting read-only
> lvcreate
> lvcreate -- doing automatic backup of "backup"
> lvcreate -- logical volume "/dev/backup/home" successfully created
>=20
> [*** these are normal files and are indeed readable in the normal /home *=
**]
>=20
> cp: `/mnt/backup/vegard/Mail/irc/ircd-users/356' has unknown file type
> cp: `/mnt/backup/vegard/Mail/cups/343' has unknown file type
> cp: `/mnt/backup/vegard/Mail/cups/344' has unknown file type
> cp: `/mnt/backup/vegard/Mail/cups/346' has unknown file type
>=20
> [ *** some debug *** ]
> This works:
> middagspynten:/home/vegard/Mail/irc/ircd-users# cat 356
>=20
> This is quite strange:
> middagspynten:/mnt/backup/vegard/Mail/irc/ircd-users# ls -l 356
> ?--sr-srw-  15370 1734492719 1868774980 4482544195540565054 Feb 17  2003 =
356
> middagspynten:/mnt/backup/vegard/Mail/irc/ircd-users# cat 356
> cat: 356: Invalid argument
>=20
> [ *** End debug, continue log *** ]
>=20
> cp: cannot stat `/mnt/backup/vegard/Mail/unix/openldap-general/314': Inpu=
t/output error
> cp: cannot stat `/mnt/backup/vegard/Mail/unix/openldap-general/315': Inpu=
t/output error
> cp: cannot stat `/mnt/backup/vegard/Mail/unix/openldap-general/316': Inpu=
t/output error
> cp: cannot stat `/mnt/backup/vegard/Mail/unix/openldap-general/317': Inpu=
t/output error
>=20
> [ *** This is another strangeness *** ]
> middagspynten:/mnt/backup/vegard/Mail/unix/openldap-general# ls -l
> .....
> -rw-------    1 vegard   vegard       3454 Dec 11  1999 309
> -rw-------    1 vegard   vegard       4530 Sep  9  1999 31
> -rw-------    1 vegard   vegard       4147 Dec 11  1999 310
> -rw-------    1 vegard   vegard       3294 Dec 11  1999 311
> -rw-------    1 vegard   vegard       3452 Dec 11  1999 312
> -rw-------    1 vegard   vegard       5775 Dec 13  1999 313
> -rw-------    1 vegard   vegard       3292 Dec 22  1999 318
> -rw-------    1 vegard   vegard       4318 Dec 22  1999 319
> -rw-------    1 vegard   vegard       4384 Sep 11  1999 32
> .....
> middagspynten:/mnt/backup/vegard/Mail/unix/openldap-general# cat 314
> 314: Input/output error
>=20
> This works:
> middagspynten:/mnt/backup/vegard/Mail/unix/openldap-general# cat 318
>=20
> [ *** These are the same as the first one *** ]
> cp: `/mnt/backup/vegard/Mail/inbox/234' has unknown file type
> cp: `/mnt/backup/vegard/Mail/inbox/235' has unknown file type
> cp: `/mnt/backup/vegard/Mail/inbox/236' has unknown file type
> cp: `/mnt/backup/vegard/Mail/inbox/237' has unknown file type
>=20
> [ *** This *is* actually an error in my .procmailrc and the name of the
> directory ;-) - the \255 is actually an \xad, though, so it's not an \255.
> But, apart from that, it's exactly like the second case *** ]
>=20
> cp: cannot stat `/mnt/backup/vegard/Mail/linux/tecra\255linux/233': Input=
/output error
> cp: cannot stat `/mnt/backup/vegard/Mail/linux/tecra\255linux/234': Input=
/output error
> cp: cannot stat `/mnt/backup/vegard/Mail/linux/tecra\255linux/235': Input=
/output error
> cp: cannot stat `/mnt/backup/vegard/Mail/linux/tecra\255linux/236': Input=
/output error
>=20
> [ *** This is a third strangeness - and more worrying for me, because this
> time, it *works* in the snapshot volume, but gets corrupted on the copy *=
** ]
>=20
> cp: cannot create regular file `/mnt/bhome/vegard/Mail/linux/linux-net/35=
7': No such device or address
> cp: cannot create regular file `/mnt/bhome/vegard/Mail/linux/linux-net/35=
8': No such device or address
> cp: cannot create regular file `/mnt/bhome/vegard/Mail/linux/linux-net/35=
9': No such device or address
> cp: cannot create regular file `/mnt/bhome/vegard/Mail/linux/linux-net/36=
0': No such device or address
>=20
> [ **** Debugging on the above problem **** ]
> middagspynten:/mnt/backup/vegard/Mail/linux/linux-net# ls -l 359
> -rw-------    1 vegard   vegard       5351 Dec  6  1999 359
>=20
> This file is also cat'able.
>=20
> But:
> middagspynten:/mnt/bhome/vegard/Mail/linux/linux-net# ls -l 359
> s-wx------    1 3233857728 3233857728        0 May 17  1936 359
> middagspynten:/mnt/bhome/vegard/Mail/linux/linux-net# cat 359
> cat: 359: No such device or address
>=20
> [ *** Here, I don't know what happened. Thie is a workable file on /mnt/b=
ackup,
> but in /mnt/bhome it turns into a directory, which it later tries to
> overwrite *** ]
> cp: cannot overwrite directory `/mnt/bhome/vegard/Mail/linux/linux-usb/11=
1' with non-directory
>=20
> [ *** The rest is cases described before *** ]
>=20
>=20
> This is looks like pretty serious bugs to me. This seemed only to happen =
down
> in my MH-directories. For those who doesn't know, MH is a mailfolder syst=
em
> which stores each mail in one file, which it names according to the messa=
ge
> number in the folder. However, the MH-directory compromises quite a lot of
> my home-directory, too, I think I counted it to ~ 80.000 files, last I co=
unted.
> Statistically, it's still strange that it shouldn't happen in the rest of
> my /home partition, as the rest isn't exactly insignificant either. So I
> *think* it must be somehow related to MH or how MH folders look like. Per=
haps
> something with the size of directories, or the number of levels in the
> directory hierarchy. But this is only guesswork.
>=20
> It does, however, seem to work on the real /home, I've not yet discovered=
 any
> errors here.
>=20
> - Vegard
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-379-3951
1313 5th St SE, Suite 111              Fax:    612-379-3952
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
Error: Keyboard not attached. Press F1 to continue.
-----End Obligatory Humorous Quote------------------------------------------

--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE63Rr3pE6/iGtdjLERAnCwAKCTW3QOuiQs4j6swmKZiL9rgcLGvQCcDWfj
RRL6x22ku0drBT+9TFtvie8=
=arkn
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--
