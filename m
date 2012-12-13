Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qBD8N3LY028589
	for <linux-lvm@redhat.com>; Thu, 13 Dec 2012 03:23:03 -0500
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qBD8N2Hd008505
	for <linux-lvm@redhat.com>; Thu, 13 Dec 2012 03:23:02 -0500
Received: by mail-oa0-f46.google.com with SMTP id h16so1860568oag.33
	for <linux-lvm@redhat.com>; Thu, 13 Dec 2012 00:23:02 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 13 Dec 2012 09:23:01 +0100
Message-ID: <CAG2kNCyOSivGSfR6adJEZgfoJKnVksx=6+cWsvxWOfd5bHc=vw@mail.gmail.com>
From: Gianluca Cecchi <gianluca.cecchi@gmail.com>
Content-Type: multipart/alternative; boundary=bcaec54c526898dbba04d0b79f43
Subject: [linux-lvm] Pvmove while volume_ list is enabled freeze whole lvm
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

--bcaec54c526898dbba04d0b79f43
Content-Type: text/plain; charset=UTF-8

Hello,
I have rhel 5.8 wit lvm tags enabled (volume_ list).
In volume_ list I have
@intraclusternode1
Tag, so the main vg is active with its lv.
But then I issue pvmove command that fails because it cannot activate the
temporary mirror...But now on, all commands related to lvm, also for other
vg, completely freeze..Any way to unblock?I tried removing the volume_list
directive in lvm.conf, but no way...I would like to avoid doing power off
if possible..
Thanks
Gianluca

--bcaec54c526898dbba04d0b79f43
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hello,<br>
I have rhel 5.8 wit lvm tags enabled (volume_ list).<br>
In volume_ list I have<br>
@intraclusternode1 <br>
Tag, so the main vg is active with its lv.<br>
But then I issue pvmove command that fails because it cannot activate the t=
emporary mirror...But now on, all commands related to lvm, also for other v=
g, completely freeze..Any way to unblock?I tried removing the volume_list d=
irective in lvm.conf, but no way...I would like to avoid doing power off if=
 possible..<br>

Thanks<br>
Gianluca</p>

--bcaec54c526898dbba04d0b79f43--
