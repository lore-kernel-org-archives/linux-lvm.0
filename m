Subject: Re: [linux-lvm] Instability with 2.6, recovering (meta)data?
Message-ID: <20031110175529.GA1844@amphibian.dyndns.org>
References: <20031109213821.GA4425@amphibian.dyndns.org> <20031110174615.GE20777@amphibian.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline
In-Reply-To: <20031110174615.GE20777@amphibian.dyndns.org>
From: Toad <toad@amphibian.dyndns.org>
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
Date: Mon Nov 10 12:41:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com
Cc: agk@sistina.com

--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This is 100% reproducible on my current system.
root@amphibian:~# lvremove /dev/vg-big/slowtemp
Do you really want to remove active logical volume "slowtemp"? [y/n]: y
  Logical volume "slowtemp" successfully removed
root@amphibian:~# vgdisplay -v
    Finding all volume groups
    Finding volume group "vg-big"
  invalid lv in extent map
  Couldn't fill logical volume maps.
  Volume group "vg-big" doesn't exist

root@amphibian:~# vgcfgrestore vg-big -M1 -f /etc/lvm/archive/vg-big_00003.=
vg
  Restored volume group vg-big
root@amphibian:~# vgdisplay
[ worked perfectly ]

After restoring the old metadata, /dev/vg-big/slowtemp still doesn't
exist, but when I reboot, it comes back.

If there is anything within reason I can do to assist your debugging of
this otherwise excellent software please contact me.

On Mon, Nov 10, 2003 at 05:46:15PM +0000, toad wrote:
> With agk's help, I eventually found that this worked:
> vgcfgrestore vg-big -M1 -f /etc/lvm/archive/vg-big_00003.vg
>=20
> However, the LV that I deleted that originally caused the problem,
> /dev/vg-big/slowtemp (~ 10GB), doesn't exist, and yet it's space usage=20
> appears to still be used:
> root@amphibian:~# vgdisplay
> ...
> VG Size               212.81 GB
> PE Size               32.00 MB
> Total PE              6810
> Alloc PE / Size       6704 / 209.50 GB
> Free  PE / Size       106 / 3.31 GB
>=20
> As I was originally trying to free up enough space to vgmove off one of
> the disks, in order to replace it and then vgmove off another of the
> disks (IDE madness...), this is still a problem.
>=20
> On Sun, Nov 09, 2003 at 09:38:21PM +0000, Toad wrote:
> > Each time I have deleted an LV on LVM2 on 2.6, it has corrupted my
> > metadata. Last time I did a vgcfgrestore on 2.4 and it worked, however I
> > have recently been bitten by some sort of incompatibility bug and my LVM
> > now only works on 2.6 (it might work on a 2.4+devmapper kernel, I'll
> > look into that). Here is what happens when I try to get my metadata
> > back:
> > root@amphibian:/usr/src/linux# vgdisplay -d -v
> >     Finding all volume groups
> >     Finding volume group "vg-big"
> >   invalid lv in extent map
> >   Couldn't fill logical volume maps.
> >   Volume group "vg-big" doesn't exist
> > root@amphibian:/usr/src/linux# pvscan -d -v
> >     Wiping cache of LVM-capable devices
> >     Wiping internal cache
> >     Walking through all physical volumes
> >   invalid lv in extent map
> >   Couldn't fill logical volume maps.
> >   No matching physical volumes found
> > root@amphibian:/usr/src/linux# vgcfgrestore -v -d vg-big
> >   PV /dev/hda is a different format (lvm1)
> >   Restore failed.
> >=20
> > That last one is particularly perverse; I was always told that LVM1 and
> > LVM2 are compatible. Of course later I discovered this not to be the
> > case; after some operation or other (creating an LV? resizing one?) on
> > LVM on 2.6, I could no longer access my LVs under 2.4/LVM1.
> >=20
> > Any help?
> > --=20
> > Matthew J Toseland - toad@amphibian.dyndns.org
> > Freenet Project Official Codemonkey - http://freenetproject.org/
> > ICTHUS - Nothing is impossible. Our Boss says so.
>=20
>=20
>=20
> --=20
> Matthew J Toseland - toad@amphibian.dyndns.org
> Freenet Project Official Codemonkey - http://freenetproject.org/
> ICTHUS - Nothing is impossible. Our Boss says so.

--=20
Matthew J Toseland - toad@amphibian.dyndns.org
Freenet Project Official Codemonkey - http://freenetproject.org/
ICTHUS - Nothing is impossible. Our Boss says so.

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/r9ERr5e+zmpNTm8RAtdqAJwLvr403mxLQGPTSBUvDIIF1rMuXQCfZcT0
HD4nHbymZilSAcbBihkVXWY=
=3bXg
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
