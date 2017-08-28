Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44F6260605
	for <linux-lvm@redhat.com>; Mon, 28 Aug 2017 12:41:16 +0000 (UTC)
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D5E86461C1
	for <linux-lvm@redhat.com>; Mon, 28 Aug 2017 12:41:14 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id e2so1585701qta.0
	for <linux-lvm@redhat.com>; Mon, 28 Aug 2017 05:41:14 -0700 (PDT)
MIME-Version: 1.0
From: Kalyana sundaram <kalyanceg@gmail.com>
Date: Mon, 28 Aug 2017 18:11:13 +0530
Message-ID: <CABWX_dqg3za8oGq9-ohoCvDiJbmLs36Jgqy2a6NSa82Gxrr8tg@mail.gmail.com>
Content-Type: multipart/alternative; boundary="001a1140715e3032580557cf9c89"
Subject: [linux-lvm] Distributed Locking of LVM
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

--001a1140715e3032580557cf9c89
Content-Type: text/plain; charset="UTF-8"

We have a shared iscsi disk at all our boxes, with one vg. We are using
clvm to manage locks to create extend activate delete list.
CLVM is tedious to manage especially especially due to reboot if locking is
struck somewhere. Instead we are thinking of modifying file_locking.c to
get lock with distributed store like zookeeper or redis and on success run
the above command, on failure backoff and try again
The external ocking code will sit at _file_lock_resource, case LCK_VG.
Do you think its risky. Is there some other way people handle it?

-- 
Kalyanasundaram
http://blogs.eskratch.com/
https://github.com/kalyanceg/

--001a1140715e3032580557cf9c89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We have a shared iscsi disk at all our boxes, with one vg.=
 We are using clvm to manage locks to create extend activate delete list.<b=
r>CLVM is tedious to manage especially especially due to reboot if locking =
is struck somewhere. Instead we are thinking of modifying file_locking.c to=
 get lock with distributed store like zookeeper or redis and on success run=
 the above command, on failure backoff and try again<br>The external ocking=
 code will sit at _file_lock_resource, case LCK_VG.=C2=A0<br>Do you think i=
ts risky. Is there some other way people handle it?<br clear=3D"all"><div><=
br></div>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_sign=
ature">Kalyanasundaram<br><a href=3D"http://blogs.eskratch.com/" target=3D"=
_blank">http://blogs.eskratch.com/</a><div><a href=3D"https://github.com/ka=
lyanceg/" target=3D"_blank">https://github.com/kalyanceg/</a><br></div></di=
v>
</div>

--001a1140715e3032580557cf9c89--
