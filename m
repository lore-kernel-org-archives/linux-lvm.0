Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u31HUKLB012207
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Fri, 1 Apr 2016 13:30:20 -0400
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CCBB17AEA4
	for <linux-lvm@redhat.com>; Fri,  1 Apr 2016 17:30:19 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id n34so93908237qge.1
	for <linux-lvm@redhat.com>; Fri, 01 Apr 2016 10:30:19 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 1 Apr 2016 13:30:19 -0400
Message-ID: <CADMzvUosd-YX99qpabH7UUZARNvJiBJXR6k7kVUjVSniYLty1Q@mail.gmail.com>
From: Syed Mushtaq <syed1.mushtaq@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c13da89ea7da052f6fbb38
Subject: [linux-lvm] LVM Performance issues when creating many Volume groups
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

--001a11c13da89ea7da052f6fbb38
Content-Type: text/plain; charset=UTF-8

Hi linux-lvm,

In my setup I am trying to map a backend ISCSI storage volume to a volume
group. I am using that volume group as a Disk for VMs in Xen. However, If I
create many volume groups, future volume group creates are slowing down. In
my test I have about 600 VGs. Each VG has a single LV. Here are the
commands that are taking a lot of time

create volume group ( 4.8s ): /usr/sbin/vgcreate
VG_XenStorage-1fe15110-61f6-
856f-8ae2-8e42e45a4316 /dev/disk/by-id/scsi-36f47acc1000000007931637600000
523

list lvs inside volume group ( 2.4s ): /usr/sbin/lvs --noheadings --units b
-o +lv_tags /dev/VG_XenStorage-1fe15110-61f6-856f-8ae2-8e42e45a4316

check if LVM volume group exisits (2.5s) : /usr/sbin/vgs
VG_XenStorage-1fe15110-61f6-856f-8ae2-8e42e45a4316

I am using LVM 2.0.88. Is this a known issue? Any workarounds?

Thanks for you help.
-Syed

--001a11c13da89ea7da052f6fbb38
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi linux-lvm,<br><br></div><div>In my setup I am tryi=
ng to map a backend ISCSI storage volume to a volume group. I am using that=
 volume group as a Disk for VMs in Xen. However, If I create many volume gr=
oups, future volume group creates are slowing down. In my test I have about=
 600 VGs. Each VG has a single LV. Here are the commands that are taking a =
lot of time <br><br><span style=3D"font-family:monospace,monospace">create =
volume group ( 4.8s ): /usr/sbin/vgcreate VG_XenStorage-1fe15110-61f6-</spa=
n><div><span style=3D"font-family:monospace,monospace">856f-8ae2-8e42e45a43=
16 /dev/disk/by-id/scsi-</span><span style=3D"font-family:monospace,monospa=
ce">36f47acc1000000007931637600000</span><span style=3D"font-family:monospa=
ce,monospace">523<br><br>list lvs inside volume group ( 2.4s ): /usr/sbin/l=
vs --noheadings --units b -o +lv_tags /dev/VG_XenStorage-1fe15110-</span><s=
pan style=3D"font-family:monospace,monospace">61f6-856f-8ae2-8e42e45a4316<b=
r></span></div><div><span style=3D"font-family:monospace,monospace"><br>che=
ck if LVM volume group exisits (2.5s) : /usr/sbin/vgs VG_XenStorage-1fe1511=
0-61f6-</span><span style=3D"font-family:monospace,monospace">856f-8ae2-8e4=
2e45a4316</span><br><br></div><div>I am using LVM 2.0.88. Is this a known i=
ssue? Any workarounds? <br><br></div><div>Thanks for you help.<br></div><di=
v>-Syed<br></div><div><br></div><br></div></div>

--001a11c13da89ea7da052f6fbb38--
