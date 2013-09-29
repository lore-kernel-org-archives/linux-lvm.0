Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8TKMrsP011884
	for <linux-lvm@redhat.com>; Sun, 29 Sep 2013 16:22:53 -0400
Received: from mail-vb0-f47.google.com (mail-vb0-f47.google.com
	[209.85.212.47])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8TKMqYU021675
	for <linux-lvm@redhat.com>; Sun, 29 Sep 2013 16:22:53 -0400
Received: by mail-vb0-f47.google.com with SMTP id h10so3167721vbh.6
	for <linux-lvm@redhat.com>; Sun, 29 Sep 2013 13:22:52 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 29 Sep 2013 14:22:52 -0600
Message-ID: <CADfj0ArxrmGA56dWiyjTPCL8z=iAdHtQV7NHEqEvZbuPd+4_VQ@mail.gmail.com>
From: Grzegorz Powiedziuk <gpowiedziuk@gmail.com>
Content-Type: multipart/alternative; boundary=bcaec547ca15ee7f9104e78b7baf
Subject: [linux-lvm] combined linear + striped
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

--bcaec547ca15ee7f9104e78b7baf
Content-Type: text/plain; charset=ISO-8859-1

Hello everyone.
I am trying to create a logical volume but my setup is a little bit
unusual.

I have 400 disks over here. All these disks live on 4 separate raids 5
(ibm ds6000).
So stripping across disks within a raid doesn't make any sens.
But, what I'd like to do is to stripe it across separate raids.

This is how I see it

Raid a - disks 1001-1100
Raid b - disks 2001-2100
Raid c - disks 3001-3100
Raid d - disks 4001-3100

Stripping would be across every set of 4 disks: 1001,2001,3001,4001 +
1002,2002,3002,4002 ... and so on.

And all stripped sets would be combined in to one big LV.
Is it even possible?

I know that I can just create a stripped volume across all 400 volumes but
it doesn't really make sens in this set up does it?


Many thanks!
Gregory

--bcaec547ca15ee7f9104e78b7baf
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div><div><div><div><div><di=
v><div>Hello everyone. <br></div>I am trying to create a logical volume but=
 my setup is a little bit unusual. <br><br></div>I have 400 disks over here=
. All these disks live on 4 separate raids 5=A0 (ibm ds6000). <br>
</div>So stripping across disks within a raid doesn&#39;t make any sens. <b=
r></div>But, what I&#39;d like to do is to stripe it across separate raids.=
 <br><br></div>This is how I see it<br><br></div>Raid a - disks 1001-1100<b=
r>
</div>Raid b - disks 2001-2100<br></div>Raid c - disks 3001-3100<br></div>R=
aid d - disks 4001-3100<br><br></div>Stripping would be across every set of=
 4 disks: 1001,2001,3001,4001 + 1002,2002,3002,4002 ... and so on. <br>
<br></div>And all stripped sets would be combined in to one big LV. <br>Is =
it even possible? <br><br>I know that I can just create a stripped volume a=
cross all 400 volumes but it doesn&#39;t really make sens in this set up do=
es it? <br>
</div><br><br></div>Many thanks!<br>Gregory</div>

--bcaec547ca15ee7f9104e78b7baf--
