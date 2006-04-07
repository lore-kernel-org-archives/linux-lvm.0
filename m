Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k37I9jxH022172
	for <linux-lvm@redhat.com>; Fri, 7 Apr 2006 14:09:45 -0400
Received: from smtprelay03.ispgateway.de (smtprelay03.ispgateway.de
	[80.67.18.15])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k37I9iWX022253
	for <linux-lvm@redhat.com>; Fri, 7 Apr 2006 14:09:44 -0400
Received: from unknown (HELO tokyoo.hero.de) (846475@[84.171.154.58])
	(envelope-sender <oliver@hoerold.de>)
	by smtprelay03.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-lvm@redhat.com>; 7 Apr 2006 18:09:43 -0000
From: Oliver =?ISO-8859-1?Q?H=F6rold?= <oliver@hoerold.de>
Date: Fri, 07 Apr 2006 20:09:42 +0200
Message-Id: <1144433382.3692.279.camel@tokyoo.hero.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] logical extent (630) already mapped
Reply-To: oliver@hoerold.de,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: lvm mailinglist <linux-lvm@redhat.com>

hi,

after using for some time lvm without any problems, my lvm system
generates after rebooting some strang errors.

the problems look like these:=20
http://www.copilotconsulting.com/mail-archives/linux-lvm.2005/msg00025.html

but the solution doesnt work for me.

summery:

system suse 10.1, boot drive sata /dev/sda (no lvm)
lvm composed of 8 ide drives (/dev/hda to /dev/hdh)

worked for some time, but i think the auto-update of suse screwed the
lvm.=20

pvscan, pvdisplay, lvsvan and vgscan all generate errors. i have no idea
where the "logic extend" is already mapped. i cant diagnose the error.=20

i think the pv are still intact, but i dont knwo how to put em back
together.

here are some of the errors:

tokyoo:/tmp # pvscan
  /dev/sdb: open failed: Kein Medium gefunden (No Media found)
  /dev/sdc: open failed: Kein Medium gefunden
  /dev/sdd: open failed: Kein Medium gefunden
  /dev/sde: open failed: Kein Medium gefunden
  logical extent (630) already mapped.
  Couldn't fill logical volume maps.
  logical extent (630) already mapped.
  Couldn't fill logical volume maps.
  No matching physical volumes found
tokyoo:/tmp # pvdisplay
  logical extent (630) already mapped.
  Couldn't fill logical volume maps.
  logical extent (630) already mapped.
  Couldn't fill logical volume maps.

remark: with every commad that generates an error i get the "No Media
found" error block f=EF=BF=BDr the /dev/sdx devices. i removed them to save
space.

but strangely the single drives are recognised as proper PV:

tokyoo:/tmp # pvdisplay /dev/hda1
  --- Physical volume ---
  PV Name               /dev/hda1
  VG Name               system
  PV Size               111,78 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       16384
  Total PE              7154
  Free PE               7154
  Allocated PE          0
  PV UUID               afdGTQ-95Qv-f3oL-anWh-V2LO-PKIf-eXTbRb

[...]

some other things i tried:

tokyoo:/tmp # lvscan
  logical extent (630) already mapped.
  Couldn't fill logical volume maps.
  logical extent (630) already mapped.
  Couldn't fill logical volume maps.
  Volume group "system" not found
tokyoo:/tmp # lvdisplay
  logical extent (630) already mapped.
  Couldn't fill logical volume maps.
  logical extent (630) already mapped.
  Couldn't fill logical volume maps.
  Volume group "system" not found
tokyoo:/tmp # lvdisplay system
  logical extent (630) already mapped.
  Couldn't fill logical volume maps.
  logical extent (630) already mapped.
  Couldn't fill logical volume maps.
  Volume group "system" not found
tokyoo:/tmp # vgscan
  Reading all physical volumes.  This may take a while...
  logical extent (630) already mapped.
  Couldn't fill logical volume maps.
  logical extent (630) already mapped.
  Couldn't fill logical volume maps.
  Volume group "system" not found
tokyoo:/tmp # vgcreate
erwin /dev/hda1 /dev/hdc1 /dev/hdd1 /dev/hde1 /dev/hdf1 /dev/hdg1 /dev/hdh1
  Physical volume '/dev/hda1' is already in volume group 'system'
  Unable to add physical volume '/dev/hda1' to volume group 'erwin'.
