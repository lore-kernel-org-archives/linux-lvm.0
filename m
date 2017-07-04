Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA04518A55
	for <linux-lvm@redhat.com>; Tue,  4 Jul 2017 10:37:41 +0000 (UTC)
Received: from rs155.luxsci.com (rs155.luxsci.com [64.49.212.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0734E2FB8A6
	for <linux-lvm@redhat.com>; Tue,  4 Jul 2017 10:37:39 +0000 (UTC)
Received: from rs155.luxsci.com (localhost.localdomain [127.0.0.1])
	by rs155.luxsci.com (8.14.4/8.14.9) with ESMTP id v64AbbRl023986
	for <linux-lvm@redhat.com>; Tue, 4 Jul 2017 05:37:37 -0500
Received: (from root@localhost)
	by rs155.luxsci.com (8.14.4/8.14.9/Submit) id v64Ab1x3023099
	for linux-lvm@redhat.com; Tue, 4 Jul 2017 10:37:01 GMT
Date: Tue, 4 Jul 2017 16:06:33 +0530 (IST)
From: Faheem Mitha <faheem@faheem.info>
Message-Id: <1499164621-7961578.08378651.fv64AaYUh022890@rs155.luxsci.com>
MIME-Version: 1.0
Subject: [linux-lvm] Unable to determine sync status errror when trying
 split LVM2 RAID 1 mirror
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


Hi,

Please see the issue detailed in

https://unix.stackexchange.com/q/375051/4671

Short version:

If I create a RAID 1 mirror,

      lvconvert --type raid1 --mirrors 1 /dev/newdebian/debian_boot /dev/md2

and then try to split it using

      lvconvert --splitmirrors 1 --name debian_boot_copy /dev/newdebian/debian_boot

I get the error

     Unable to determine sync status of newdebian/debian_boot.
     Unable to split newdebian/debian_boot while it is not in-sync.

See the full transcript at at the foot of this email.

Based on looking at the code in lvconvert, it seems this error is thrown 
when sync percentage for the RAID is missing. But there is no indication 
why this percentage is missing.

Any suggestions for debugging appreciated. And please copy me on any
response. Thanks.

Regards, Faheem Mitha

#####################################################################

Given volume groups debian and newdebian, make a copy of lv
/dev/debian/boot in newdebian.

Rename `/dev/debian/boot` to `/dev/debian/debian_boot`.
Rename `/dev/debian/home` to `/dev/debian/debian_home`.
Rename `/dev/debian/root` to `/dev/debian/debian_root`.

     lvrename /dev/debian/boot /dev/debian/debian_boot
     lvrename /dev/debian/home /dev/debian/debian_home
     lvrename /dev/debian/root /dev/debian/debian_root

Make debian VG inactive.

     vgchange -a n debian

Run merge command. This merges debian into newdebian.

      vgmerge -A y -l -v newdebian debian

Then create a RAID 1 mirror pair from `/dev/newdebian/debian_boot`
using lvconvert. The `dest-pv` argument tells lvconvert to make the
mirror copy on /dev/md2.

     lvconvert --type raid1 --mirrors 1 <<source-lv>> <<dest-pv>>
     lvconvert --type raid1 --mirrors 1 /dev/newdebian/debian_boot /dev/md2

Then split the mirror. The new LV is now `debian_boot_copy`.

     lvconvert --splitmirrors 1 --name <<source-lv-copy>> <<source-lv>>
     lvconvert --splitmirrors 1 --name debian_boot_copy /dev/newdebian/debian_boot

Make /dev/newdebian/debian_boot, /dev/newdebian/debian_home,
/dev/newdebian/debian_root inactive.

     vgchange -a n /dev/newdebian/debian_boot /dev/newdebian/debian_home /dev/newdebian/debian_root

Then split the VGs.

     vgsplit -v <<source-vg>> <<destination-vg>> <<moved-to-pv>>
     vgsplit -v /dev/newdebian /dev/debian /dev/md1
