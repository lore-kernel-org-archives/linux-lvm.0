Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6BAj8Ri022103
	for <linux-lvm@redhat.com>; Wed, 11 Jul 2012 06:45:08 -0400
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6BAj7M9015751
	for <linux-lvm@redhat.com>; Wed, 11 Jul 2012 06:45:08 -0400
Received: by lbbgm6 with SMTP id gm6so1875682lbb.33
	for <linux-lvm@redhat.com>; Wed, 11 Jul 2012 03:45:07 -0700 (PDT)
MIME-Version: 1.0
From: Morgan Cox <morgancoxuk@gmail.com>
Date: Wed, 11 Jul 2012 11:44:46 +0100
Message-ID: <CAGfHYAQg54kB4rRdCX1ubdi=K+LTBefw=AHELZeYb74XfNoXMg@mail.gmail.com>
Content-Type: multipart/alternative; boundary=e89a8f22c34f5062ac04c48b8a17
Subject: [linux-lvm] (simple question) Is it possible to specify a size to
 extend an LVM partition to ? rather than the amount to increase by?
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

--e89a8f22c34f5062ac04c48b8a17
Content-Type: text/plain; charset=ISO-8859-1

is it possible to specify a size to extend an LVM partition to ? rather
than the amount to increase by?
i.e say I have a 2GB partition and what to extend it to 10GB, I  know I
could use  lvextend --size +8G /dev/vgpool/whatever
but is there a command to increase to a specific amount ?

Cheers

--e89a8f22c34f5062ac04c48b8a17
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>is it possible to specify a size to extend an LVM partition to ? rathe=
r than the amount to increase by?</div><div>i.e say I have a 2GB partition =
and what to extend it to 10GB, I=A0=A0know I could use =A0lvextend --size +=
8G /dev/vgpool/whatever</div>

<div>but is there a command to increase to a specific amount ?</div><div><b=
r></div><div>Cheers</div><div><br></div>

--e89a8f22c34f5062ac04c48b8a17--
