Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDD745EDEA
	for <linux-lvm@redhat.com>; Mon,  5 Mar 2018 08:38:00 +0000 (UTC)
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9DBC383F3E
	for <linux-lvm@redhat.com>; Mon,  5 Mar 2018 08:37:59 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id g2so19640444qkd.12
	for <linux-lvm@redhat.com>; Mon, 05 Mar 2018 00:37:59 -0800 (PST)
MIME-Version: 1.0
From: Damon Wang <damon.devops@gmail.com>
Date: Mon, 5 Mar 2018 16:37:58 +0800
Message-ID: <CABZYMH73Z+u05HrsqaOGighaav0Rb4TT4ttDmiB8Z6x1Xz20nA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="001a114a855c4256470566a63e7a"
Subject: [linux-lvm] [lvmlockd] Refresh lvmlockd leases after sanlock changes
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

--001a114a855c4256470566a63e7a
Content-Type: text/plain; charset="UTF-8"

Hi all,

I made a environment lvm + lvmlockd + sanlock.

After active a lv with exclusive, we can see lock status via "lvmlockctl
-i" or "sanlock status" and it must be agreed.

But if use "sanlock client release -r xxxxxxx" to release the lock
manually, "lvmlockctl -i" shows as previous which means lvmlockd still
thinks the lock held, meanwhile other hosts now can get the lock.

So is there any way to refresh lock lease inside lvmlockd?

Thanks!

Damon


P.S

Why I have such question and environment?

I want to run vms on some hosts with a SAN, my plan is all hosts will login
to SAN and provide a lun as lvm pv. Each vm gets a thin lv from lvm as root
volume, and maybe some other thin lvs as data volume. So lvmlockd will
assurance only one host will change metadata at same time, and lvmthin will
provide thin provision.

But if want to live migrate the vm, it could be difficult since thin lv can
only be exclusive active on one host, if you want to active on another
host, the only way I find is use sanlock to release it manually. If you
have a better way, please tell me and thanks a loooot !!!

--001a114a855c4256470566a63e7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I made a environment lvm + lvml=
ockd + sanlock.</div><div><br></div><div>After active a lv with exclusive, =
we can see lock status via &quot;lvmlockctl -i&quot; or &quot;sanlock statu=
s&quot; and it must be agreed.</div><div><br></div><div>But if use &quot;sa=
nlock client release -r xxxxxxx&quot; to release the lock manually, &quot;l=
vmlockctl -i&quot; shows as previous which means lvmlockd still thinks the =
lock held, meanwhile other hosts now can get the lock.</div><div><br></div>=
<div>So is there any way to refresh lock lease inside lvmlockd?</div><div><=
br></div><div>Thanks!</div><div><br></div><div>Damon</div><div>=C2=A0</div>=
<div><br></div><div>P.S</div><div><br></div><div>Why I have such question a=
nd=C2=A0<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:small;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline">environment?</span></div><div><span style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-s=
tyle:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-wei=
ght:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transfo=
rm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,25=
5);text-decoration-style:initial;text-decoration-color:initial;float:none;d=
isplay:inline"><br></span></div><div>I want to run vms on some hosts with a=
 SAN, my plan is all hosts will login to SAN and provide a lun as lvm pv. E=
ach vm gets a thin lv from lvm as root volume, and maybe some other thin lv=
s as data volume. So lvmlockd will assurance only one host will change meta=
data at same time, and lvmthin will provide thin provision.</div><div><br><=
/div><div>But if want to live migrate the vm, it could be difficult since t=
hin lv can only be exclusive active on one host, if you want to active on a=
nother host, the only way I find is use sanlock to release it manually. If =
you have a better way, please tell me and thanks a loooot !!!</div></div>

--001a114a855c4256470566a63e7a--
