Message-ID: <XFMail.20020821200341.cfreeze@alumni.clemson.edu>
MIME-Version: 1.0
Content-Type: multipart/signed;
 boundary="_=XFMail.1.5.3.Linux:20020821200341:10266=_";
 micalg=pgp-md5; protocol="application/pgp-signature"
From: Chris Freeze <cfreeze@alumni.clemson.edu>
Subject: [linux-lvm] vg_read_with_pv_and_lv error
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
Date: Wed Aug 21 20:04:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This message is in MIME format
--_=XFMail.1.5.3.Linux:20020821200341:10266=_
Content-Type: text/plain; charset=us-ascii

I've come across a problem with my lvm drive(s).  When I try to mount it, I get
/dev/diskvg/share does not exist.  Running pvscan I get,

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdg1"  is associated to unknown VG "diskvg" (run
vgscan)
pvscan -- inactive PV "/dev/hdg2"  is associated to unknown VG "diskvg" (run
vgscan)
pvscan -- inactive PV "/dev/hdg3"  is associated to unknown VG "diskvg" (run
vgscan)
pvscan -- inactive PV "/dev/hdh1"  is associated to unknown VG "diskvg" (run
vgscan)
pvscan -- inactive PV "/dev/hdh2"  is associated to unknown VG "diskvg" (run
vgscan)
pvscan -- inactive PV "/dev/hdh3"  is associated to unknown VG "diskvg" (run
vgscan)
pvscan -- inactive PV "/dev/hdh4"  is associated to unknown VG "diskvg" (run
vgscan)
pvscan -- inactive PV "/dev/hde1"  is associated to unknown VG "diskvg" (run
vgscan)
pvscan -- inactive PV "/dev/hde2"  is associated to unknown VG "diskvg" (run
vgscan)
pvscan -- inactive PV "/dev/hde3"  is associated to unknown VG "diskvg" (run
vgscan)
pvscan -- inactive PV "/dev/hdf1" is in no VG  [19.53 GB]
pvscan -- inactive PV "/dev/hdf2" is in no VG  [18.82 GB]
pvscan -- total: 12 [267.09 GB] / in use: 10 [228.74 GB] / in no VG: 2 [38.35
GB]

which is correct (other than having an unknown vg), and when I run vgscan I
get, 

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- only found 33727 of 33556 LEs for LV /dev/diskvg/share (0)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data
of volume group "diskvg" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

vgcfgrestore -n diskvg -b 1 /dev/hdg1

but running pvdata /dev/hdg1 I still get

--- Physical volume ---
PV Name               /dev/hdg1
VG Name               diskvg
PV Size               19.53 GB [40960017 secs] / NOT usable 4.19 MB [LVM: 147
KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              4998
Free PE               0
Allocated PE          4998
PV UUID               DKfGe0-VsMw-zeK1-5tJn-f7Nb-Uv6u-j93KLp

--- Volume group ---
VG Name
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                7
Act PV                7
VG Size               131.75 GB
PE Size               4 MB
Total PE              33727
Alloc PE / Size       33556 / 131.08 GB
Free  PE / Size       171 / 684 MB
VG UUID               t36afg-UyqZ-HqLo-9SHT-TfYe-1yNg-hQxfRv


Is there any hope of restoring the data?




-- 
Regards,

Chris

Better to light one candle than to curse the darkness.
                -- motto of the Christopher Society

-----
Chris Freeze           Email: cfreeze@alumni.clemson.edu
                         Web: http://www.cfreeze.com 


--_=XFMail.1.5.3.Linux:20020821200341:10266=_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE9ZDhspYf63jYRQj8RAlOYAKCpShMOQUzu0g8ruj9+Pu8xzs8GzACgr4P1
SYoXETzSv+RaGDn9OFg2xEM=
=UExk
-----END PGP SIGNATURE-----

--_=XFMail.1.5.3.Linux:20020821200341:10266=_--
End of MIME message
