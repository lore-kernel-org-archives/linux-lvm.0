Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9VGn8r16307
	for <linux-lvm@redhat.com>; Sun, 31 Oct 2004 11:49:08 -0500
Received: from server6.hostpoint.ch (server6.hostpoint.ch [217.26.52.16])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id i9VGn20C017293
	for <linux-lvm@redhat.com>; Sun, 31 Oct 2004 11:49:03 -0500
Received: from 217-119-145-4.sefanet.ch ([217.119.145.4] helo=[192.168.15.41])
	by server6.hostpoint.ch with asmtp (Exim 4.34) id 1COIsx-0004x2-5V
	for linux-lvm@redhat.com; Sun, 31 Oct 2004 17:48:55 +0100
Message-ID: <41851771.4060203@markus.org>
Date: Sun, 31 Oct 2004 17:48:49 +0100
From: Markus Baertschi <markus@markus.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Software raid on top of lvm logical volume
References: <41801ADE.6030308@monjoin.net> <20041028011738.GD13737@kluge.net>
	<41814060.4040400@mikebabcock.ca>
In-Reply-To: <41814060.4040400@mikebabcock.ca>
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Michael T. Babcock wrote:

>
> I've thought about this numerous times -- there is the distinct=20
> resizing advantage.  Namely, if I create a software RAID partition, I=20
> can't resize it afterward without destroying it.  I have for example,=20
> on occasion, had three disks set up where 1/3 of each was devoted to a=20
> RAID-0 very fast striping set for data transfers that had to be fast=20
> but if they were lost it wasn't critical, and 2/3 was set up as RAID-5=20
> for reliability of another set of data.
>
> I understand this may not be optimal in some situations, but some of=20
> us don't have thousands of dollars for SCSI HW RAID controllers.

You can make life easier by creating several raid arrays on the same=20
disks and tie them together with LVM.
For example split your three 160GB drives into 4 partitions each and=20
create a raid over the three disks.

sda -> sda1+sda2+sda3+sda4, etc.
md0 =3D sda1+sdb1+sdc1, md1=3Dsda2+sdb2+sdc2, etc.

Markus

--=20
  Markus Baertschi             Phone: ++41 (21) 807 1677
  Bas du Ross=EF=BF=BD 14b             Fax  : ++41 (21) 807 1678
  CH-1163, Etoy                Email: markus@markus.org
  Switzerland                  Homepage: www.markus.org
