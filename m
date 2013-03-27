Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2RIN7NU028249
	for <linux-lvm@redhat.com>; Wed, 27 Mar 2013 14:23:07 -0400
Received: from mail.bmsi.com (mail.bmsi.com [68.106.146.44])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2RIN4RE027053
	for <linux-lvm@redhat.com>; Wed, 27 Mar 2013 14:23:06 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id r2RIN2h6013846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 27 Mar 2013 14:23:02 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by bmsred.bmsi.com (8.14.4/8.14.4) with ESMTP id r2RILsKF031869
	for <linux-lvm@redhat.com>; Wed, 27 Mar 2013 14:21:55 -0400
Date: Wed, 27 Mar 2013 14:21:54 -0400 (EDT)
From: Stuart D Gathman <stuart@bmsi.com>
In-Reply-To: <FFEB7E95-4D32-48DD-ACE4-83797C284C42@googlemail.com>
Message-ID: <alpine.LRH.2.03.1303271415330.31461@bmsi.com>
References: <FAAB9C9B-FCA0-43CB-8B2C-F4F389941AAE@me.com>
	<533CFD97-2715-4B1C-A8C5-02161911747D@googlemail.com>
	<51509ECB.4050901@bmsi.com>
	<244E0086-C561-4034-BF26-31DFC419B72F@googlemail.com>
	<5150B555.4010207@bmsi.com>
	<0FEAF33E-7395-4820-9732-AFE70D3B5877@googlemail.com>
	<5150C1F8.8090107@bmsi.com>
	<CA+iDeo3WTK1gEiVzdmqA=kJ4nksZH-P76O1pBCL3MCTeme4zqg@mail.gmail.com>
	<5151A59B.5010909@bmsi.com>
	<alpine.LRH.2.03.1303270026120.27414@bmsi.com>
	<FFEB7E95-4D32-48DD-ACE4-83797C284C42@googlemail.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463799287-1176303886-1364408515=:31461"
Subject: Re: [linux-lvm] vg disappeared after replacing disc in raid10
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
To: LVM general discussion and development <linux-lvm@redhat.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463799287-1176303886-1364408515=:31461
Content-Type: TEXT/PLAIN; charset="iso-8859-15"; format="flowed"
Content-Transfer-Encoding: quoted-printable

On Mar 27, Bj=EF=BF=BDrn Nadrowski transmitted in part:

> What do you think I should do?
> restore the beginning of the device using the file md0.txt?

At this point, since you know where the metadata is going (and has
already been wiped out), and you have a good metadata (that you can
look at with an editor and see your LVs), I would use vgcfgrestore=20
to restore your good metadata backup.  (If not produced with
vgcfgbackup, compare with one that is).

Be careful not to modify any LVs until you have checked that they
are not scrambled.  Any mounts should be read-only, any fscks should
be with -n.

It the device is already listed in pvs, it is already a PV.  It must be,
because you claim that you see the new (empty) VG.

You will need to deactivate the new VG before using vgcfgrestore,
e.g. vgchange -an emptyvg.

If there is any way to backup stuff before attempted recovery, do so.

After vgcfgrestore, do vgscan and lvs.
---1463799287-1176303886-1364408515=:31461--
