Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v2E1CneR020589
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 13 Mar 2017 21:12:49 -0400
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com
	[209.85.217.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DE2EF8553E
	for <linux-lvm@redhat.com>; Tue, 14 Mar 2017 01:12:48 +0000 (UTC)
Received: by mail-ua0-f171.google.com with SMTP id 72so162004978uaf.3
	for <linux-lvm@redhat.com>; Mon, 13 Mar 2017 18:12:47 -0700 (PDT)
MIME-Version: 1.0
From: Neutron Sharc <neutronsharc@gmail.com>
Date: Mon, 13 Mar 2017 18:12:06 -0700
Message-ID: <CAB-bdyTrKbjREU_vRAHiLQvWBh=rt8Mh45CZ0_-3BsHKSkz_Nw@mail.gmail.com>
Subject: [linux-lvm] vgcreate failed when using iscsi + dm-multipath + lvm
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi all,

I'm testing a storage prototype that combines iscsi, multipath, and
lvm. The model allows iscsi client to attach/detach multiple iscsi
LUNs exposed by storage server.  Here are the steps for client to
attach to server storage:

1. iscsi initiator creates multiple LUNs (local at /dev/sde, /dev/sdf,
etc), for example:
$ iscsiadm -m node -p a.b.c.d:3260 -T xxxx -l

2.dm-multipath to create a multipath device for each of the iscsi LUN
(/dev/mapper/xyz, etc), for example:
$ multipath -r /dev/sde

In current test every multipath device has only one iscsi lun such as:

36000000076c10ff42e1fa3dd909bb3cf dm-47 HCD,VIRTUAL-DISK
size=140G features='1 queue_if_no_path' hwhandler='0' wp=rw
`-+- policy='round-robin 0' prio=1 status=active
  `- 138:0:0:1 sdae 65:224 active ready running

3. create a volume group that combines several multipath devices together.
$ pvcreate -f -y /dev/mapper/xxx
$ vgcreate vol1  /dev/mapper/xxx  /dev/mapper/yyy /dev/mapper/zzz

After repeating step 1/2/3 to create several volume groups, I hit
couple of error scenarios as listed below. These errors seem to happen
at random order:

error 1:
 Physical volume '/dev/mapper/360000000557b690283509c3709c4fc0b' is
already in volume group 'vol8',
 Unable to add physical volume
'/dev/mapper/360000000557b690283509c3709c4fc0b' to volume group
'vol14'.

error 2:
 Found duplicate PV W9rMQ0GuoNw9rnzK8x47OVEY044A2mgT: using
/dev/mapper/360000000a1d91e849f66dd53a61d8fa9
 not /dev/mapper/360000000e2ddd2a9380e9159902d9f73,  Using duplicate
PV /dev/mapper/360000000a1d91e849f66dd53a61d8fa9 without holders,
replacing /dev/mapper/360000000e2ddd2a9380e9159902d9f73,

error 3:
Can't open /dev/mapper/360000000e2ddd2a9380e9159902d9f73 exclusively.
Mounted filesystem?
Unable to add physical volume
'/dev/mapper/360000000e2ddd2a9380e9159902d9f73' to volume group
'vol2'.



I'm very sure all PVs are freshly created and there is no duplicated PVs at all.

===========
/etc/multipath.conf:
defaults {
  path_grouping_policy    failover
  polling_interval        3
  path_selector           "round-robin 0"
  features                "1 queue_if_no_path"
}

============
lvm.conf:  I use config coming from lvm2 package. The only change is:
auto_activation_volume_list = []


===============
Here is the software pkg version:
Ubuntu 16.04
lvm2 2.02.133-1ubuntu10
multipath-tools: 0.5.0+git1.656f8865-5ubuntu2.4
open-iscsi:  2.02.133-1ubuntu10
