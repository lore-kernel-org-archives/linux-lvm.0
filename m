Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8FLIbv8028127
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2015 17:18:37 -0400
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0089.outbound.protection.outlook.com [157.56.111.89])
	by mx1.redhat.com (Postfix) with ESMTPS id 8C4951BE353
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2015 21:18:36 +0000 (UTC)
Received: by igxx6 with SMTP id x6so20910164igx.1
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2015 14:18:27 -0700 (PDT)
MIME-Version: 1.0
From: Aaron Young <aaron.young@ctl.io>
Date: Tue, 15 Sep 2015 21:18:18 +0000
Message-ID: <CAFrnvh2ffR69QFK-Ue=OStbiSuKw+sRx43+PyEdwo8sFqkfcMw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="089e0111c1d6173a59051fcfb936"
Subject: [linux-lvm] lvm metadata sequence number reverts
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

--089e0111c1d6173a59051fcfb936
Content-Type: text/plain; charset="UTF-8"

Hello, I'm deep into debugging an issue we have with a disk driver of ours
and LVM.

Long story short:

create vg -> seqno 1
create lv1 -> seqno 2
create lv2 -> seqno 3
create lv3 -> seqno 4
create lv4 -> seqno 5
<clear our device cache> (note, this generates no IO)
vgdisplay: seqno = 4, lv4 is missing

* This happens only after dozens to hundreds of iterations. Most of the
time it is fine.

I dd all the metadata blocks off of the pv, yep, seqno5 is on disk metadata
area perfectly fine. But the system believes 4 is the current version.
Shouldn't the system be using the highest value? Or is it stored somewhere?
What mechanism is responsible for changing the seqno? And where does it
change it? (Not the metadata contents, just the number)

Thanks,

Aaron

--089e0111c1d6173a59051fcfb936
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div><div><div>Hello, I&#39;=
m deep into debugging an issue we have with a disk driver of ours and LVM.<=
br><br></div>Long story short: <br></div><br></div>create vg -&gt; seqno 1<=
br></div>create lv1 -&gt; seqno 2<br></div>create lv2 -&gt; seqno 3<br></di=
v>create lv3 -&gt; seqno 4<br></div><div>create lv4 -&gt; seqno 5<br></div>=
&lt;clear our device cache&gt; (note, this generates no IO)<br></div>vgdisp=
lay: seqno =3D 4, lv4 is missing<br><br></div><div>* This happens only afte=
r dozens to hundreds of iterations. Most of the time it is fine.<br></div><=
div><br></div><div>I dd all the metadata blocks off of the pv, yep, seqno5 =
is on disk metadata area perfectly fine. But the system believes 4 is the c=
urrent version. Shouldn&#39;t the system be using the highest value? Or is =
it stored somewhere? What mechanism is responsible for changing the seqno? =
And where does it change it? (Not the metadata contents, just the number)<b=
r><br></div><div>Thanks, <br><br></div><div>Aaron<br></div></div>

--089e0111c1d6173a59051fcfb936--
