From: Mike Williams <mike@gaima.co.uk>
Subject: Re: [linux-lvm] RAID 1 on Device Mapper - best practices?
References: <16272.19483.577313.115811@gargle.gargle.HOWL>
In-Reply-To: <16272.19483.577313.115811@gargle.gargle.HOWL>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Message-Id: <200310172128.10259.mike@gaima.co.uk>
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
Date: Fri Oct 17 15:29:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@sistina.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Friday 17 October 2003 21:07, John Stoffel wrote:

> Anyway, what I'd like to do is setup the disks using Device Mapper so
> that I can grow and shrink volumes at need, along with the filesystems
> mounted on top of those volumes.  So I now have it working, except
> that reboots don't detect the RAID volumes on top of the Device Mapper
> LVs properly on reboot.

> Nor do I think I'm really doing this in the proper way.  Currently I
> have one volume group per disk, left_vg and right_vg.  Each has a pair
> of LVs on then, [left,right]_lv_[home,local] for a total of four LVs.
>
> Then I assemble these into MD volumes using mdadm, with each volume
> having an LV from each of the VGs.
>
> Do I really need to use MD here, or can I build a mirrored LV to do
> what I want?

Wouldn't it be more sensible to mirror the disks, then stick your LVs on to=
p=20
of that? This is what I have done with a software RAID5 array.

At first this didn't work, as the startup scripts Gentoo provide initialise=
=20
LVM before MD, but that was easily changed.

=2D --=20
Mike Williams
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/kFDaInuLMrk7bIwRAlVKAKCL7QcheuL6uw7vgX9y2+bT6FA/AQCgjAZZ
Koz9o0FWAHHzz6gSfFBBMF0=3D
=3DvntA
=2D----END PGP SIGNATURE-----
