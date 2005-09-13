Date: Tue, 13 Sep 2005 09:58:59 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] Resizing the root LVM partition
Message-ID: <20050913145858.GO11956@null.msp.redhat.com>
References: <cd21de0e05091214103bfe89ac@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6yHiY5vv/BiPjcMt"
Content-Disposition: inline
In-Reply-To: <cd21de0e05091214103bfe89ac@mail.gmail.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: jonathan@awaken.com, LVM general discussion and development <linux-lvm@redhat.com>


--6yHiY5vv/BiPjcMt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 12, 2005 at 02:10:20PM -0700, Jonathan Morace wrote:
> I'm having a problem adding disks to my root partition, which is using
> LVM.  The quick summary is that I think I need to run resize2fs on the
> root partition, but I can't figure out how to unmount the root
> partition to do so.
>=20
> The longer version of the story...  I'm running Fedora Core 2, and
> when I installed I had the root partition configured to be on two
> disks using LVM.  I added two more disks to the computer and followed
> the howto to initialize the disks, add the physical volumes to the
> volume group, and extend the logical volume.  When I run "lvdisplay" I
> see my logical volume is the correct size, but "df" only shows the
> original size.  I'm assuming this is because I haven't done a
> "resize2fs".  The reason I haven't is because I can't figure out how
> to unmount the root filesystem in order to do this.  If I boot with
> linux rescue, I can choose not to mount the filesystems, but then the
> LVM devices don't exist.  I read somewhere that running "lvm vgscan -v
> --mknodes" should do the trick, but as far as I could tell, no devices
> were created.
>=20
> Any ideas on how I can get the root partition resized to include the new =
disks?

Run 'lvm vgchange -ay' after the vgscan command and your devices should be
there.=20
=20
--=20
AJ Lewis                                   Voice:  612-638-0500
Red Hat                                    E-Mail: alewis@redhat.com
One Main Street SE, Suite 209
Minneapolis, MN 55414
  =20
Current GPG fingerprint =3D D9F8 EDCE 4242 855F A03D  9B63 F50C 54A8 578C 8=
715
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...


--6yHiY5vv/BiPjcMt
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDJuky9QxUqFeMhxURAhm9AJ9VQjK16FEFgdAWT3puDqHylKkU6gCgoNlm
sOhJvxlqlDF4OQoixqqfqg8=
=cuPT
-----END PGP SIGNATURE-----

--6yHiY5vv/BiPjcMt--
