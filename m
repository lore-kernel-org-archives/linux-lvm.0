Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m13IFdGI003403
	for <linux-lvm@redhat.com>; Sun, 3 Feb 2008 13:15:39 -0500
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.186])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m13IF5gR016670
	for <linux-lvm@redhat.com>; Sun, 3 Feb 2008 13:15:08 -0500
Subject: Re: [linux-lvm] Incorrect metadata area header checksum
From: Eckhard Kosin <Eckhard.Kosin@online.de>
In-Reply-To: <20080203122106.GD8075@agk.fab.redhat.com>
References: <1202005131.5857.18.camel@localhost.localdomain>
	<47A53FC6.2040007@gmail.com> <20080203122106.GD8075@agk.fab.redhat.com>
Content-Type: multipart/mixed; boundary="=-/Wpluvhl59kvY+xrPprx"
Date: Sun, 03 Feb 2008 19:14:24 +0100
Message-Id: <1202062464.14540.27.camel@localhost.localdomain>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--=-/Wpluvhl59kvY+xrPprx
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Dave, hi Alasdair,

thank you for your quick answer.

Am Sonntag, den 03.02.2008, 12:21 +0000 schrieb Alasdair G Kergon:
> On Sun, Feb 03, 2008 at 02:15:02PM +1000, David Robinson wrote:
> > Eckhard Kosin wrote:
> > >lvm2/dapper uptodate 2.02.02-1ubuntu1.5
>=20
> > >  filter =3D [ "r|/dev/cdrom|", "r|/dev/hda[1,6,7]|" ]
> =20
> > Is there any particular reason your modifying the filter setting?=20
> > Generally you shouldn't need to modify it, except for a few special=20
> > situations.
I exclude hda1 (NTFS), hda6 (old LINUX) and hda7 (/boot), because they
are not under LVM.  Without exclusion by a filter rule scanning of these
devices produce the "Incorrect metadata area header checksum" message.

> =20
> Indeed, that line is of course wrong if you now *intend* to use hda10!
> ('$' missing.)
Indeed, I should have read the documentation included in lvm.conf,
sorry.=20

I just changed the filter rule to
 =20
  filter =3D [ "r|/dev/cdrom|", "r|^/dev/hda[1,6,7]$|" ]

Now, hda10 will be found, but I get the "Incorrect metadata area header
checksum" complain from the scanning of hda7:  A citation from the
output of "vgdisplay -vvv":

...
        Opened /dev/hda7 RO O_DIRECT
        /dev/hda7: block size is 1024 bytes
      /dev/hda7: lvm2 label detected
        Closed /dev/hda7
        lvmcache: /dev/hda7 now orphaned
        Opened /dev/hda7 RO O_DIRECT
        /dev/hda7: block size is 1024 bytes
  Incorrect metadata area header checksum
        Closed /dev/hda7
        Opened /dev/vg_uhu00/var_cache_rsnapshot RO O_DIRECT

...

        Opened /dev/evms/hda7 RO O_DIRECT
        /dev/evms/hda7: block size is 512 bytes
      /dev/evms/hda7: lvm2 label detected
        Closed /dev/evms/hda7
      Duplicate PV EWhly9hF5TcIV1KyHfXVUQDBe7S1uf14 on /dev/hda7 - using
dm /dev/evms/hda7
        Opened /dev/evms/hda7 RO O_DIRECT
        /dev/evms/hda7: block size is 512 bytes
  Incorrect metadata area header checksum
        Closed /dev/evms/hda7
...


I append the complete output of "vgdisplay -vvv".

Why hda7 is scanned in spite of the filter rule?  And what's
about /dev/evms/hda7 ?  I have to exclude it by its own filter rule?

       Thank you

         Ecki


>=20
> (And upgrade 2.02.02 to something more recent.)
>=20
> Alasdair
--=20
  Eckhard Kosin
  Kaspar-Kerll-Str. 41
D-81245 M=C3=BCnchen, Germany
  Tel.: (+49)(+89) 88 88 479
  Tel., Fax: (+49)(+89) 835 844
  mailto:Eckhard.Kosin@online.de

--=-/Wpluvhl59kvY+xrPprx
Content-Disposition: attachment; filename=vgdisplay.out
Content-Type: text/plain; name=vgdisplay.out; charset=UTF-8
Content-Transfer-Encoding: 7bit

        Processing: vgdisplay -vvv
        O_DIRECT will be used
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
    Finding all volume groups
        /dev/ram0: Not using O_DIRECT
        Opened /dev/ram0 RO
        /dev/ram0: block size is 1024 bytes
      /dev/ram0: No label detected
        Closed /dev/ram0
        Opened /dev/dm RO O_DIRECT
        /dev/dm: block size is 1024 bytes
      /dev/dm: No label detected
        Closed /dev/dm
        /dev/ram1: Not using O_DIRECT
        Opened /dev/ram1 RO
        /dev/ram1: block size is 1024 bytes
      /dev/ram1: No label detected
        Closed /dev/ram1
        Opened /dev/hda1 RO O_DIRECT
        /dev/hda1: block size is 512 bytes
      /dev/hda1: No label detected
        Closed /dev/hda1
        Opened /dev/vg_uhu00/home RO O_DIRECT
        /dev/vg_uhu00/home: block size is 4096 bytes
      /dev/vg_uhu00/home: No label detected
        Closed /dev/vg_uhu00/home
        /dev/ram2: Not using O_DIRECT
        Opened /dev/ram2 RO
        /dev/ram2: block size is 1024 bytes
      /dev/ram2: No label detected
        Closed /dev/ram2
        Opened /dev/vg_uhu00/usr RO O_DIRECT
        /dev/vg_uhu00/usr: block size is 1024 bytes
      /dev/vg_uhu00/usr: No label detected
        Closed /dev/vg_uhu00/usr
        /dev/ram3: Not using O_DIRECT
        Opened /dev/ram3 RO
        /dev/ram3: block size is 1024 bytes
      /dev/ram3: No label detected
        Closed /dev/ram3
        Opened /dev/vg_uhu00/opt RO O_DIRECT
        /dev/vg_uhu00/opt: block size is 1024 bytes
      /dev/vg_uhu00/opt: No label detected
        Closed /dev/vg_uhu00/opt
        /dev/ram4: Not using O_DIRECT
        Opened /dev/ram4 RO
        /dev/ram4: block size is 1024 bytes
      /dev/ram4: No label detected
        Closed /dev/ram4
        Opened /dev/vg_uhu00/tmp RO O_DIRECT
        /dev/vg_uhu00/tmp: block size is 1024 bytes
      /dev/vg_uhu00/tmp: No label detected
        Closed /dev/vg_uhu00/tmp
        /dev/ram5: Not using O_DIRECT
        Opened /dev/ram5 RO
        /dev/ram5: block size is 1024 bytes
      /dev/ram5: No label detected
        Closed /dev/ram5
        Opened /dev/hda5 RO O_DIRECT
        /dev/hda5: block size is 4096 bytes
      /dev/hda5: No label detected
        Closed /dev/hda5
        Opened /dev/vg_uhu00/var RO O_DIRECT
        /dev/vg_uhu00/var: block size is 1024 bytes
      /dev/vg_uhu00/var: No label detected
        Closed /dev/vg_uhu00/var
        /dev/ram6: Not using O_DIRECT
        Opened /dev/ram6 RO
        /dev/ram6: block size is 1024 bytes
      /dev/ram6: No label detected
        Closed /dev/ram6
        Opened /dev/hda6 RO O_DIRECT
        /dev/hda6: block size is 4096 bytes
      /dev/hda6: No label detected
        Closed /dev/hda6
        Opened /dev/vg_uhu00/usr_local RO O_DIRECT
        /dev/vg_uhu00/usr_local: block size is 1024 bytes
      /dev/vg_uhu00/usr_local: No label detected
        Closed /dev/vg_uhu00/usr_local
        /dev/ram7: Not using O_DIRECT
        Opened /dev/ram7 RO
        /dev/ram7: block size is 1024 bytes
      /dev/ram7: No label detected
        Closed /dev/ram7
        Opened /dev/hda7 RO O_DIRECT
        /dev/hda7: block size is 1024 bytes
      /dev/hda7: lvm2 label detected
        Closed /dev/hda7
        lvmcache: /dev/hda7 now orphaned
        Opened /dev/hda7 RO O_DIRECT
        /dev/hda7: block size is 1024 bytes
  Incorrect metadata area header checksum
        Closed /dev/hda7
        Opened /dev/vg_uhu00/var_cache_rsnapshot RO O_DIRECT
        /dev/vg_uhu00/var_cache_rsnapshot: block size is 4096 bytes
      /dev/vg_uhu00/var_cache_rsnapshot: No label detected
        Closed /dev/vg_uhu00/var_cache_rsnapshot
        /dev/ram8: Not using O_DIRECT
        Opened /dev/ram8 RO
        /dev/ram8: block size is 1024 bytes
      /dev/ram8: No label detected
        Closed /dev/ram8
        Opened /dev/hda8 RO O_DIRECT
        /dev/hda8: block size is 4096 bytes
      /dev/hda8: lvm2 label detected
        Closed /dev/hda8
        lvmcache: /dev/hda8 now orphaned
        Opened /dev/hda8 RO O_DIRECT
        /dev/hda8: block size is 4096 bytes
        Closed /dev/hda8
        lvmcache: /dev/hda8 now in VG vg_uhu00
        Opened /dev/evms/hda1 RO O_DIRECT
        /dev/evms/hda1: block size is 512 bytes
      /dev/evms/hda1: No label detected
        Closed /dev/evms/hda1
        /dev/ram9: Not using O_DIRECT
        Opened /dev/ram9 RO
        /dev/ram9: block size is 1024 bytes
      /dev/ram9: No label detected
        Closed /dev/ram9
        Opened /dev/hda9 RO O_DIRECT
        /dev/hda9: block size is 512 bytes
      /dev/hda9: lvm2 label detected
        Closed /dev/hda9
        lvmcache: /dev/hda9 now orphaned
        Opened /dev/hda9 RO O_DIRECT
        /dev/hda9: block size is 512 bytes
        Closed /dev/hda9
        lvmcache: /dev/hda9 now in VG vg_uhu00
        Opened /dev/evms/hda5 RO O_DIRECT
        /dev/evms/hda5: block size is 4096 bytes
      /dev/evms/hda5: No label detected
        Closed /dev/evms/hda5
        /dev/ram10: Not using O_DIRECT
        Opened /dev/ram10 RO
        /dev/ram10: block size is 1024 bytes
      /dev/ram10: No label detected
        Closed /dev/ram10
        Opened /dev/hda10 RO O_DIRECT
        /dev/hda10: block size is 512 bytes
      /dev/hda10: lvm2 label detected
        Closed /dev/hda10
        lvmcache: /dev/hda10 now orphaned
        Opened /dev/hda10 RO O_DIRECT
        /dev/hda10: block size is 512 bytes
        Closed /dev/hda10
        lvmcache: /dev/hda10 now in VG vg_uhu00
        Opened /dev/evms/hda6 RO O_DIRECT
        /dev/evms/hda6: block size is 4096 bytes
      /dev/evms/hda6: No label detected
        Closed /dev/evms/hda6
        /dev/ram11: Not using O_DIRECT
        Opened /dev/ram11 RO
        /dev/ram11: block size is 1024 bytes
      /dev/ram11: No label detected
        Closed /dev/ram11
        Opened /dev/evms/hda7 RO O_DIRECT
        /dev/evms/hda7: block size is 512 bytes
      /dev/evms/hda7: lvm2 label detected
        Closed /dev/evms/hda7
      Duplicate PV EWhly9hF5TcIV1KyHfXVUQDBe7S1uf14 on /dev/hda7 - using dm /dev/evms/hda7
        Opened /dev/evms/hda7 RO O_DIRECT
        /dev/evms/hda7: block size is 512 bytes
  Incorrect metadata area header checksum
        Closed /dev/evms/hda7
        /dev/ram12: Not using O_DIRECT
        Opened /dev/ram12 RO
        /dev/ram12: block size is 1024 bytes
      /dev/ram12: No label detected
        Closed /dev/ram12
        /dev/ram13: Not using O_DIRECT
        Opened /dev/ram13 RO
        /dev/ram13: block size is 1024 bytes
      /dev/ram13: No label detected
        Closed /dev/ram13
        /dev/ram14: Not using O_DIRECT
        Opened /dev/ram14 RO
        /dev/ram14: block size is 1024 bytes
      /dev/ram14: No label detected
        Closed /dev/ram14
        /dev/ram15: Not using O_DIRECT
        Opened /dev/ram15 RO
        /dev/ram15: block size is 1024 bytes
      /dev/ram15: No label detected
        Closed /dev/ram15
        Opened /dev/evms/lvm2/vg_uhu00/home RO O_DIRECT
        /dev/evms/lvm2/vg_uhu00/home: block size is 4096 bytes
      /dev/evms/lvm2/vg_uhu00/home: No label detected
        Closed /dev/evms/lvm2/vg_uhu00/home
        Opened /dev/evms/lvm2/vg_uhu00/opt RO O_DIRECT
        /dev/evms/lvm2/vg_uhu00/opt: block size is 4096 bytes
      /dev/evms/lvm2/vg_uhu00/opt: No label detected
        Closed /dev/evms/lvm2/vg_uhu00/opt
        Opened /dev/evms/lvm2/vg_uhu00/root RO O_DIRECT
        /dev/evms/lvm2/vg_uhu00/root: block size is 4096 bytes
      /dev/evms/lvm2/vg_uhu00/root: No label detected
        Closed /dev/evms/lvm2/vg_uhu00/root
        Opened /dev/evms/lvm2/vg_uhu00/tmp RO O_DIRECT
        /dev/evms/lvm2/vg_uhu00/tmp: block size is 4096 bytes
      /dev/evms/lvm2/vg_uhu00/tmp: No label detected
        Closed /dev/evms/lvm2/vg_uhu00/tmp
        Opened /dev/evms/lvm2/vg_uhu00/usr RO O_DIRECT
        /dev/evms/lvm2/vg_uhu00/usr: block size is 4096 bytes
      /dev/evms/lvm2/vg_uhu00/usr: No label detected
        Closed /dev/evms/lvm2/vg_uhu00/usr
        Opened /dev/evms/lvm2/vg_uhu00/usr_local RO O_DIRECT
        /dev/evms/lvm2/vg_uhu00/usr_local: block size is 4096 bytes
      /dev/evms/lvm2/vg_uhu00/usr_local: No label detected
        Closed /dev/evms/lvm2/vg_uhu00/usr_local
        Opened /dev/evms/lvm2/vg_uhu00/var RO O_DIRECT
        /dev/evms/lvm2/vg_uhu00/var: block size is 4096 bytes
      /dev/evms/lvm2/vg_uhu00/var: No label detected
        Closed /dev/evms/lvm2/vg_uhu00/var
        Opened /dev/evms/lvm2/vg_uhu00/var_cache_rsnapshot RO O_DIRECT
        /dev/evms/lvm2/vg_uhu00/var_cache_rsnapshot: block size is 4096 bytes
      /dev/evms/lvm2/vg_uhu00/var_cache_rsnapshot: No label detected
        Closed /dev/evms/lvm2/vg_uhu00/var_cache_rsnapshot
      Locking /var/lock/lvm/V_vg_uhu00 RB
    Finding volume group "vg_uhu00"
        Opened /dev/hda8 RO O_DIRECT
        /dev/hda8: block size is 4096 bytes
      /dev/hda8: lvm2 label detected
        Opened /dev/hda9 RO O_DIRECT
        /dev/hda9: block size is 512 bytes
      /dev/hda9: lvm2 label detected
        Opened /dev/hda10 RO O_DIRECT
        /dev/hda10: block size is 512 bytes
      /dev/hda10: lvm2 label detected
      /dev/hda8: lvm2 label detected
      /dev/hda9: lvm2 label detected
      /dev/hda10: lvm2 label detected
        Read vg_uhu00 metadata (932) from /dev/hda8 at 113152 size 4207
      /dev/hda8: lvm2 label detected
      /dev/hda9: lvm2 label detected
      /dev/hda10: lvm2 label detected
        Read vg_uhu00 metadata (932) from /dev/hda9 at 83968 size 4207
      /dev/hda8: lvm2 label detected
      /dev/hda9: lvm2 label detected
      /dev/hda10: lvm2 label detected
        Read vg_uhu00 metadata (932) from /dev/hda10 at 27648 size 4207
        /dev/hda8 0:      0    256: root(0:0)
        /dev/hda8 1:    256   1024: home(0:0)
        /dev/hda8 2:   1280    512: usr(0:0)
        /dev/hda8 3:   1792    256: opt(0:0)
        /dev/hda8 4:   2048    125: home(1024:0)
        /dev/hda8 5:   2173    256: tmp(0:0)
        /dev/hda8 6:   2429    238: var(0:0)
        /dev/hda8 7:   2667     18: var_cache_rsnapshot(1917:0)
        /dev/hda8 8:   2685    125: usr_local(0:0)
        /dev/hda8 9:   2810    256: usr(512:0)
        /dev/hda8 10:   3066   1024: var_cache_rsnapshot(0:0)
        /dev/hda8 11:   4090    131: home(1149:0)
        /dev/hda8 12:   4221    106: var_cache_rsnapshot(1024:0)
        /dev/hda9 0:      0    662: var_cache_rsnapshot(1130:0)
        /dev/hda9 1:    662    188: tmp(256:0)
        /dev/hda9 2:    850    256: home(1280:0)
        /dev/hda9 3:   1106      5: var_cache_rsnapshot(1935:0)
        /dev/hda10 0:      0    188: root(256:0)
        /dev/hda10 1:    188    188: usr(768:0)
        /dev/hda10 2:    376    125: var_cache_rsnapshot(1792:0)
        Getting device info for vg_uhu00-root
        dm version   O   [16384]
        dm info  LVM-ZpY3wxDq1NlG2byJ5NqXZQ7C32MX1Hy3CdjOet96DpeOAbPH3OBwU1R0Xy5xpEPu O   [16384]
        Getting device info for vg_uhu00-home
        dm info  LVM-ZpY3wxDq1NlG2byJ5NqXZQ7C32MX1Hy3HX3ggwEt0JbuLgE9blJgOqUuw5jF7Wfz O   [16384]
        Getting device info for vg_uhu00-usr
        dm info  LVM-ZpY3wxDq1NlG2byJ5NqXZQ7C32MX1Hy38Aat6okCW4jqrSWodNAj7acpMcE2DMBB O   [16384]
        Getting device info for vg_uhu00-opt
        dm info  LVM-ZpY3wxDq1NlG2byJ5NqXZQ7C32MX1Hy3BaODGoOT2Q4ts6Wah8ZQgfePJu0R1RSc O   [16384]
        Getting device info for vg_uhu00-tmp
        dm info  LVM-ZpY3wxDq1NlG2byJ5NqXZQ7C32MX1Hy3Biwcuzhqr0WpHoFRFlZs8rhyn78X4nUY O   [16384]
        Getting device info for vg_uhu00-var
        dm info  LVM-ZpY3wxDq1NlG2byJ5NqXZQ7C32MX1Hy3mqx311fiVLVtuwAPppqZfnWXuJewscVK O   [16384]
        Getting device info for vg_uhu00-usr_local
        dm info  LVM-ZpY3wxDq1NlG2byJ5NqXZQ7C32MX1Hy3FjRudmLntxcpdBxZhv5bQ566WL68fu34 O   [16384]
        Getting device info for vg_uhu00-var_cache_rsnapshot
        dm info  LVM-ZpY3wxDq1NlG2byJ5NqXZQ7C32MX1Hy38HzIxKK6m6Ww4c5DijvKAF0Q6DkM8WIq O   [16384]
        Getting device info for vg_uhu00-root
        dm info  LVM-ZpY3wxDq1NlG2byJ5NqXZQ7C32MX1Hy3CdjOet96DpeOAbPH3OBwU1R0Xy5xpEPu O   [16384]
        Getting device info for vg_uhu00-home
        dm info  LVM-ZpY3wxDq1NlG2byJ5NqXZQ7C32MX1Hy3HX3ggwEt0JbuLgE9blJgOqUuw5jF7Wfz O   [16384]
        Getting device info for vg_uhu00-usr
        dm info  LVM-ZpY3wxDq1NlG2byJ5NqXZQ7C32MX1Hy38Aat6okCW4jqrSWodNAj7acpMcE2DMBB O   [16384]
        Getting device info for vg_uhu00-opt
        dm info  LVM-ZpY3wxDq1NlG2byJ5NqXZQ7C32MX1Hy3BaODGoOT2Q4ts6Wah8ZQgfePJu0R1RSc O   [16384]
        Getting device info for vg_uhu00-tmp
        dm info  LVM-ZpY3wxDq1NlG2byJ5NqXZQ7C32MX1Hy3Biwcuzhqr0WpHoFRFlZs8rhyn78X4nUY O   [16384]
        Getting device info for vg_uhu00-var
        dm info  LVM-ZpY3wxDq1NlG2byJ5NqXZQ7C32MX1Hy3mqx311fiVLVtuwAPppqZfnWXuJewscVK O   [16384]
        Getting device info for vg_uhu00-usr_local
        dm info  LVM-ZpY3wxDq1NlG2byJ5NqXZQ7C32MX1Hy3FjRudmLntxcpdBxZhv5bQ566WL68fu34 O   [16384]
        Getting device info for vg_uhu00-var_cache_rsnapshot
        dm info  LVM-ZpY3wxDq1NlG2byJ5NqXZQ7C32MX1Hy38HzIxKK6m6Ww4c5DijvKAF0Q6DkM8WIq O   [16384]
  --- Volume group ---
  VG Name               vg_uhu00
  System ID             
  Format                lvm2
  Metadata Areas        3
  Metadata Sequence No  932
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                8
  Open LV               8
  Max PV                0
  Cur PV                3
  Act PV                3
  VG Size               23,20 GB
  PE Size               4,00 MB
  Total PE              5939
  Alloc PE / Size       5939 / 23,20 GB
  Free  PE / Size       0 / 0   
  VG UUID               ZpY3wx-Dq1N-lG2b-yJ5N-qXZQ-7C32-MX1Hy3
   
  --- Logical volume ---
  LV Name                /dev/vg_uhu00/root
  VG Name                vg_uhu00
  LV UUID                CdjOet-96Dp-eOAb-PH3O-BwU1-R0Xy-5xpEPu
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                1,73 GB
  Current LE             444
  Segments               2
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:0
   
  --- Logical volume ---
  LV Name                /dev/vg_uhu00/home
  VG Name                vg_uhu00
  LV UUID                HX3ggw-Et0J-buLg-E9bl-JgOq-Uuw5-jF7Wfz
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                6,00 GB
  Current LE             1536
  Segments               4
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:1
   
  --- Logical volume ---
  LV Name                /dev/vg_uhu00/usr
  VG Name                vg_uhu00
  LV UUID                8Aat6o-kCW4-jqrS-WodN-Aj7a-cpMc-E2DMBB
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                3,73 GB
  Current LE             956
  Segments               3
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:2
   
  --- Logical volume ---
  LV Name                /dev/vg_uhu00/opt
  VG Name                vg_uhu00
  LV UUID                BaODGo-OT2Q-4ts6-Wah8-ZQgf-ePJu-0R1RSc
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                1,00 GB
  Current LE             256
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:3
   
  --- Logical volume ---
  LV Name                /dev/vg_uhu00/tmp
  VG Name                vg_uhu00
  LV UUID                Biwcuz-hqr0-WpHo-FRFl-Zs8r-hyn7-8X4nUY
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                1,73 GB
  Current LE             444
  Segments               2
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:4
   
  --- Logical volume ---
  LV Name                /dev/vg_uhu00/var
  VG Name                vg_uhu00
  LV UUID                mqx311-fiVL-Vtuw-APpp-qZfn-WXuJ-ewscVK
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                952,00 MB
  Current LE             238
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:5
   
  --- Logical volume ---
  LV Name                /dev/vg_uhu00/usr_local
  VG Name                vg_uhu00
  LV UUID                FjRudm-Lntx-cpdB-xZhv-5bQ5-66WL-68fu34
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                500,00 MB
  Current LE             125
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:6
   
  --- Logical volume ---
  LV Name                /dev/vg_uhu00/var_cache_rsnapshot
  VG Name                vg_uhu00
  LV UUID                8HzIxK-K6m6-Ww4c-5Dij-vKAF-0Q6D-kM8WIq
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                7,58 GB
  Current L        Read volume group vg_uhu00 from /etc/lvm/backup/vg_uhu00
      Unlocking /var/lock/lvm/V_vg_uhu00
        Closed /dev/hda8
        Closed /dev/hda9
        Closed /dev/hda10
E             1940
  Segments               6
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:7
   
  --- Physical volumes ---
  PV Name               /dev/hda8     
  PV UUID               ynwP5s-t6S7-3eus-0qNj-xYpm-IMCJ-TsfuDU
  PV Status             allocatable
  Total PE / Free PE    4327 / 0
   
  PV Name               /dev/hda9     
  PV UUID               MvqlEq-7tZf-pZfP-EU3m-bHyQ-xs3Q-ov8cBR
  PV Status             allocatable
  Total PE / Free PE    1111 / 0
   
  PV Name               /dev/hda10     
  PV UUID               Cm961g-X5km-ifdU-r0Cp-ACmd-N9qG-XcieTR
  PV Status             allocatable
  Total PE / Free PE    501 / 0
   

--=-/Wpluvhl59kvY+xrPprx--
