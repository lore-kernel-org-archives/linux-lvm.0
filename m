Received: from mx1.redhat.com (ext-mx29.extmail.prod.ext.phx2.redhat.com
	[10.5.110.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6CB5165D7
	for <linux-lvm@redhat.com>; Tue, 22 Oct 2019 10:47:35 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E27A18C8902
	for <linux-lvm@redhat.com>; Tue, 22 Oct 2019 10:47:34 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id q78so1512713lje.5
	for <linux-lvm@redhat.com>; Tue, 22 Oct 2019 03:47:34 -0700 (PDT)
Received: from [192.168.1.103] (m83-185-244-38.cust.tele2.se. [83.185.244.38])
	by smtp.gmail.com with ESMTPSA id
	y24sm6567808lfy.20.2019.10.22.03.47.31 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Oct 2019 03:47:31 -0700 (PDT)
From: =?UTF-8?Q?Dalebj=c3=b6rk=2c_Tomas?= <tomas.dalebjork@gmail.com>
Message-ID: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
Date: Tue, 22 Oct 2019 12:47:30 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------1FDFE40FB0C6983501E14F49"
Content-Language: sv
Subject: [linux-lvm] exposing snapshot block device
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

This is a multi-part message in MIME format.
--------------1FDFE40FB0C6983501E14F49
Content-Type: text/plain; charset="windows-1252"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Hi

When you create a snapshot of a logical volume.

A new virtual dm- device will be created with the content of the changes=20
from the origin.

This cow device can than be used to read changed contents etc.


In case of an incident, this cow device can be used to read back the=20
changed content to its origin using the "lvmerge" command.


The question I have is if there is a way to couple an external cow=20
device to an empty equaly sized logical volume,

so that the empty logical volume is aware of that all changed content=20
are placed on this attached cow device?

If that is possible, than it will help making instant recovery of LV=20
volumes from an external source using native lvmerge command, from for=20
example a backup server.


[EMPTY LOGICAL VOLUME]
 =EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD ^
 =EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD =EF=BF=BD |
 =EF=BF=BD=EF=BF=BD =EF=BF=BD lvmerge
 =EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD |

[ATTACHED COW DEVICE]

Regards Tomas


--------------1FDFE40FB0C6983501E14F49
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dwindo=
ws-1252">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>Hi</p>
    <p>When you create a snapshot of a logical volume.</p>
    <p>A new virtual dm- device will be created with the content of the
      changes from the origin.</p>
    <p>This cow device can than be used to read changed contents etc.</p>
    <p><br>
    </p>
    <p>In case of an incident, this cow device can be used to read back
      the changed content to its origin using the "lvmerge" command.<br>
    </p>
    <p><br>
    </p>
    <p>The question I have is if there is a way to couple an external
      cow device to an empty equaly sized logical volume,</p>
    <p>so that the empty logical volume is aware of that all changed
      content are placed on this attached cow device?</p>
    <p>If that is possible, than it will help making instant recovery of
      LV volumes from an external source using native lvmerge command,
      from for example a backup server.</p>
    <p><br>
    </p>
    <font face=3D"Courier New, Courier, monospace">[EMPTY LOGICAL VOLUME]</=
font><br>
    <font face=3D"Courier New, Courier, monospace">=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD ^</font><br>
    <font face=3D"Courier New, Courier, monospace">=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD =EF=BF=BD |</font><br>
    <font face=3D"Courier New, Courier, monospace">=EF=BF=BD=EF=BF=BD =EF=
=BF=BD lvmerge</font><br>
    <font face=3D"Courier New, Courier, monospace">=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD |</font><br>
    <p><font face=3D"Courier New, Courier, monospace">[ATTACHED COW
        DEVICE]</font></p>
    <p>Regards Tomas<font face=3D"Courier New, Courier, monospace"><br>
      </font></p>
  </body>
</html>

--------------1FDFE40FB0C6983501E14F49--
