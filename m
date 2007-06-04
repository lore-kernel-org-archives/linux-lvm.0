Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l54FKYrc005853
	for <linux-lvm@redhat.com>; Mon, 4 Jun 2007 11:20:34 -0400
Received: from kzdoos.xs4all.nl (koos.idefix.net [82.92.222.89])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l54FKMLW001719
	for <linux-lvm@redhat.com>; Mon, 4 Jun 2007 11:20:27 -0400
Received: from kzdoos.xs4all.nl (localhost [127.0.0.1])
	by kzdoos.xs4all.nl (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	l54FKLb7020614
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 4 Jun 2007 17:20:21 +0200
Received: (from koos@localhost)
	by kzdoos.xs4all.nl (8.13.4/8.13.4/KH20070408-submit) id l54FKLpB020613
	for linux-lvm@redhat.com; Mon, 4 Jun 2007 17:20:21 +0200
Date: Mon, 4 Jun 2007 17:20:21 +0200
From: Koos van den Hout <koos@kzdoos.xs4all.nl>
Message-ID: <20070604152021.GA19753@kzdoos.xs4all.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
Subject: [linux-lvm] segfault in vgscan
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
To: linux-lvm@redhat.com


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


I have used lvm for ages (originally installed and maintained volumes with
LVM 1.0).

Recently a disk got hardware problems, because of this I wanted to replace
it (/dev/hdc). Saturday I bought a new disk and installed it (/dev/hdd).

I have one logical volume (vgu) consisting of most ide disks in the system
(/dev/hda2, /dev/hdc1, /dev/hde1, /dev/hdh1). Originally, there were 2
volumes, /dev/vgu/scratch and /dev/vgu/camera.

Because I wanted to move /dev/vgu/scratch from reiserfs to ext3, I
decided to start with a new volume (/dev/vgu/newscratch), and rsync
files to newscratch, remove them from scratch, shrink the old scratch
filesystem, grow the new filesystem, take hdc1 out of the allocatable pool
in the process and make everything end up on good disks with an ext3
filesystem.

Shrinking the old scratch filesystem went ok, but lvreduce gave an error:

root@gosper:~# lvreduce -l -17920 /dev/vgu/scratch
lvreduce -- WARNING: reducing active logical volume to 432.12 GB
lvreduce -- THIS MAY DESTROY YOUR DATA (filesystem etc.)
lvreduce -- do you really want to reduce "/dev/vgu/scratch"? [y/n]: y
lvreduce -- ERROR "pv_check_consistency_all_pv(): PE" volume group "vgu" is
inconsistent
lvreduce -- WARNING: you don't have an automatic backup of "vgu"
lvreduce -- logical volume "/dev/vgu/scratch" successfully reduced

And now all operations with logical volumes give an error:
vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please
run vgscan

But vgscan segfaults, even with the latest from LVM 1.0.8:

root@gosper:~# ~koos/src/LVM/1.0.8/tools/vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "vgu"
Segmentation fault

And with -d, the last screen looks like:

<7777777> lvm_check_dev -- CALLED
<88888888> lvm_check_partitioned_dev -- CALLED
<999999999> lvm_get_device_type called
<999999999> lvm_get_device_type leaving with 0
<88888888> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache -- CALLED
<7777777> lvm_dir_cache -- LEAVING with ret: 21
<666666> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdc1
<666666> system_id_check_exported -- CALLED
<666666> system_id_check_exported -- LEAVING with ret: 0
<55555> pv_read -- LEAVING with ret: 0
<55555> vg_copy_from_disk -- CALLED
<55555> vg_copy_from_disk -- LEAVING
<4444> vg_read_from_pv -- LEAVING with ret: 0
<333> vg_read -- LEAVING with ret: 0
<22> lv_read_all_lv -- lv_max: 255
<22> lv_read_all_lv -- BEFORE pv_read_all_pv_of_vg
<333> pv_read_all_pv_of_vg -- CALLED with vg_name: "vgu"
<4444> vg_check_name -- CALLED with VG: vgu
<55555> lvm_check_chars -- CALLED with name: "vgu"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<22> lv_read_all_lv -- l: 255  nl: 3  vg_this->lv_cur: 3
<22> lv_read_all_lv -- LEAVING with ret: 0
<1> vg_read_with_pv_and_lv -- AFTER lv_read_all_lv; vg_this->pv_cur: 5
vg_this->pv_max: 255  ret: 0
<1> vg_read_with_pv_and_lv -- BEFORE for PE
<1> vg_read_with_pv_and_lv -- AFTER for PE
<1> vg_read_with_pv_and_lv -- BEFORE for LV
<1> vg_read_with_pv_and_lv -- vg_this->lv[0]->lv_allocated_le: 27656
Segmentation fault

(27656 is indeed the size of /dev/vgu/scratch after the resize, interesting
number)

Any idea where to go? I can still mount /dev/vgu/scratch /dev/vgu/camera
and /dev/vgu/newscratch but I'm not sure how to continue. I haven't
rebooted the system hoping to avoid things going downhill.

The complete log from vgscan -d (82416 bytes) is at
http://koos.idefix.net/tmp/vgscan.log

                                                 Koos van den Hout

--=20
Koos van den Hout                         Homepage: http://idefix.net/~koos/
Fax: +31-30-2817051     PGP keyid DSS/1024 0xF0D7C263 or RSA/1024 0xCA845CB5
Webprojects:              Camp Wireless        http://www.camp-wireless.org/
                      The Virtual Bookcase   http://www.virtualbookcase.com/

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFGZC21LGY7XfDXwmMRAqaYAKCg90SwzpiiVIkOX/mW2xgCCzAo5gCg6qmn
ivmsXSzyvQx3LtmLDuYPyyc=
=m+1V
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
