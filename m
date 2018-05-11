Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57287309128B
	for <linux-lvm@redhat.com>; Fri, 11 May 2018 17:34:51 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 35F9F3001BC6
	for <linux-lvm@redhat.com>; Fri, 11 May 2018 17:34:49 +0000 (UTC)
Received: from monk.localnet ([46.5.19.123]) by mail.gmx.com (mrgmx103
	[212.227.17.168]) with ESMTPSA (Nemesis) id 0Ma2Lr-1f0uHA0Lzr-00LqC2
	for <linux-lvm@redhat.com>; Fri, 11 May 2018 19:34:47 +0200
From: Dennis Schridde <devurandom@gmx.net>
Date: Fri, 11 May 2018 19:34:42 +0200
Message-ID: <1973783.dFIIZJkBNM@monk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2324479.E9qu7V3cHg";
	micalg="pgp-sha256"; protocol="application/pgp-signature"
Subject: [linux-lvm] Check of pool ernie/cache failed (status:1). Manual
	repair required!
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--nextPart2324479.E9qu7V3cHg
Content-Type: multipart/mixed; boundary="nextPart2324479.5dC4Fc5WPO"
Content-Transfer-Encoding: 7Bit

This is a multi-part message in MIME format.

--nextPart2324479.5dC4Fc5WPO
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello!

I have an issue re-gaining access to my data.  The error messages are:
# lvchange -ay ernie/system
  Check of pool ernie/cache failed (status:1). Manual repair required!
# lvconvert --repair ernie/system
bad checksum in superblock
  Repair of cache metadata volume of cache ernie/system failed (status:1). 
Manual repair required!

How do I recover from this situation and repair the volume group?

For a full log, including the output of pvdisplay, vgdisplay and lvdisplay -a, 
please see attached log file.  If more information is necessary, please ask.

What led to this situation:
I am using one of the infamous AMD Ryzen 2400G with an AMD B350 chipset, which 
suffers from random lockups related to CPU C-states [1].  With the recent 
AGESA 1.0.0.2a firmware update and the introduction of the "Power Supply Idle 
Control = Typical Current Idle" setting, the system is stable, if it boots at 
all.  But it often takes several attempts to boot -- the failed attempts 
ending in weird firmware / EFI or CPU / idle related Linux kernel stack 
traces, which sometimes even require a hard reset, since soft-reboot (ctrl+alt
+del) sometimes has no effect, because init dies.  This was such a situation, 
where I had to reboot (ctrl+alt+del) and reset (hard) the system several 
times, at the end of which everything seemed fine, except that dracut was 
timing out when activating the disks.  Debugging the situation using a Fedora 
28 live system resulted in the attached log file.

--Dennis

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=196683
--nextPart2324479.5dC4Fc5WPO
Content-Disposition: attachment; filename="ernie-lvm.log"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-log; charset="UTF-8"; name="ernie-lvm.log"

# pvdisplay
  WARNING: Not using lvmetad because a repair command was run.
  /dev/cdrom: open failed: No medium found
  /dev/sr1: open failed: No medium found
  --- Physical volume ---
  PV Name               /dev/sdb3
  VG Name               ernie
  PV Size               <3.64 TiB / not usable 2.00 MiB
  Allocatable           yes (but full)
  PE Size               4.00 MiB
  Total PE              953742
  Free PE               0
  Allocated PE          953742
  PV UUID               R4qBtd-llco-Y2dj-ymFq-KxIB-lJv5-ySnjoa
   
  --- Physical volume ---
  PV Name               /dev/nvme0n1
  VG Name               ernie
  PV Size               <232.89 GiB / not usable <3.18 MiB
  Allocatable           yes (but full)
  PE Size               4.00 MiB
  Total PE              59618
  Free PE               0
  Allocated PE          59618
  PV UUID               CFrtOF-iDtJ-FLjh-i1c7-6DEs-8K8g-K1Son5
   
# vgdisplay
  WARNING: Not using lvmetad because a repair command was run.
  /dev/cdrom: open failed: No medium found
  /dev/sr1: open failed: No medium found
  --- Volume group ---
  VG Name               ernie
  System ID             
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  131
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               1
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               <3.87 TiB
  PE Size               4.00 MiB
  Total PE              1013360
  Alloc PE / Size       1013360 / <3.87 TiB
  Free  PE / Size       0 / 0   
  VG UUID               zzTyFs-nGPU-ksKG-K37V-U2Pz-OBLs-djtFCH
   
# lvdisplay --all
  WARNING: Not using lvmetad because a repair command was run.
  /dev/cdrom: open failed: No medium found
  /dev/sr1: open failed: No medium found
  --- Logical volume ---
  LV Path                /dev/ernie/system
  LV Name                system
  VG Name                ernie
  LV UUID                BflUud-7t4Q-5j7W-TEg0-AJiL-gLLT-CH3l4Q
  LV Write Access        read/write
  LV Creation host, time archiso, 2018-03-06 16:13:22 -0500
  LV Cache pool name     cache
  LV Cache origin name   system_corig
  LV Status              NOT available
  LV Size                2.00 TiB
  Current LE             524288
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
   
  --- Logical volume ---
  LV Path                /dev/ernie/data
  LV Name                data
  VG Name                ernie
  LV UUID                Ac62Oc-hkkD-tJNH-EVFl-zjd0-w5KW-VXe1vn
  LV Write Access        read/write
  LV Creation host, time ernie, 2018-03-21 21:24:00 -0400
  LV Status              available
  # open                 1
  LV Size                <1.64 TiB
  Current LE             429454
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:0
   
  --- Logical volume ---
  Internal LV Name       cache
  VG Name                ernie
  LV UUID                d3w5lx-MYKd-hCmg-rOzn-22f9-QoUI-XzXjLt
  LV Write Access        read/write
  LV Creation host, time ernie, 2018-04-28 08:17:13 -0400
  LV Pool metadata       cache_cmeta
  LV Pool data           cache_cdata
  LV Status              NOT available
  LV Size                <232.79 GiB
  Current LE             59594
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
   
  --- Logical volume ---
  Internal LV Name       lvol0_pmspare
  VG Name                ernie
  LV UUID                9XxlMS-GEjl-H56Q-Qvy8-n7vR-0jpp-la07Ka
  LV Write Access        read/write
  LV Creation host, time ernie, 2018-04-28 08:17:13 -0400
  LV Status              NOT available
  LV Size                48.00 MiB
  Current LE             12
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
   
  --- Logical volume ---
  Internal LV Name       cache_cmeta
  VG Name                ernie
  LV UUID                oGkCUA-Do2q-zhEV-TMt7-TN8g-p25e-C0cpfG
  LV Write Access        read/write
  LV Creation host, time ernie, 2018-04-28 08:17:13 -0400
  LV Status              NOT available
  LV Size                48.00 MiB
  Current LE             12
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
   
  --- Logical volume ---
  Internal LV Name       cache_cdata
  VG Name                ernie
  LV UUID                J6HA4c-1zbK-0yXX-gdEf-HwZi-2wDn-0GtotN
  LV Write Access        read/write
  LV Creation host, time ernie, 2018-04-28 08:17:13 -0400
  LV Status              NOT available
  LV Size                <232.79 GiB
  Current LE             59594
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
   
  --- Logical volume ---
  Internal LV Name       system_corig
  VG Name                ernie
  LV UUID                3xrU9V-kzgH-7Ncr-AQoE-u4lv-iiki-BbZIom
  LV Write Access        read/write
  LV Creation host, time ernie, 2018-04-28 08:17:44 -0400
  LV origin of Cache LV  system
  LV Status              NOT available
  LV Size                2.00 TiB
  Current LE             524288
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
   
# lvchange -ay /dev/ernie/system
  WARNING: Not using lvmetad because a repair command was run.
  /dev/cdrom: open failed: No medium found
  /dev/sr1: open failed: No medium found
  Check of pool ernie/cache failed (status:1). Manual repair required!
# lvconvert --repair /dev/ernie/system
  WARNING: Disabling lvmetad cache for repair command.
  WARNING: Not using lvmetad because of repair.
  /dev/cdrom: open failed: No medium found
  /dev/sr1: open failed: No medium found
bad checksum in superblock
  Repair of cache metadata volume of cache ernie/system failed (status:1). Manual repair required!

--nextPart2324479.5dC4Fc5WPO--

--nextPart2324479.E9qu7V3cHg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEE0Ngi/nirHnbsz3NFz+h/M161qdwFAlr11DIACgkQz+h/M161
qdz4aQv8C2EBLaz6ruepXZ01YoV3LPOaKzRlQg95tizMMHUkgU0MUNzEErsOMX4N
4ckSrD8e/v3F0+RxA0hEMxQt8iRV7xWgG4Fhbm8Kj3m/o2lY9wmJObAXKQONF1fq
ZHiFisZkM3MEOvAodQl2v7MWZqbl3YMYvmR56hbNmcZ9xWKJ//bfqkVe0fan2xUH
AclGr3xAXK+x94qu/50YOsSVy2JuqDDOQra56XhlQoZb1qNS+kcHSAELQj8MY5gk
L5CpVo6vTci7pk9SWpbtWHe9jAjUU0sNCDe+8vPB9q6+5BUrBjgfvX5y3F4PT24w
DKIJwhpS0li8mISzby55vQq/U7NZRV5En1mddQuNsopv+CJmKNIUzM2zh7IyiPYx
5tV48n83ZghfFqeLztGBBexMocWP1gs8PEmqlJtS3sI6oZVFi6penag9KwUvDFly
UGPvLqeRnqKt6VLNIj2VyiRCN3TvZV1SO3n3qjVCwfpbw5EHsevJy4nV7vaDuq9x
TH1KZOIk
=4kd4
-----END PGP SIGNATURE-----

--nextPart2324479.E9qu7V3cHg--
