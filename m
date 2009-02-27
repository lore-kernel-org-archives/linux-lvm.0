Subject: Re: [linux-lvm] vgchange doesn't enable found VGs
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <49A814EA.3090902@redhat.com>
References: <1235748997.1193.15.camel@pc.interlinx.bc.ca>
	<49A814EA.3090902@redhat.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-A3h3spNesU6kN4bpxvcX"
Date: Fri, 27 Feb 2009 11:38:25 -0500
Message-Id: <1235752705.1193.32.camel@pc.interlinx.bc.ca>
Mime-Version: 1.0
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
To: bmr@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>


--=-A3h3spNesU6kN4bpxvcX
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2009-02-27 at 16:29 +0000, Bryn M. Reeves wrote:
>=20
> It's difficult to say from the output above. Try running the tools
> with "-vvv" and looking at the detailed output. They'll produce a lot
> of output when run this way

Not so much in fact.

> Why do you need the --ignorelockingfailure?

Because this is being done during system boot.

Here's "vgchange -v -v -v -a n" output:

        Processing: vgchange -v -v -v -a n
        O_DIRECT will be used
      Setting global/locking_type to 1
      File-based locking selected.
      Setting global/locking_dir to /var/lock/lvm
    Finding all volume groups
        /dev/ramdisk: Not using O_DIRECT
        Opened /dev/ramdisk RO
        /dev/ramdisk: block size is 4096 bytes
      /dev/ramdisk: No label detected
        Closed /dev/ramdisk
        /dev/ram: Not using O_DIRECT
        Opened /dev/ram RO
        /dev/ram: block size is 4096 bytes
      /dev/ram: No label detected
        Closed /dev/ram
        /dev/ram2: Not using O_DIRECT
        Opened /dev/ram2 RO
        /dev/ram2: block size is 4096 bytes
      /dev/ram2: No label detected
        Closed /dev/ram2
...
        /dev/ram14: Not using O_DIRECT
        Opened /dev/ram14 RO
        /dev/ram14: block size is 4096 bytes
      /dev/ram14: No label detected
        Closed /dev/ram14
        /dev/ram15: Not using O_DIRECT
        Opened /dev/ram15 RO
        /dev/ram15: block size is 4096 bytes
      /dev/ram15: No label detected
        Closed /dev/ram15
  No volume groups found

The eclipses represents ram3, ram4, ram5, to ram 13.

When I specify the volume group, I see this:

         Processing: vgchange -v -v -v -a n lustre
        O_DIRECT will be used
      Setting global/locking_type to 1
      File-based locking selected.
      Setting global/locking_dir to /var/lock/lvm
    Using volume group(s) on command line
      Locking /var/lock/lvm/V_lustre RB
    Finding volume group "lustre"
        /dev/ramdisk: Not using O_DIRECT
        Opened /dev/ramdisk RO
        /dev/ramdisk: block size is 4096 bytes
      /dev/ramdisk: No label detected
        Closed /dev/ramdisk
        /dev/ram: Not using O_DIRECT
        Opened /dev/ram RO
        /dev/ram: block size is 4096 bytes
      /dev/ram: No label detected
        Closed /dev/ram
        /dev/ram2: Not using O_DIRECT
        Opened /dev/ram2 RO
        /dev/ram2: block size is 4096 bytes
      /dev/ram2: No label detected
        Closed /dev/ram2
...
    Wiping cache of LVM-capable devices
        /dev/console: Not a block device
        /dev/core: Not a block device
        /dev/evtchn: Not a block device
        /dev/fd: Symbolic link to directory
...

and it considers a whole boatload more devices, including /dev/sda,
where my volume groups is.  Now the one thing that just occurred to me
as relevant is that my root filesystem (/) is read-only.

b.


--=-A3h3spNesU6kN4bpxvcX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkmoFv8ACgkQl3EQlGLyuXCZvQCffHiHnKyhvwGS1XcSlGAn+vIb
vlUAoPBcYL+KQNpGPm5E4SxTPnPkyXvH
=onrb
-----END PGP SIGNATURE-----

--=-A3h3spNesU6kN4bpxvcX--
