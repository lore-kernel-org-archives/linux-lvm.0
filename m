From: Tracy R Reed <treed@ultraviolet.org>
Message-ID: <20030419192108.A18402@ultraviolet.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline
Subject: [linux-lvm] pvcreate problem on new IDE disk
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
Date: Sun Apr 20 17:43:06 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I just installed a new 120G IDE disk. My system currently has two 32G SCSI
disks. I intend to migrate the data off of the SCSI disks on to the IDE
disk.

My version info:

Linux home 2.4.19 #7 SMP Sat Apr 19 18:04:41 PDT 2003 i686 unknown unknown
GNU/Linux

home:~# pvcreate --version
  LVM version:     1.95.10 (2002-05-31)
  Library version: 0.96.04-ioctl-cvs (2002-08-14)
  Driver version:  1.0.8

The drive is a 120G Maxtor IDE drive. I have a 1G partition (which I will
eventually reinstall the OS onto) and a ~120G partition which I want to
initialize as a physical volume, add it to a new volume group, create some
LV's, and then copy the data from my existing disks into it.=20

   Device Boot    Start       End    Blocks   Id  System
/dev/hdd1             1      4064   2048224+  83  Linux
/dev/hdd2          4065    238216 118012608   8e  Linux LVM


But when I do the pvcreate I get this error:

home:~# pvcreate /dev/hdd2
  Failed to read existing physical volume '/dev/hdd2'
  /dev/hdd2: Couldn't find device.
  Failed to setup physical volume "/dev/hdd2"

Googling on "Failed to read existing physical volume"  produces zero hits.
Nothing at all. Any ideas?

--=20
Tracy Reed      http://www.ultraviolet.org

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj6iBBQACgkQ9PIYKZYVAq1KGQCffrd3LF811kgpl1Zf6+QVfn61
VdMAoIZZ0W+cmrXsvXu7jYqWD4xWNdtB
=rr2p
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
