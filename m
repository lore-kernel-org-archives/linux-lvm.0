Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t83M4sjL030083
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 3 Sep 2015 18:04:54 -0400
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mx1.redhat.com (Postfix) with ESMTPS id 5A651C0AAB10
	for <linux-lvm@redhat.com>; Thu,  3 Sep 2015 22:04:53 +0000 (UTC)
Received: by iofh134 with SMTP id h134so3966259iof.0
	for <linux-lvm@redhat.com>; Thu, 03 Sep 2015 15:04:52 -0700 (PDT)
MIME-Version: 1.0
From: Mike McCracken <mike.mccracken@canonical.com>
Date: Thu, 3 Sep 2015 15:04:33 -0700
Message-ID: <CAFBvFDAwXs=JQ3eBDdUSYLQ8ja+McY38VC0WiGK1bTQRgjZB2g@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a113eacc4fed8ec051edef85d
Subject: [linux-lvm] Does LVM always do 'dm suspend' when lvcreating a thin
	snapshot?
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
To: linux-lvm <linux-lvm@redhat.com>

--001a113eacc4fed8ec051edef85d
Content-Type: text/plain; charset=UTF-8

 When creating a thin snapshot of a thin volume, does LVM always freeze the
FS?

I see when I run lvcreate with -vvv that it sends the 'dm suspend' message
to the origin lv, but on looking at the code I wasn't quite able to
convince myself that it will always do that, or under what circumstances it
won't.

Thanks,
-mike

--001a113eacc4fed8ec051edef85d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">

<div style=3D"font-family:&#39;Helvetica Neue&#39;;font-size:14px">When cre=
ating a thin snapshot of a thin volume, does LVM always freeze the FS?<br><=
/div><div style=3D"font-family:&#39;Helvetica Neue&#39;;font-size:14px"><br=
></div><div style=3D"font-family:&#39;Helvetica Neue&#39;;font-size:14px">I=
 see=C2=A0when I run lvcreate=C2=A0with -vvv that it sends the &#39;dm susp=
end&#39; message to the origin lv, but on looking at the code I wasn&#39;t =
quite able to convince myself that it will always do that, or under what ci=
rcumstances it won&#39;t.</div><div style=3D"font-family:&#39;Helvetica Neu=
e&#39;;font-size:14px"><br></div><div style=3D"font-family:&#39;Helvetica N=
eue&#39;;font-size:14px">Thanks,</div><div style=3D"font-family:&#39;Helvet=
ica Neue&#39;;font-size:14px">-mike</div><div style=3D"font-family:&#39;Hel=
vetica Neue&#39;;font-size:14px"></div></div>

--001a113eacc4fed8ec051edef85d--
