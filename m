Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mADAo9gP011292
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2008 05:50:09 -0500
Received: from mail.knebb.de (mail.knebb.de [83.137.99.149])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mADAnwa7000874
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2008 05:49:58 -0500
Received: from tp.knebb.de (p54BC6088.dip.t-dialin.net [84.188.96.136])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.knebb.de (Postfix) with ESMTP id 25480FA0C
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2008 11:49:57 +0100 (CET)
Message-ID: <491C0654.1050208@knebb.de>
Date: Thu, 13 Nov 2008 11:49:56 +0100
From: =?ISO-8859-1?Q?Christian_V=F6lker?= <chrischan@knebb.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove --abort does nothing
References: <491BF3CF.2090800@knebb.de>	<C9F9ED04-6B26-4681-9D1D-46017DD7CF41@redhat.com>	<491C019F.6060205@knebb.de>
	<361513C7-BBE2-45D0-A6BA-F42E6219706A@redhat.com>
In-Reply-To: <361513C7-BBE2-45D0-A6BA-F42E6219706A@redhat.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

> couldn't hurt to post all of the LVs starting with 'vg1' (table and
> status).
Here we are:
[root@nas ~]# dmsetup status| grep vg1
vg1-musik: 0 367001600 linear
vg1-backup: 0 747700224 linear
vg1-backup: 747700224 180486144 linear
vg1-backup: 928186368 178520064 linear
vg1-backup: 1106706432 125829120 linear
vg1-minidv: 0 364183552 linear
vg1-minidv: 364183552 193134592 linear
vg1-minidv: 557318144 147718144 linear
vg1-minidv: 705036288 101711872 linear
vg1-minidv: 806748160 32112640 linear
vg1-minidv: 838860800 209715200 linear
vg1-minidv: 1048576000 150994944 linear
vg1-esx: 0 125829120 striped
vg1-ftp: 0 209715200 linear
vg1-backuppc: 0 419430400 linear
vg1-video: 0 2147483648 linear
vg1-video: 2147483648 38862848 linear
vg1-video: 2186346496 157286400 linear
vg1-bilder: 0 157286400 linear
vg1-pvmove0:
[root@nas ~]# dmsetup table | grep vg1
vg1-musik: 0 367001600 linear 8:33 41484672
vg1-backup: 0 747700224 linear 8:17 384
vg1-backup: 747700224 180486144 linear 8:97 220201344
vg1-backup: 928186368 178520064 linear 8:49 384
vg1-backup: 1106706432 125829120 linear 8:97 400687488
vg1-minidv: 0 364183552 linear 8:33 1100546432
vg1-minidv: 364183552 193134592 linear 8:49 178520448
vg1-minidv: 557318144 147718144 linear 8:81 691143040
vg1-minidv: 705036288 101711872 linear 8:81 589431168
vg1-minidv: 806748160 32112640 linear 8:81 557318528
vg1-minidv: 838860800 209715200 linear 8:81 2176254336
vg1-minidv: 1048576000 150994944 linear 8:81 2543255936
vg1-esx: 0 125829120 striped 2 512 8:97 157286784 8:33 1037631872
vg1-ftp: 0 209715200 linear 8:33 408486272
vg1-backuppc: 0 419430400 linear 8:33 618201472
vg1-video: 0 2147483648 linear 8:65 384
vg1-video: 2147483648 38862848 linear 8:65 2304770432
vg1-video: 2186346496 157286400 linear 8:65 2147484032
vg1-bilder: 0 157286400 linear 8:97 384
vg1-pvmove0:
[root@nas ~]#

> Also, the latest backup for vg1 out of /etc/lvm might be nice too.
Which one do you mean? The one before the initial pvmove? Or really the
latest one after I tried several steps like "lvs -a", "vgck" or "pvmove
- --abort"?

BTW: All LVs seems to work fine except that there is the pvmove0 LV
available which I can't get rid of it.
Even a pvmove from this PV works fine!
lvs -a shows:
[root@nas archive]# lvs -a
  Number of segments in active LV pvmove0 does not match metadata
  Number of segments in active LV pvmove0 does not match metadata
  LV        VG   Attr   LSize   Origin Snap%  Move Log Copy%  Convert
  backup    vg1  -wi-a- 587.72G
  backuppc  vg1  -wi-ao 200.00G
  bilder    vg1  -wi-a-  75.00G
  esx       vg1  -wi-ao  60.00G
  ftp       vg1  -wi-a- 100.00G
  minidv    vg1  -wi-a- 572.00G
  musik     vg1  -wi-a- 175.00G
  [pvmove0] vg1  p-C-d-      0
  video     vg1  -wi-a-   1.09T
  raid1     vg2  -wi-a- 120.00G
[root@nas archive]#

Thanks!



Greetings

Christian
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFJHAZU0XNIYlAXmzsRAjehAJ9UoVruDLRqestshhFX8TIuuE3kRQCguIop
POM7sLxBFdGXnCK2ryJ5a5k=
=R6Co
-----END PGP SIGNATURE-----
