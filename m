From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re: [linux-lvm] crash
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20021007155810.YTFM13631.imf18bis.bellsouth.net@Mother2>
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
Date: Mon Oct  7 11:26:55 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

I had a very similar problem a week ago.

I first used dd to verify that my underlying physical disks were in good shape. =
 i.e. No hardware issues.

Then I used dd to veryify the raid units were functional.

In my case both were fine.

I still had errors exactly like yours below.

I'm not in front of my Linux box but I think I used vgcfgrestore or something =
like that to restore the VG metadata.

After doing the restore, and in my case deleting a snapshot LV I had, =
everything was fine.

HTH
Greg Freemyer
 >>  hi!

 >>  i have some problem with lvm, after a crash, my raid controller has gone,=20
 >>  and i cant access my vg and lv -s..
 >>  now:
 >>  ~# pvscan
 >>  pvscan -- reading all physical volumes (this may take a while...)
 >>  pvscan -- inactive PV "/dev/hdm1"  is associated to unknown VG "apolloftp"
 >> =20
 >>  (run vgscan)
 >>  pvscan -- inactive PV "/dev/hdi1"  is associated to unknown VG "apolloftp"
 >> =20
 >>  (run vgscan)
 >>  pvscan -- inactive PV "/dev/hdj1"  is associated to unknown VG "apolloftp"
 >> =20
 >>  (run vgscan)
 >>  pvscan -- inactive PV "/dev/hdg1"  is associated to unknown VG "apolloftp"
 >> =20
 >>  (run vgscan)
 >>  pvscan -- inactive PV "/dev/hdh1"  is associated to unknown VG "apolloftp"
 >> =20
 >>  (run vgscan)
 >>  pvscan -- inactive PV "/dev/hdc1"  is associated to unknown VG "apolloftp"
 >> =20
 >>  (run vgscan)
 >>  pvscan -- inactive PV "/dev/hdd1"  is associated to unknown VG "apolloftp"
 >> =20
 >>  (run vgscan)
 >>  pvscan -- inactive PV "/dev/hda4"  is associated to unknown VG "apolloftp"
 >> =20
 >>  (run vgscan)
 >>  pvscan -- inactive PV "/dev/hdb1"  is associated to unknown VG "apolloftp"
 >> =20
 >>  (run vgscan)
 >>  pvscan -- total: 9 [545.98 GB] / in use: 9 [545.98 GB] / in no VG: 0 [0]

 >>  lvscan:
 >>  ~# lvscan
 >>  lvscan -- no volume groups found

 >>  ~# vgscan
 >>  vgscan -- reading all physical volumes (this may take a while...)
 >>  vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of=20
 >>  volume group "apolloftp" from physical volume(s)
 >>  vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
 >>  vgscan -- WARNING: This program does not do a VGDA backup of your volume=20
 >>  group


 >>  1, if i cant replace my the raid controloler, then how can i save my=20
 >>  datas?

 >>  2, if i can replace it, then it will be okay? vgscan and lvscan will work?

 >>  3, if the winchesters has gone, then what should i do? :)

 >>  there was 12 winchester in lvm..

 >>  please help

 >>  NagyZ



 >>  _______________________________________________
 >>  linux-lvm mailing list
 >>  linux-lvm@sistina.com
 >>  http://lists.sistina.com/mailman/listinfo/linux-lvm
 >>  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
