Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7HCX5V21752
	for <linux-lvm@redhat.com>; Wed, 17 Aug 2005 08:33:05 -0400
Received: from tcmail21.telekom.de (tcmail21.telekom.de [217.6.95.235])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7HCWxZj026992
	for <linux-lvm@redhat.com>; Wed, 17 Aug 2005 08:32:59 -0400
Received: from u8s17.ditscom.dsh.de (u8s17.ditscom.dsh.de [164.32.151.153]) by
	tcmail21.dmz.telekom.de with ESMTP for linux-lvm@redhat.com;
	Wed, 17 Aug 2005 14:32:51 +0200
Message-Id: <DF6FD933C3914D409E8CA14EE01A026C02F14AA8@e8sbh.ditscom.dsh.de>
From: Lutz.Reinegger@t-systems.com
Subject: [linux-lvm] lvcreate --snapshot ---> file descriptor 7 left open?
Date: Wed, 17 Aug 2005 14:32:50 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Hey there,

currently I am testing a small backup script (ksh) which is supposed to cre=
ate snapshots
of my MySQL database file systems using the Linux LVM2 snapshot feature.=20

Here is the command I am using:
"/usr/sbin/lvcreate -L 10240M --snapshot -p r -n mysqlsnap /dev/datavg/mysq=
llv"

It works fine so far ($? =3D 0), however I am seeing some kind of strange m=
essages:
"
File descriptor 7 left open
  Logical volume "mysqlsnap" created
"

A month ago J=EF=BF=BDrgen reported similar messages using "lvdisplay":
https://www.redhat.com/archives/linux-lvm/2005-July/msg00069.html
Alasdair then pointed out that this message is (only?) a warning message:
https://www.redhat.com/archives/linux-lvm/2005-July/msg00070.html

Here 's my question:
Do I have to be worried about the consistency of my snapshots in any way
because of this message?

Operating system  : RedHat Enterprise Linux 4 for IA32 + latest patches.=20
Kernel version    : 2.6.9-11.ELsmp

lvm> version
  LVM version     : 2.01.08 (2005-03-22)
  Library version : 1.01.01 (2005-03-29)
  Driver version  : 4.4.0
lvm>=20

Kind regards
Lutz Reinegger
