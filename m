From: Mike Williams <mike@gaima.co.uk>
Subject: Re: [linux-lvm] LVM and RAID
References: <21E8E34076807C41A646FDC666B15BDF08769D@minna.combox.de>
In-Reply-To: <21E8E34076807C41A646FDC666B15BDF08769D@minna.combox.de>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Message-Id: <200311041205.38462.mike@gaima.co.uk>
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
Date: Tue Nov  4 06:06:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@sistina.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tuesday 04 November 2003 11:49, Tobias Gablunsky wrote:
> Hi all!
>=20
> I didn't find clear information about how to use LVM on an (Software)
> RAID-Mirror (or RAID-5). All I found, were problems: LVM uses Partition
> Type=0D 0x8E but Linux Soft-RAID uses 0xFD - this dosn't look very
> compatible... A solution would be to use Hardware-RAID of course. But I'm
> wondering if there is a way to use Software-RAID and LVM together - I
> cannot believe that I am the first one with this question! Am I?

I just created the software raid, and pointed pvcreate at it.
Works like a charm.

=2D --=20
Mike Williams
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/p5YSInuLMrk7bIwRAk+dAJ42yw0wUImTk3N5dqOfqDa/63ay/gCfWxl5
vgvk4alAJdy68DRVD2U/cGg=3D
=3DkGxr
=2D----END PGP SIGNATURE-----
