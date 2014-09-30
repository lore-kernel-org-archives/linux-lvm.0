Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8UFvOl9004053
	for <linux-lvm@redhat.com>; Tue, 30 Sep 2014 11:57:24 -0400
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8UFvJxe020014
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 30 Sep 2014 11:57:21 -0400
Received: by mail-wi0-f179.google.com with SMTP id d1so3861781wiv.0
	for <linux-lvm@redhat.com>; Tue, 30 Sep 2014 08:57:19 -0700 (PDT)
MIME-Version: 1.0
Sender: vase@selfip.ru
In-Reply-To: <20140930154918.GB9925@redhat.com>
References: <CACaajQu+i6wu1z86wzWa-x=HN_wWy6ByZBnLHzPy7E5Etpj6jw@mail.gmail.com>
	<542ABFC3.4000909@redhat.com>
	<CACaajQut7caHMw6nc-ZUbb=1NuYMZu-untY3y6XdXkk==K7+WA@mail.gmail.com>
	<20140930154918.GB9925@redhat.com>
From: Vasiliy Tolstov <v.tolstov@selfip.ru>
Date: Tue, 30 Sep 2014 19:57:04 +0400
Message-ID: <CACaajQsWk9kNZkUoVr7AUV=EFLgBhVrWYmrDmFu+1+vmunV_7Q@mail.gmail.com>
Content-Type: multipart/alternative; boundary=089e0149371c2ce65205044a7028
Subject: Re: [linux-lvm] thin pool and discards
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--089e0149371c2ce65205044a7028
Content-Type: text/plain; charset=UTF-8

2014-09-30 19:49 GMT+04:00 Mike Snitzer <snitzer@redhat.com>:

> You likely need this upstream commit:
> http://git.kernel.org/linus/19fa1a6756ed9e92daa9537c03b47d6b55cc2316
>
> Though that commit was tagged for stable.  So not sure.
>
> In general, upstream dm-thinp saw quite a few improvements that in
> combination results in a much more stable dm-thinp (particularly error
> handling from faults and out of space conditions).
>
> RHEL7 does include these changes.
>

Thanks! Also i'm try to check rhel 7 kernel sources...


-- 
Vasiliy Tolstov,
e-mail: v.tolstov@selfip.ru
jabber: vase@selfip.ru

--089e0149371c2ce65205044a7028
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
2014-09-30 19:49 GMT+04:00 Mike Snitzer <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:snitzer@redhat.com" target=3D"_blank">snitzer@redhat.com</a>&gt;</span=
>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":1e2" class=3D"a3s" style=
=3D"overflow:hidden">You likely need this upstream commit:<br>
<a href=3D"http://git.kernel.org/linus/19fa1a6756ed9e92daa9537c03b47d6b55cc=
2316" target=3D"_blank">http://git.kernel.org/linus/19fa1a6756ed9e92daa9537=
c03b47d6b55cc2316</a><br>
<br>
Though that commit was tagged for stable.=C2=A0 So not sure.<br>
<br>
In general, upstream dm-thinp saw quite a few improvements that in<br>
combination results in a much more stable dm-thinp (particularly error<br>
handling from faults and out of space conditions).<br>
<br>
RHEL7 does include these changes.</div></blockquote></div><br>Thanks! Also =
i&#39;m try to check rhel 7 kernel sources...<br><br clear=3D"all"><div><br=
></div>-- <br>Vasiliy Tolstov,<br>e-mail: <a href=3D"mailto:v.tolstov@selfi=
p.ru" target=3D"_blank">v.tolstov@selfip.ru</a><br>jabber: <a href=3D"mailt=
o:vase@selfip.ru" target=3D"_blank">vase@selfip.ru</a>
</div></div>

--089e0149371c2ce65205044a7028--
