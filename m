Subject: Re: [linux-lvm] error mounting snapshot of ext3 filesystem
From: Aran Cox <acox@ia.primustel.com>
In-Reply-To: <E16TOej-0001qC-00@arwen.dev33.cvf>
References: <1011729567.6638.40.camel@benway.cv.telegroup.com>
    <E16TOej-0001qC-00@arwen.dev33.cvf>
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="=-0RyFFCajHJhCSXWbCJRl"
Message-Id: <1011803439.3357.5.camel@benway.cv.telegroup.com>
MIME-Version: 1.0
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
Date: Wed Jan 23 10:31:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-0RyFFCajHJhCSXWbCJRl
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Somehow I missed the final release of 1.0.1... I was trying to use the
patch from 101rc4, for kernel 2.4.9.  I've been using the 101rc4 and
earlier versions for a while now, and frankly the LVM system is superb.
I have one server with LVM 0.9.1_beta7 which has been running for 210
days now.  Thanks for the work on this... now if only the installers for
popular distros would allow you to set up LVM at install time...=20

Thanks,
Aran

On Wed, 2002-01-23 at 08:45, Pierrick PONS wrote:
> > Ok, I know that several discussions regarding snapshots have occurred i=
n
> > the last month or two and I've tried to read every post from those
> > threads.  Nothing I read has helped me solve my problem.
> >=20
> > Essentially, I can create a snapshot LV but I cannot mount it.
> >=20
> > I have compiled 2.4.17 with the lvm101-rc4 patch created from the sourc=
e
> > archive.  (I specified -with-kernel_dir appropriately.)  I tried to
> > apply to apply the VFS-lock patch but the kernel would not compile afte=
r
> > having done so.  (I wasn't sure if I needed this patch or not, but I
> > tried applying it anyway.)  It fails like so:
> >=20
> >=20
> > make[2]: Entering directory `/home/spin/src/linux/fs'
> > gcc -D__KERNEL__ -I/home/spin/src/linux/include -Wall
> > -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer
> > -fno-strict-aliasing -fno-common -pipe -mpreferred-stack-boundary=3D2
> > -march=3Di686    -c -o super.o super.c
> > super.c: In function `unlockfs':
> > super.c:403: `mount_sem' undeclared (first use in this function)
> > super.c:403: (Each undeclared identifier is reported only once
> > super.c:403: for each function it appears in.)
> > make[2]: *** [super.o] Error 1
> >=20
> >=20
> > Anyway, continuing without VFS lock:
> > I have three disks, an IDE disk /dev/hda, and two small SCSI disk,
> > /dev/sda and /dev/sdb and one VG with /dev/hda4, and the entirety of
> > both SCSI disks in it which is called main.=20
> >=20
> > /boot 	/dev/hda3
> > / 	/dev/main/root  (entirely on hda4)
> > /var	/dev/main/var	(entirely on hda4)
> > /tmp	/dev/main/scratch (on both sda and sdb)
> > /home	/dev/main/home  (spread out across all three PVs)
> >=20
> > There are some PVs left on sdb, otherwise it's all used.
> > All of the filesystems are ext3, except /boot which is ext2.
> >=20
> > This is basically the sequence of events:
> >=20
> > [root@benway /]# lvcreate -s -n snaptest -L 200m /dev/main/root=20
> > lvcreate -- WARNING: the snapshot will be automatically disabled once i=
t
> > gets full
> > lvcreate -- INFO: using default snapshot chunk size of 64.00 KB for
> > "/dev/main/snaptest"
> > lvcreate -- doing automatic backup of "main"
> > lvcreate -- logical volume "/dev/main/snaptest" successfully created
> >=20
> > [root@benway /]# mount /dev/main/snaptest /mnt
> > mount: block device /dev/main/snaptest is write-protected, mounting
> > read-only
> > mount: wrong fs type, bad option, bad superblock on /dev/main/snaptest,
> >        or too many mounted file systems
> >=20
> > Trying to mount it as ext2 doesn't change anything.  No matter which LV
> > I create the snapshot of, I cannot mount it and it fails with the same
> > error. =20
> >=20
> > Even if I create a small LV with ext3 filesystem entirely on sdb, and
> > then create a snapshot of it, it still won't mount.  I can get this
> > small-all-on-one LV/FS scenario to work if I create an ext2 fs on the
> > LV. =20
> >=20
> > I know this is nearly exactly like the problems discussed in previous
> > threads but I haven't seen a solution yet that seems like it applied to
> > my situation. =20
> >=20
> > Thanks,
> > Aran
> >  =20
> >=20
> >=20
>=20
> I do have the same problem :
>=20
> mount /dev/testlvm/snap /mnt/snap=20
> mount: block device /dev/testlvm/snap is write-protected, mounting read-o=
nly
> mount: wrong fs type, bad option, bad superblock on /dev/testlvm/snap,
>        or too many mounted file systems
>=20
> I tried with -text2 or -text3 option and it's the same.=20
> What is the type wanted  ?
>=20
> Is there a more documentated snapshot section where to found some more=20
> explanation ?
>=20
> Thanks in advance.
>=20
>=20
> Pierrick
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html


--=-0RyFFCajHJhCSXWbCJRl
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA8TuUu6xBZrNGNWdIRAra4AKDKLn5T5w6JQRoHHOvnl4jrEvyNTgCgufFU
2Vfu+xtP3pnw+KHR66jYd2E=
=P0G1
-----END PGP SIGNATURE-----

--=-0RyFFCajHJhCSXWbCJRl--
