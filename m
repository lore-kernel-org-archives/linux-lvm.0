Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0KHDxYL008027
	for <linux-lvm@redhat.com>; Tue, 20 Jan 2009 12:13:59 -0500
Received: from eu1sys200aog105.obsmtp.com (eu1sys200aog105.obsmtp.com
	[207.126.144.119])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id n0KHDgEo003911
	for <linux-lvm@redhat.com>; Tue, 20 Jan 2009 12:13:43 -0500
Received: by bwz5 with SMTP id 5so10166192bwz.6
	for <linux-lvm@redhat.com>; Tue, 20 Jan 2009 09:13:41 -0800 (PST)
Date: Tue, 20 Jan 2009 18:11:12 +0100
From: "F-D. Cami" <fcami@winsoft.fr>
Message-ID: <20090120181112.5523a424@winsoft.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] starting LVs on RAID stripe boundaries
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


Hi Linux-LVM,

I'm searching for some definitive information about how to make sure that l=
ogical
volumes start exactly at the beginning of a RAID stripe.

My hardware is an EMC Clariion CX3-40F array with a RHEL5 host.
The default stripe element size is 64 KB (128 blocks) on the CX3.

Both EMC and Red Hat recommend using fdisk or parted  to align the first pa=
rtition
to the start of a stripe boundary (128th block, 128x512=3D64KB) :
Red Hat : http://kbase.redhat.com/faq/docs/DOC-2893
EMC : "EMC CLARiiON Best Practices", PDF available on emc.com

After doing that. the first partition is now aligned, next I need to make s=
ure my logical
volumes are similarly aligned. However, after reading the LVM Howto on tldp=
.org,
the LVM wiki at redhat.com, and Alasdair Kergon's LinuxTag presentation at :
http://people.redhat.com/agk/talks/LVM2-LinuxTag2006/
I found no information on how to do that.=20

I'll now use some reasonable (?) assumptions :
* the physical extent size is a multiple of 64K (vgcreate's default is 4MB)=
 ;
* if physical extents are aligned, logical volumes are themselves aligned
  (lvcreate -l, --extents LogicalExtentsNumber) ;
* since PV, VG and LV infos are stored in PV metadata, the only possible PE
   misalignment culprit is PV metadata ;
* PV metadata size is a multiple of 64KB=20
 ( http://orezpraw.com/orezpraw.php/blogosphere/your-filesystem-starts-wher=
e )

Since 64KB is my stripe size, and metadata size is a multiple of 64KB,
pvcreate should do the RightThing(tm) with default options, i.e. start the
first PE at a multiple of the stripe size.

In other words, aligning the partition the PV uses to the stripe boundary a=
nd
using a PE size multiple of the stripe size insure that LVs get themselves =
created
on stripe boundaries.

Comments, please ?

Thanks,

Fran=C3=A7ois Cami
