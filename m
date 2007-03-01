Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l21MEb3V002770
	for <linux-lvm@redhat.com>; Thu, 1 Mar 2007 17:14:37 -0500
Received: from pantheon-po13.its.yale.edu (pantheon-po13.its.yale.edu
	[130.132.50.19])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l21MEZdb024147
	for <linux-lvm@redhat.com>; Thu, 1 Mar 2007 17:14:35 -0500
Received: from horde06.its.yale.edu (horde06.its.yale.edu [130.132.50.59])
	by pantheon-po13.its.yale.edu (8.12.11.20060308/8.12.11) with ESMTP id
	l21MEUNp012098
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Thu, 1 Mar 2007 17:14:30 -0500
Received: from horde06.its.yale.edu (localhost.localdomain [127.0.0.1])
	by horde06.its.yale.edu (8.13.1/8.13.1) with ESMTP id l21MEPNO020373
	for <linux-lvm@redhat.com>; Thu, 1 Mar 2007 17:14:30 -0500
Received: (from apache@localhost)
	by horde06.its.yale.edu (8.13.1/8.13.1/Submit) id l21MEPn4020370
	for linux-lvm@redhat.com; Thu, 1 Mar 2007 17:14:25 -0500
Message-ID: <20070301171425.30ktkd2oroo4cco0@www.mail.yale.edu>
Date: Thu, 01 Mar 2007 17:14:25 -0500
From: Chris Hunter <chris.hunter@yale.edu>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] partition table needed for lvm ?
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

Hi, I am relatively new to lvm.

I am using redhat enterprise 4, which uses "lvm2" as it default volume
manager. We have storage devices (ie SAN) that combine 20-40 disks
together into 4+ TB filesystems. We are investigating using lvm to
manage these disks.

The release notes for "rhel4 update 1" state that you _require_ a
partition table to use lvm2:
http://www.redhat.com/docs/manuals/enterprise/RHEL-4-Manual/release-notes/a=
s-x86/RELEASE-NOTES-U1-x86-en.html

>=EF=BF=BD Various issues with LVM2 on large devices are fixed in Red Hat
>Enterprise Linux 4 Update 1. Do not use LVM2 on devices larger than 2
>TB prior to installing Update 1.
>
>As noted above, Red Hat requires that a partition table be written to
>the block device, even when it is used as part of an LVM2 Volume
Group. >In this case, you may create a single partition that spans the
entire >device. Then, be sure to specify the full partition name (for
example, >/dev/sda1, not /dev/sda), when you use the pvcreate and
vgcreate >commands.

According to the lvm HOWTO, lvm can manage disks _without_ partition
tables. In fact I tested this and it appears to work.

Do I reallly need to make partition tables on all my disks to use lvm2 ?

What will happen if I don't use partition tables with lvm ?

Thank-you in advance,

--=20
Chris Hunter
