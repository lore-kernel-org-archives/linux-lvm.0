Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8ID7TLm026594
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 09:07:29 -0400
Received: from ey-out-2122.google.com (ey-out-2122.google.com [74.125.78.24])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8ID7J2t022230
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 09:07:20 -0400
Received: by ey-out-2122.google.com with SMTP id 22so272474eye.23
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 06:07:19 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 18 Sep 2009 15:07:19 +0200
Message-ID: <29ae894c0909180607t2cffb41bjec5a8406b601f0fb@mail.gmail.com>
From: brem belguebli <brem.belguebli@gmail.com>
Content-Type: multipart/alternative; boundary=0016e6d77e9cdd60120473d9cfc7
Subject: [linux-lvm] Ambiguous mirror log option
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

--0016e6d77e9cdd60120473d9cfc7
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I've been struggling with lvcreate for more than  a hour to create a
mirror'ed LV with on disk log, with no success (I'm ashamed! :-| )


Here's what I typed on a VG (with 2 X 8678 4MB extents free), it's not a
free space issue...

lvcreate -m1 --mirrorlog disk  -L 9G -n lvolvm1 VMVG, it complains about
2304 more extents required (wich make the exact size of the LV I want to
create), plus where to define the log device to use ?

same command whith --corelog (instead of --mirrorlog disk) succeeds.

Same command without any of these 2 options fails with the same  complain as
the first (man page says that default no option == mirrolog disk).

Any tip ?

Regards

--0016e6d77e9cdd60120473d9cfc7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div>
<div>=A0</div>
<div>I&#39;ve been struggling with lvcreate for more than=A0 a hour to crea=
te a mirror&#39;ed LV with on disk log, with no success (I&#39;m ashamed! :=
-| )</div>
<div>=A0</div>
<div>=A0</div>
<div>Here&#39;s what I typed on a VG (with 2 X 8678 4MB extents free), it&#=
39;s not a free space issue...</div>
<div>=A0</div>
<div>lvcreate -m1 --mirrorlog disk=A0 -L 9G -n lvolvm1 VMVG, it complains a=
bout 2304 more extents required (wich make the exact size of the LV I want =
to create), plus where to define the log device to use ?</div>
<div>=A0</div>
<div>same command whith --corelog (instead of --mirrorlog disk) succeeds. <=
/div>
<div>=A0</div>
<div>Same command without any of these 2 options fails with the same=A0 com=
plain as the first (man page says that default no option =3D=3D mirrolog di=
sk).</div>
<div>=A0</div>
<div>Any tip ?</div>
<div>=A0</div>
<div>Regards</div>

--0016e6d77e9cdd60120473d9cfc7--
