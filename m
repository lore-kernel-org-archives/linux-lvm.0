Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBC77SX0027027
	for <linux-lvm@redhat.com>; Wed, 12 Dec 2007 02:07:28 -0500
Received: from bay0-omc2-s2.bay0.hotmail.com (bay0-omc2-s2.bay0.hotmail.com
	[65.54.246.138])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBC76plp000805
	for <linux-lvm@redhat.com>; Wed, 12 Dec 2007 02:06:52 -0500
Message-ID: <BAY124-W59BBCA092E4CB4D14E3BE1CD650@phx.gbl>
From: Glynn Morrison <glymor@hotmail.com>
Date: Wed, 12 Dec 2007 07:06:46 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] After replacing sata card can't read
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com


I had a SATA controller card die on me. After I replaced the card I had to re-create the raid array in order to get mdadm to admit that the two disks previously on the faulty controller where not in fact faulty. This worked fine but after I didn't get anything from pvdisplay etc.

Last lvm backup before this all went south:

raid {
        id = "KFk3aC-IYfB-y2VI-R2aZ-xu1M-g0YJ-eYQetH"
        seqno = 8
        status = ["RESIZEABLE", "READ", "WRITE"]
        extent_size = 8192              # 4 Megabytes
        max_lv = 0
        max_pv = 0

        physical_volumes {

                pv0 {
                        id = "uRm1dv-M80B-YRPp-vNM8-WNth-kuke-oNCGHG"
                        device = "/dev/md2"     # Hint only

                        status = ["ALLOCATABLE"]
                        pe_start = 384
                        pe_count = 596171       # 2.27421 Terabytes
                }

        }
        logical_volumes {

                all {
                        id = "jYuHXU-UaNa-cepc-juzv-RebF-zmJL-eJhiZU"
                        status = ["READ", "WRITE", "VISIBLE"]
                        segment_count = 1

                        segment1 {
                                start_extent = 0
                                extent_count = 576000   # 2.19727 Terabytes

                                type = "striped"
                                stripe_count = 1        # linear

                                stripes = [
                                        "pv0", 0
                                ]
                        }
                }
        }
}

what I did:

  mdadm  --create --assume-clean /dev/md2 --level=5 --raid-devices=6 /dev/sd[a-f]1

  pvcreate -u uRm1dv-M80B-YRPp-vNM8-WNth-kuke-oNCGHG /dev/md2
  vgcfgrestore -f lvm-raid raid

Latter I tried: pvcreate --restorefile lvm-raid -u uRm1dv-M80B-YRPp-vNM8-WNth-kuke-oNCGHG /dev/md2 instead to the same affect.

current output:

pvdisplay -v:
 --- Physical volume ---
  PV Name               /dev/md2
  VG Name               raid
  PV Size               2.27 TB / not usable 0   
  Allocatable           yes 
  PE Size (KByte)       4096
  Total PE              596171
  Free PE               20171
  Allocated PE          576000
  PV UUID               uRm1dv-M80B-YRPp-vNM8-WNth-kuke-oNCGHG

vgdisplay -v:
  --- Volume group ---
  VG Name               raid
  System ID             
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  9
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               2.27 TB
  PE Size               4.00 MB
  Total PE              596171
  Alloc PE / Size       576000 / 2.20 TB
  Free  PE / Size       20171 / 78.79 GB
  VG UUID               KFk3aC-IYfB-y2VI-R2aZ-xu1M-g0YJ-eYQetH
  --- Logical volume ---
  LV Name                /dev/raid/all
  VG Name                raid
  LV UUID                jYuHXU-UaNa-cepc-juzv-RebF-zmJL-eJhiZU
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                2.20 TB
  Current LE             576000
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:0
   
  --- Physical volumes ---
  PV Name               /dev/md2     
  PV UUID               uRm1dv-M80B-YRPp-vNM8-WNth-kuke-oNCGHG
  PV Status             allocatable
  Total PE / Free PE    596171 / 20171

lvdisplay -v:
  --- Logical volume ---
  LV Name                /dev/raid/all
  VG Name                raid
  LV UUID                jYuHXU-UaNa-cepc-juzv-RebF-zmJL-eJhiZU
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                2.20 TB
  Current LE             576000
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:0

diff /etc/lvm/backup/raid lvm-raid:
  ...
  <       seqno = 9
  ---
 >       seqno = 8

and the problem:

  mount: wrong fs type, bad option, bad superblock on /dev/raid/all
  xfs_check: unexpected XFS SB magic number 0x00000000

I'm assuming that all this wont have affected the actual data on the drive, but I'm at a loss of what to do now, as far as I can see everything is now as it was...

I would sincerely appreciate any help.

Rgrds,

Glynn
_________________________________________________________________
Free games, great prizes - get gaming at Gamesbox. 
http://www.searchgamesbox.com
