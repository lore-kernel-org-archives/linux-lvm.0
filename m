Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4A7kIoB032174
	for <linux-lvm@redhat.com>; Mon, 10 May 2010 03:46:18 -0400
Received: from web7907.mail.in.yahoo.com (web7907.mail.in.yahoo.com
	[202.86.4.83])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o4A7k8nk002575
	for <linux-lvm@redhat.com>; Mon, 10 May 2010 03:46:09 -0400
Message-ID: <22816.63214.qm@web7907.mail.in.yahoo.com>
Date: Mon, 10 May 2010 13:16:06 +0530 (IST)
From: andiket a <truly_linux@yahoo.co.in>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-2013236721-1273477566=:63214"
Subject: [linux-lvm] LVM multiple Snpshots implementation query
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

--0-2013236721-1273477566=:63214
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

If there are multiple snapshots then write to origin is an expensive operat=
ion.
My understanding after looking at the code of orig_wirte() is that if a wri=
te comes on a chunk on orig device then cow is initiated for all the snapsh=
ots.
This is an expensive operation for sure.

Does anyone know if there was any reason behind implementing it like this?

Thanks,
Andiket.
=0A=0A
--0-2013236721-1273477566=:63214
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<table cellspacing=3D"0" cellpadding=3D"0" border=3D"0" ><tr><td valign=3D"=
top" style=3D"font: inherit;">Hi,<br><br>If there are multiple snapshots th=
en write to origin is an expensive operation.<br>My understanding after loo=
king at the code of orig_wirte() is that if a write comes on a chunk on ori=
g device then cow is initiated for all the snapshots.<br>This is an expensi=
ve operation for sure.<br><br>Does anyone know if there was any reason behi=
nd implementing it like this?<br><br>Thanks,<br>Andiket.<br></td></tr></tab=
le><br>
--0-2013236721-1273477566=:63214--
