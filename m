Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q77DIlHQ022215
	for <linux-lvm@redhat.com>; Tue, 7 Aug 2012 09:18:47 -0400
Received: from mail-vb0-f46.google.com (mail-vb0-f46.google.com
	[209.85.212.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q77DIjTY008284
	for <linux-lvm@redhat.com>; Tue, 7 Aug 2012 09:18:45 -0400
Received: by vbbff1 with SMTP id ff1so4006203vbb.33
	for <linux-lvm@redhat.com>; Tue, 07 Aug 2012 06:18:45 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 7 Aug 2012 09:18:45 -0400
Message-ID: <CAH+HAhxg1ArkSG0DguGj5OBvxwL4CRBZzV8HVUvYDo+wMrOsWg@mail.gmail.com>
From: Reza Gholdor <gholdorreza@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b66fcad7fcd3c04c6acd5f6
Subject: [linux-lvm] Translating device name from sar to a filesystem
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

--047d7b66fcad7fcd3c04c6acd5f6
Content-Type: text/plain; charset=ISO-8859-1

Hi All,
I am a DBA trying to determine if I/O is a bottleneck for an Oracle
11g database running on RHEL 5.7 x64 on VmWare ESXi 4.1. I monitor disk
activity using "sar -d" and get device names like dev8-0 and dev253-17. I
have tried to translate these device names to filesystem names without
succes. Can someone provide instructions on how to find filesystem build on
a device name from "sar -d"? Are there any giudeline or better commands for
determining if I/O is a bottleneck?
Appreciate any help.
Regards,
Reza

--047d7b66fcad7fcd3c04c6acd5f6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi All,</div><div>I am a DBA trying to determine if I/O is a bottlenec=
k for an Oracle 11g=A0database running on RHEL 5.7 x64 on VmWare ESXi 4.1. =
I monitor disk activity using &quot;sar -d&quot; and get device names like =
dev8-0 and dev253-17. I have tried to translate these device names to files=
ystem names without succes. Can someone provide instructions on how to find=
 filesystem build on a device name from &quot;sar -d&quot;? Are there any g=
iudeline or better commands for determining if I/O is a bottleneck?</div>
<div>Appreciate any help.</div><div>Regards,</div><div>Reza</div>

--047d7b66fcad7fcd3c04c6acd5f6--
