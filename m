Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j728vJV00382
	for <linux-lvm@redhat.com>; Tue, 2 Aug 2005 04:57:19 -0400
Received: from anubis.medic.chalmers.se (anubis.medic.chalmers.se
	[129.16.30.218])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j728v7Ys013646
	for <linux-lvm@redhat.com>; Tue, 2 Aug 2005 04:57:13 -0400
Received: from [192.168.1.4]
	(c-2d31e353.1023-1-64736c10.cust.bredbandsbolaget.se [83.227.49.45])
	by anubis.medic.chalmers.se (Postfix) with ESMTP id 3D91B4F76
	for <linux-lvm@redhat.com>; Tue,  2 Aug 2005 10:57:04 +0200 (CEST)
Message-ID: <42EF3574.2020301@me.chalmers.se>
Date: Tue, 02 Aug 2005 10:57:24 +0200
From: Thomas Svedberg <Thomas.Svedberg@me.chalmers.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Broken disk, any chances ?
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

So I have a broken disk (with root on LVM) and lost the block(s)=20
containing the LVM partition info. I have moved the entire disk to a=20
backup (dd_rescue) but can not find the LVM partition with any tools I=20
tried (gpart, testdisk). Am I f.cked or can I still get some data of=20
these lost partitions (3 ext2/3 partitions on that LVM VG) ?

--=20
/ Thomas
.......................................................................
  Thomas Svedberg
  Department of Applied Mechanics
  Chalmers University of Technology

  Address: SE-412 96 G=EF=BF=BDteborg, SWEDEN
  E-mail : Thomas.Svedberg@me.chalmers.se
.......................................................................
