Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s81ID8bR030486
	for <linux-lvm@redhat.com>; Mon, 1 Sep 2014 14:13:08 -0400
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s81ID54t007134
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 1 Sep 2014 14:13:05 -0400
Received: by mail-yh0-f41.google.com with SMTP id 29so3601863yhl.28
	for <linux-lvm@redhat.com>; Mon, 01 Sep 2014 11:13:04 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 1 Sep 2014 11:13:04 -0700
Message-ID: <CAAN_kG2zBvS1iVhdqO2zvQ2+QW-SpyM2PhHG2j+zhSFZbOmnRg@mail.gmail.com>
From: Timur Alperovich <timur@maginatics.com>
Content-Type: multipart/alternative; boundary=20cf303ea3744664a2050204f452
Subject: [linux-lvm] Data percentage too large after thin_dump
	--repair/thin_restore
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

--20cf303ea3744664a2050204f452
Content-Type: text/plain; charset=UTF-8

Hi there,

I'm using LVM 2.02.98 and encountered a metadata corruption issue. To
recover from it, I attempted to perform the following steps:
1. thin_check /dev/mapper/pool_tmeta
2. thin_dump /dev/mapper/pool_tmeta > /tmp/metadata
3. dd if=/dev/zero of=/dev/mapper/pool_tmeta
4. thin_restore -i /tmp/metadata -o /dev/mapper/pool_tmeta

All of the above steps have succeeded, however, when attempting to list the
_metadata\_percent_ field, I get an error:

user@thin_vm:~$ sudo lvs group/pool -o +metadata_percent
  Data percentage too large.
  dm_report_object: report function failed for field metadata_percent
  LV   VG         Attr      LSize   Pool Origin Data%  Move Log Copy%
Convert Meta%
  pool group twi-a-tz- 383.88g              34.56


The pool itself can now be activated, `thin_check` passes, and all the data
appears to be intact.

Is this a known issue and is there a workaround? I need to be able to
examine the _metadata\_percent_ field to make sure we don't exhaust the
metadata space.

Thank you,
Timur

--20cf303ea3744664a2050204f452
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div>Hi there,<br><br></div>=
I&#39;m using LVM 2.02.98 and encountered a metadata corruption issue. To r=
ecover from it, I attempted to perform the following steps:<br></div>1. thi=
n_check /dev/mapper/pool_tmeta<br>
</div>2. thin_dump /dev/mapper/pool_tmeta &gt; /tmp/metadata<br></div>3. dd=
 if=3D/dev/zero of=3D/dev/mapper/pool_tmeta<br></div>4. thin_restore -i /tm=
p/metadata -o /dev/mapper/pool_tmeta<br><br>All of the above steps have suc=
ceeded, however, when attempting to list the _metadata\_percent_ field, I g=
et an error:<br>
<br>user@thin_vm:~$ sudo lvs group/pool -o +metadata_percent<br>=C2=A0 Data=
 percentage too large.<br>=C2=A0 dm_report_object: report function failed f=
or field metadata_percent<br>=C2=A0 LV=C2=A0=C2=A0 VG=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 Attr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LSize=C2=A0=
=C2=A0 Pool Origin Data%=C2=A0 Move Log Copy%=C2=A0 Convert Meta% <br>
=C2=A0 pool group twi-a-tz- 383.88g=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 34.56<br><br><br></div>The pool its=
elf can now be activated, `thin_check` passes, and all the data appears to =
be intact.<br><br></div>Is this a known issue and is there a workaround? I =
need to be able to examine the _metadata\_percent_ field to make sure we do=
n&#39;t exhaust the metadata space.<br>
<br>Thank you,<br>Timur<br></div>

--20cf303ea3744664a2050204f452--
