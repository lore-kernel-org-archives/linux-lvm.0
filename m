Return-Path: <eli@zendo.net>
Date: Tue, 10 Jul 2001 09:39:02 -0500
From: Eli Criffield <lvm@zendo.net>
Message-ID: <20010710093902.B30416@zendo.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
Content-Disposition: inline
Subject: [linux-lvm] vg gone after vgextend
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

--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello

I had LVM up and working great, even on the / filesystem. I had a
/dev/hda1 that was a 4 gig filesystem that i tared my distribution to and
/dev/hda2 that use to be my / filesystem and /dev/hda3 that was my volume
group. I resized /dev/hda1 down to around 30 megs and made /dev/hda2
4+gig. I made /dev/hda1 /boot and had a initrd to turn on LVM and boot to
the / filesystem on /dev/rootvg/root_lv. That all worked fine.

Until i added /dev/hda2 (now about 4gig) to the volumegroup rootvg. All
looked ok when i went to reboot. On the reboot it died in the ramdisk when
it ran vgscan.
"vgscan -- no volume groups found"

I was then stuck with a none bootable machine. I'll save you the long
story about the trouble i had making some kind of rescue disk, but i
finally got one to work off a cd i had a friend burn for me.

Now when i run pvscan i get=20
"pvscan -- inactive PV "/dev/hda3" is associated to an unknown VG (run
vgscan)
pvscan -- total: 14.4GB / in use 1 [14.4GB] / in no VG 0 [0]"

it doesn't see /dev/hda2 that i added to the vg right before reboot, but
thats not a problem because there was nothing on it yet anyway.

pvscan -vv gives

-- Physical volume ---
PV Name		/dev/hda3
VG Name		rootvg
PV Size		14.4 GB / NOT usable 3.48 MB [LVM: 135KB]
PV#		1
PV Status	available
Allocatable	yes
CurLV		6
P ESize (KByte)	4096
Total PE	3685
Free PE		1261
Allocated PE	2424
PV UUID		elhLo-Mw5J-8qaE-gN2D-zEYo-Woqh-qH7H5a
System Id	eli.custom-edge.com993738446


from what i can tell from the archives to do a vgcfgrestore is the next
logical thing but it doesn't work for me

vgcfgrestore -n rootvg /dev/hda3
vgcfgrestore -- "/etc/lvmconf/rootvg.conf" doesn't exist
vgcfgrestore -- a backup for volume group rootvg is not available

which makes since because i booted off a rescue disk in a ram disk.

vgscan still gives
vgscan -- no volume groups found

i did find this answer in the archives for a similar problem:

> You need to edit the disk signatures and for each PV, insert all the
> _other_ PV signatures in the right place.

but no explanation on how to do that?

Is that what i should be doing? If so how do i do that? If not what can i
do to save this box?

thanks a ton it will save a lot of hassle if i don't have to reinstall.

eli

--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7SxOFm2VvYlVjW2oRAsEiAJ9S7s/v1JTZDJWFALqFVoLV1A6m8gCePppn
xwvZzr7fjGHwsOOUB6C84kw=
=Rato
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--
