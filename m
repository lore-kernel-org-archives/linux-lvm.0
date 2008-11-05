Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mA51Np7d027134
	for <linux-lvm@redhat.com>; Tue, 4 Nov 2008 20:23:51 -0500
Received: from mail.bucoks.com (wsip-70-167-48-6.ks.ks.cox.net [70.167.48.6])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mA51NeSZ005461
	for <linux-lvm@redhat.com>; Tue, 4 Nov 2008 20:23:40 -0500
Received: from mail.bucoks.com (imss03.bucoks [127.0.0.1])
	by postfix.imss70 (Postfix) with ESMTP id 6BB3B13018C
	for <linux-lvm@redhat.com>; Tue,  4 Nov 2008 19:23:42 -0600 (CST)
Received: from EXCS01.BUCOKS (excs01.bucoks [192.168.0.40])
	by mail.bucoks.com (Postfix) with ESMTP id 59D8213018A
	for <linux-lvm@redhat.com>; Tue,  4 Nov 2008 19:23:42 -0600 (CST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Tue, 4 Nov 2008 19:23:39 -0600
Message-ID: <8D07631D47C3CB4F867AD7BCF07D5C232C87@excs01.bucoks>
From: "James A. Dinkel" <jdinkel@bucoks.com>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] reading lun snapshots with identical lvm information on
	them on one machine 
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

I have 4 san luns attached to a RedHat EL 5.2 server. Each partitioned with=
 a single lvm partition, making up a single volume group. I've created a sn=
apshot of these luns on the san and reattached the 4 snapshot luns back to =
the same server.

As you may guess, this does not work well since the partitions have identic=
al volume group information on them. To begin with the drives just show up =
as 4 drives with lvm partitions on them. I had hoped that I could create a =
new volume group out of those 4 physical volumes and access the data, but I=
 get this when I try (sdb,c,d,e are the original luns, sdf,g,h,i are the sn=
apshot luns):

-------------------------
[brazen@server2 ~]$ sudo /usr/sbin/vgcreate vg-test-snap /dev/sdf1 /dev/sdg=
1 /dev/sdh1 /dev/sdi1
Password:
Found duplicate PV cJoNn4uwBjse586l3ZMxKMRo938bK1xp: using /dev/sdf1 not /d=
ev/sdb1
Found duplicate PV eWQLAqej1AgEk0WDLPE0trVqlIreRbyU: using /dev/sdg1 not /d=
ev/sdc1
Found duplicate PV qYx9aIoUEUjB78OAhBuXWmsjv3VCXjUr: using /dev/sdh1 not /d=
ev/sdd1
Found duplicate PV DrgbFGRJ6ziMJqoj2HlTFk9LtQhZx0Fp: using /dev/sdi1 not /d=
ev/sde1
Found duplicate PV cJoNn4uwBjse586l3ZMxKMRo938bK1xp: using /dev/sdb1 not /d=
ev/sdf1
Found duplicate PV eWQLAqej1AgEk0WDLPE0trVqlIreRbyU: using /dev/sdc1 not /d=
ev/sdg1
Found duplicate PV qYx9aIoUEUjB78OAhBuXWmsjv3VCXjUr: using /dev/sdd1 not /d=
ev/sdh1
Found duplicate PV DrgbFGRJ6ziMJqoj2HlTFk9LtQhZx0Fp: using /dev/sde1 not /d=
ev/sdi1
Found duplicate PV cJoNn4uwBjse586l3ZMxKMRo938bK1xp: using /dev/sdf1 not /d=
ev/sdb1
Found duplicate PV eWQLAqej1AgEk0WDLPE0trVqlIreRbyU: using /dev/sdg1 not /d=
ev/sdc1
Found duplicate PV qYx9aIoUEUjB78OAhBuXWmsjv3VCXjUr: using /dev/sdh1 not /d=
ev/sdd1
Found duplicate PV DrgbFGRJ6ziMJqoj2HlTFk9LtQhZx0Fp: using /dev/sdi1 not /d=
ev/sde1
Physical volume '/dev/sdf1' is already in volume group 'vg-test-data1'
Unable to add physical volume '/dev/sdf1' to volume group 'vg-test-snap'.
-----------------------

If anybody has any ideas for getting around this, I would love to hear it. =
Resorting to using lvm snapshots is going to be problematic.  I know it sou=
nds convoluted, but I really need this to work with SAN snapshots.

Thanks,
=EF=BF=BD
James Dinkel
Computer Services, Butler County of Kansas
