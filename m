Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o69NlRiO016163
	for <linux-lvm@redhat.com>; Fri, 9 Jul 2010 19:47:27 -0400
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o69NlEmn007350
	for <linux-lvm@redhat.com>; Fri, 9 Jul 2010 19:47:14 -0400
Received: by wyf23 with SMTP id 23so2393872wyf.33
	for <linux-lvm@redhat.com>; Fri, 09 Jul 2010 16:47:13 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 9 Jul 2010 19:47:12 -0400
Message-ID: <AANLkTikfqJRdgmf2ib9pz23p2IAz-fogXaSzfCv0tgEB@mail.gmail.com>
From: Michael Closson <closms@gmail.com>
Content-Type: multipart/alternative; boundary=0016e656b598a87b00048afd05a4
Subject: [linux-lvm] efficiently copying snapshot data.
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

--0016e656b598a87b00048afd05a4
Content-Type: text/plain; charset=ISO-8859-1

Say I am using lvm to store VM disks.  I have a logical volume with the
master image and the vms are snapshots created from the master LV.

I want to save this VM, copy the memory and snapshot data to a different
machine with the same master LV, and then restore the VM.

Is it possible?  How can I efficiently copy only the snapshot?

Thanks,
Mike C

--0016e656b598a87b00048afd05a4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Say I am using lvm to store VM disks. =A0I have a logical volume with the m=
aster image and the vms are snapshots created from the master LV.<div><br><=
/div><div>I want to save this VM, copy the memory and snapshot data to a di=
fferent machine with the same master LV, and then restore the VM.</div>
<div><br></div><div>Is it possible? =A0How can I efficiently copy only the =
snapshot?</div><div><br></div><div>Thanks,</div><div>Mike C</div><div><br><=
/div>

--0016e656b598a87b00048afd05a4--
