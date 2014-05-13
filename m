Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s4D5rbqQ020359
	for <linux-lvm@redhat.com>; Tue, 13 May 2014 01:53:37 -0400
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4D5raXe026886
	for <linux-lvm@redhat.com>; Tue, 13 May 2014 01:53:36 -0400
Received: by mail-ie0-f181.google.com with SMTP id rl12so1626899iec.12
	for <linux-lvm@redhat.com>; Mon, 12 May 2014 22:53:36 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 13 May 2014 10:53:36 +0500
Message-ID: <CAAKRE72CA+c2waO_g5xAdyocB58UvzUgqi26RQUGZZTe0TAVog@mail.gmail.com>
From: Umar Draz <unix.co@gmail.com>
Content-Type: multipart/alternative; boundary=047d7bdc12344e897804f941af8b
Subject: [linux-lvm] /dev/mapper entries
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

--047d7bdc12344e897804f941af8b
Content-Type: text/plain; charset=UTF-8

Hi All

I have 2 systems where I have shared SAN sotrage, I am using LVM without
cluster.

If I create a logical volume on server1 and then on server2 (vgchange
--refresh or vgchange -a y) I can get that logical volume on server2 as
well.

The same thing I am using on volume deletion e.g.

If I remove volume from server1 its properly remove the volume and also all
of its entries, and then I refresh the volume group on server2 its also
refresh its self but a entry in /dev/mapper not removing

how to refresh this /dev/mapper/ on other server while deleting volumes

Br.

Umar

--047d7bdc12344e897804f941af8b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All<div><br></div><div>I have 2 systems where I have sh=
ared SAN sotrage, I am using LVM without cluster.</div><div><br></div><div>=
If I create a logical volume on server1 and then on server2 (vgchange --ref=
resh or vgchange -a y) I can get that logical volume on server2 as well.</d=
iv>
<div><br></div><div>The same thing I am using on volume deletion e.g.</div>=
<div><br></div><div>If I remove volume from server1 its properly remove the=
 volume and also all of its entries, and then I refresh the volume group on=
 server2 its also refresh its self but a entry in /dev/mapper not removing=
=C2=A0</div>
<div><br></div><div>how to refresh this /dev/mapper/ on other server while =
deleting volumes</div><div><br></div><div>Br.</div><div><br></div><div>Umar=
</div></div>

--047d7bdc12344e897804f941af8b--
