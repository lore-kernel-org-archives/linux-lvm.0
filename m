Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r62FulUJ011391
	for <linux-lvm@redhat.com>; Tue, 2 Jul 2013 11:56:47 -0400
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r62FuioB030246
	for <linux-lvm@redhat.com>; Tue, 2 Jul 2013 11:56:45 -0400
Received: by mail-la0-f50.google.com with SMTP id dy20so5648545lab.23
	for <linux-lvm@redhat.com>; Tue, 02 Jul 2013 08:56:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130702150902.GD27779@IUPUI.Edu>
References: <CAFrGbuWP-aqh8MvGND=0rvuvXtpXqApBXAWxp-yi_ftnoxasWw@mail.gmail.com>
	<20130702150902.GD27779@IUPUI.Edu>
Date: Tue, 2 Jul 2013 17:56:43 +0200
Message-ID: <CAFrGbuVz+aOLvesbCU691fzx7d5N9_qWm13RYpddz8dYxgtA0w@mail.gmail.com>
From: Alessandro MACUZ <alessandro.macuz@gmail.com>
Content-Type: multipart/alternative; boundary=001a1133c6903f3edd04e0896416
Subject: Re: [linux-lvm] Forcing the lvconvert copy to be on a different
 physical disk
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--001a1133c6903f3edd04e0896416
Content-Type: text/plain; charset=ISO-8859-1

>
> It looks as though you simply specify the PV from which you want to
> allocate the new extents, after the LV you are mirroring.  That is, if
> you have a logical volume "LV" on /dev/sda1 and you want to mirror it
> onto /dev/sdb1:
>
>   lvconvert -m1 LV /dev/sdb1
>
> Later I think you would do likewise to remove the local image from
> /dev/sda1, leaving the image on /dev/sdb1:
>
>   lvconvert -m0 LV /dev/sda1
>
> *I have not yet done this*.  Please try it out on a test machine
> before risking production data.


That's it Mark.

Thanks!

--001a1133c6903f3edd04e0896416
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOE=
nZb"><div class=3D"h5">It looks as though you simply specify the PV from wh=
ich you want to</div>
</div>
allocate the new extents, after the LV you are mirroring. =A0That is, if<br=
>
you have a logical volume &quot;LV&quot; on /dev/sda1 and you want to mirro=
r it<br>
onto /dev/sdb1:<br>
<br>
=A0 lvconvert -m1 LV /dev/sdb1<br>
<br>
Later I think you would do likewise to remove the local image from<br>
/dev/sda1, leaving the image on /dev/sdb1:<br>
<br>
=A0 lvconvert -m0 LV /dev/sda1<br>
<br>
*I have not yet done this*. =A0Please try it out on a test machine<br>
before risking production data.</blockquote><div><br></div><div>That&#39;s =
it Mark.</div><div><br></div><div>Thanks!=A0</div></div>

--001a1133c6903f3edd04e0896416--
