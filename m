Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6GI2IEt012525
	for <linux-lvm@redhat.com>; Mon, 16 Jul 2012 14:02:19 -0400
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6GI2F3e021941
	for <linux-lvm@redhat.com>; Mon, 16 Jul 2012 14:02:16 -0400
Received: by wibhr14 with SMTP id hr14so2485189wib.9
	for <linux-lvm@redhat.com>; Mon, 16 Jul 2012 11:02:15 -0700 (PDT)
MIME-Version: 1.0
Sender: fvzwieten@gmail.com
Date: Mon, 16 Jul 2012 20:02:14 +0200
Message-ID: <CALVifsZtgYc3FmNmK0bXG=QqF-oTQLAFPr+BUBcEv05qOu=sCQ@mail.gmail.com>
From: Fred van Zwieten <fvzwieten@vxcompany.com>
Content-Type: multipart/alternative; boundary=f46d0418281ad7336c04c4f63a0f
Subject: [linux-lvm] LVM roadmap info
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

--f46d0418281ad7336c04c4f63a0f
Content-Type: text/plain; charset=UTF-8

Hi there,

Not sure is this is the right mailing list (maybe the DM mailinglist is
better for this), but here goes:

I want to know if there is some roadmap info somewhere on LVM / DM. I see
new features like thin provisioning and a new snapshot mechanism popping
up. Wonderful stuff and it makes me wonder what else is in the pipeline? I
especially wonder what is the status on the following functionalities:

1. Replication. There is DRBD and ELVM, but there are some references on
the Net on Device Mapper Remote Replication Target from Heinz Mauelshagen,
with cool features like fan-out and cascading replication.
2. Block level deduplication (inline and/or post process)
3. HSM functionality, of auto tiering between devices
4. Caching (where ie a SSD or RAMFS device can work as a black level cache
for ie a SATA device)

Is it planned to have thee kind of features LVM / DM or is this passed on
to the filesystem level (hope not)?

Thanks

--f46d0418281ad7336c04c4f63a0f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi there,<div><br></div><div>Not sure is this is the right mailing list (ma=
ybe the DM mailinglist is better for this), but here goes:</div><div><br></=
div><div>I want to know if there is some roadmap info somewhere on LVM / DM=
. I see new features like thin provisioning and a new snapshot mechanism po=
pping up.=C2=A0Wonderful=C2=A0stuff and it makes me wonder what else is in =
the pipeline? I especially wonder what is the status on the following funct=
ionalities:</div>
<div><br></div><div>1. Replication. There is DRBD and ELVM, but there are s=
ome references on the Net on Device Mapper Remote Replication Target from H=
einz Mauelshagen, with cool features like fan-out and cascading replication=
.</div>
<div>2. Block level deduplication (inline and/or post process)</div><div>3.=
 HSM functionality, of auto tiering between devices</div><div>4. Caching (w=
here ie a SSD or RAMFS device can work as a black level cache for ie a SATA=
 device)</div>
<div><br></div><div>Is it planned to have thee kind of features LVM / DM or=
 is this passed on to the filesystem level (hope not)?<br><br>
</div><div>Thanks</div>

--f46d0418281ad7336c04c4f63a0f--
