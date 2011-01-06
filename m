Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p067mjBM019685
	for <linux-lvm@redhat.com>; Thu, 6 Jan 2011 02:48:45 -0500
Received: from mail-gw0-f46.google.com (mail-gw0-f46.google.com [74.125.83.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id p067mZYB027836
	for <linux-lvm@redhat.com>; Thu, 6 Jan 2011 02:48:35 -0500
Received: by gwj20 with SMTP id 20so6770147gwj.33
	for <linux-lvm@redhat.com>; Wed, 05 Jan 2011 23:48:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTikWD6Yozmh_wkquSu3cD-wVS4pfnF=HfxC6Lrq9@mail.gmail.com>
References: <AANLkTikWD6Yozmh_wkquSu3cD-wVS4pfnF=HfxC6Lrq9@mail.gmail.com>
Date: Thu, 6 Jan 2011 08:48:34 +0100
Message-ID: <AANLkTikWS_0Y-tz8crd6EjR23onJG3DkWoBUJALTKZTE@mail.gmail.com>
From: Miro Moman <miromoman@gmail.com>
Content-Type: multipart/alternative; boundary=0016e650966c938ed4049928baef
Subject: Re: [linux-lvm] Recovering pre-existing data after vgcreate
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

--0016e650966c938ed4049928baef
Content-Type: text/plain; charset=ISO-8859-1

OK, I think I have recovered all the data.

First I removed the lv, the vg and the pv (in this order) I had created for
/dev/sdc1.

Next I run:

fsck.ext4 /dev/sdc1

This was quick and I believe it was enough to solve the problem. Yet, just
in case, I also run:

fsck.ext4 -cDfty -C 0 /dev/sdc1

I am making a backup on a external drive right now. Then, I will reformat,
reconfigure the lvm and finally transfer the data, which I guess it is what
I should have done from the beginning...




On Wed, Jan 5, 2011 at 4:46 PM, Miro Moman <miromoman@gmail.com> wrote:

> Hello,
>
> By mistake I have run pvcreate, vgcreate and lvcreate on an entire drive
> with pre-existing data. Before it was a ext4-formatted drive with just one
> partition spamming the entire drive and no lvm. I have not formatted it
> after running lvcreate.
>
> Would it be possible to recover the data or is it lost forever?
>
> Best regards,
>
> Miro
>
>


-- 
http://www.edelmiromoman.eu/

--0016e650966c938ed4049928baef
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OK, I think I have recovered all the data.<br><br>First I removed the lv, t=
he vg and the pv (in this order) I had created for /dev/sdc1.<br><br>Next I=
 run:<br><br>fsck.ext4 /dev/sdc1<br><br>This was quick and I believe it was=
 enough to solve the problem. Yet, just in case, I also run:<br>
<br>fsck.ext4 -cDfty -C 0 /dev/sdc1<br><br>I am making a backup on a extern=
al drive right now. Then, I will reformat, reconfigure the lvm and finally =
transfer the data, which I guess it is what I should have done from the beg=
inning...<br>
<br><br><br><br><div class=3D"gmail_quote">On Wed, Jan 5, 2011 at 4:46 PM, =
Miro Moman <span dir=3D"ltr">&lt;<a href=3D"mailto:miromoman@gmail.com">mir=
omoman@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.=
8ex; padding-left: 1ex;">
Hello,<br><br>By mistake I have run pvcreate, vgcreate and lvcreate on an e=
ntire drive with pre-existing data. Before it was a ext4-formatted drive wi=
th just one partition spamming the entire drive and no lvm. I have not form=
atted it after running lvcreate.<br>

<br>Would it be possible to recover the data or is it lost forever?<br><br>=
Best regards,<br><font color=3D"#888888"><br>Miro<br><br>
</font></blockquote></div><br><br clear=3D"all"><br>-- <br><a href=3D"http:=
//www.edelmiromoman.eu/">http://www.edelmiromoman.eu/</a><br>

--0016e650966c938ed4049928baef--
