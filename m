Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oBNDiuLF013476
	for <linux-lvm@redhat.com>; Thu, 23 Dec 2010 08:44:56 -0500
Received: from mail-iy0-f174.google.com (mail-iy0-f174.google.com
	[209.85.210.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oBNDiiTa006538
	for <linux-lvm@redhat.com>; Thu, 23 Dec 2010 08:44:44 -0500
Received: by iyi12 with SMTP id 12so5186963iyi.33
	for <linux-lvm@redhat.com>; Thu, 23 Dec 2010 05:44:43 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 23 Dec 2010 19:14:43 +0530
Message-ID: <AANLkTi=fEi5wfgcOJpyXF6Nk6AWLVvC9sCYnP1NJcP+U@mail.gmail.com>
From: S U B A <jv.suri@gmail.com>
Content-Type: multipart/alternative; boundary=20cf304346c67e78f20498141209
Subject: [linux-lvm] How to use lvm with tmpfs
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

--20cf304346c67e78f20498141209
Content-Type: text/plain; charset=ISO-8859-1

Hi members,
                 Can tempfs be used with lvm, so that i can create a
snapshot of the filesystem mounted on the tmpfs. My actual goal is to create
tmpfs and sync all the files in that tmpfs to a remote storage. There can be
file writes during the sync ups, so i want to sync the partition without
losing any info. Creating an lvm partition can help in this scenario or
should try a different method?
Thanks for your help,
Suresh

--20cf304346c67e78f20498141209
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi members,<br></div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Can tempf=
s be used with lvm, so that i can create a snapshot of the filesystem mount=
ed on the tmpfs. My actual goal is to create tmpfs and sync all the files i=
n that tmpfs to a remote storage. There can be file writes during the sync =
ups, so i want to sync the partition without losing any info. Creating an l=
vm partition can help in this scenario or should try a different method?</d=
iv>
<div>Thanks for your help,=A0</div><div>Suresh=A0</div>

--20cf304346c67e78f20498141209--
