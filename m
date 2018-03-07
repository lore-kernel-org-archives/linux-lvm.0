Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 176E05D965
	for <linux-lvm@redhat.com>; Wed,  7 Mar 2018 00:29:03 +0000 (UTC)
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 547BC81DEC
	for <linux-lvm@redhat.com>; Wed,  7 Mar 2018 00:29:02 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id f5so326514uam.5
	for <linux-lvm@redhat.com>; Tue, 06 Mar 2018 16:29:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1520382103.15670.8.camel@gmail.com>
References: <1520382103.15670.8.camel@gmail.com>
From: Bjorn Pagen <bjornpagen@gmail.com>
Date: Tue, 6 Mar 2018 19:29:01 -0500
Message-ID: <CAARz7_gTkuCvfZbHpV0z9CRB0TstgwFJeYgz5wXhPsX=wy3rTQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary="f403043c6cb84cbd460566c7a540"
Subject: Re: [linux-lvm] Fix lvm2 build against musl libc
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

--f403043c6cb84cbd460566c7a540
Content-Type: text/plain; charset="UTF-8"

Sorry, evolution screwed up my links. Here they are again:

Patch 1: https://github.com/gentoo/musl/blob/master/sys-fs/lvm2/
files/lvm2-2.02.166-fix-stdio-usage.patch

Patch 2: https://github.com/gentoo/musl/blob/master/sys-fs/lvm2/
files/lvm2-2.02.166-portability.patch


On Tue, Mar 6, 2018 at 7:21 PM, <bjornpagen@gmail.com> wrote:

> Hey all,
>
> LVM2 currently does not compile against musl libc since it relies on
> some glibc-specific behavior. This also means that LVM2 is not fully
> POSIX compliant. The following patches have been tested on glibc and
> musl.
>
> Patch 1: https://github.com/gentoo/musl/blob/master/sys-fs/lvm2/files/l
> vm2-2.02.166-fix-stdio-usage.patch
>
> Patch 2: https://github.com/gentoo/musl/blob/master/sys-fs/lvm2/files/l
> vm2-2.02.166-portability.patch
>
> Thanks,
> Bjorn Pagen
>



-- 
Bjorn Pagen

--f403043c6cb84cbd460566c7a540
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, evolution screwed up my links. Here they are again:=
<br><br>Patch 1: <a href=3D"https://github.com/gentoo/musl/blob/master/sys-=
fs/lvm2/files/lvm2-2.02.166-fix-stdio-usage.patch" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/gentoo/<wbr>musl/blob/master/sys-fs/lvm2/<w=
br>files/lvm2-2.02.166-fix-stdio-usage.<wbr>patch</a><br>
<br>
Patch 2: <a href=3D"https://github.com/gentoo/musl/blob/master/sys-fs/lvm2/=
files/lvm2-2.02.166-portability.patch" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/gentoo/<wbr>musl/blob/master/sys-fs/lvm2/<wbr>files/lvm=
2-2.02.166-portability.patch</a><br>
<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue,=
 Mar 6, 2018 at 7:21 PM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:bjornpage=
n@gmail.com" target=3D"_blank">bjornpagen@gmail.com</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Hey all,<br>
<br>
LVM2 currently does not compile against musl libc since it relies on<br>
some glibc-specific behavior. This also means that LVM2 is not fully<br>
POSIX compliant. The following patches have been tested on glibc and<br>
musl.<br>
<br>
Patch 1: <a href=3D"https://github.com/gentoo/musl/blob/master/sys-fs/lvm2/=
files/l
vm2-2.02.166-fix-stdio-usage.patch" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/gentoo/<wbr>musl/blob/master/sys-fs/lvm2/<wbr>files/l<br>
vm2-2.02.166-fix-stdio-usage.<wbr>patch</a><br>
<br>
Patch 2: <a href=3D"https://github.com/gentoo/musl/blob/master/sys-fs/lvm2/=
files/l
vm2-2.02.166-portability.patch" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/gentoo/<wbr>musl/blob/master/sys-fs/lvm2/<wbr>files/l<br>
vm2-2.02.166-portability.patch</a><br>
<br>
Thanks,<br>
Bjorn Pagen<br>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div>Bjorn Pagen</div></div></div></div></div>
</div>

--f403043c6cb84cbd460566c7a540--
