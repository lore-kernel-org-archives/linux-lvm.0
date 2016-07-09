Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u69CNEU9000386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sat, 9 Jul 2016 08:23:14 -0400
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 20E5211721
	for <linux-lvm@redhat.com>; Sat,  9 Jul 2016 12:23:13 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id a2so8897387lfe.3
	for <linux-lvm@redhat.com>; Sat, 09 Jul 2016 05:23:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160708155231.GA27423@bdmcc-us.com>
References: <20160708155231.GA27423@bdmcc-us.com>
From: =?UTF-8?B?0JzQsNGA0Log0JrQvtGA0LXQvdCx0LXRgNCz?= <socketpair@gmail.com>
Date: Sat, 9 Jul 2016 17:23:10 +0500
Message-ID: <CAEmTpZF_b93jWp9Uf+Nqg=p_EiiWM8JBJrqzo9n3weJUee=Xfw@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a1141128484527c053732fbdf
Subject: Re: [linux-lvm] Copying a raw disk image to LVM2
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

--001a1141128484527c053732fbdf
Content-Type: text/plain; charset=UTF-8

If you write from disk image to virtual LVM device, you will never
overwrite LVM metadata. The most convenient way to copy VM image is using
qemu-img, since it may not copy unallocated places of VM image, leaving it
uninitialized in LVM, which is significantly faster.

2016-07-08 20:52 GMT+05:00 Brian McCullough <bdmc@bdmcc-us.com>:

>
> I have been hunting for some time over the past couple of days, and find
> several documentss that talk about converting from an LVM2 volume to a
> raw disk image for Xen, but nothing about the reverse.
>
> I have a VHD disk file that I would like to put on to an LVM2 volume,
> like my other DomU guests.
>
> I can see using dd, but am concerned about overwriting the LVM2 header.
>
>
> Does anybody have any suggestions?
>
>
> Thanks,
> Brian
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



-- 
Segmentation fault

--001a1141128484527c053732fbdf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If you write from disk image to virtual LVM device, you wi=
ll never overwrite LVM metadata. The most convenient way to copy VM image i=
s using qemu-img, since it may not copy unallocated places of VM image, lea=
ving it uninitialized in LVM, which is significantly faster.</div><div clas=
s=3D"gmail_extra"><br><div class=3D"gmail_quote">2016-07-08 20:52 GMT+05:00=
 Brian McCullough <span dir=3D"ltr">&lt;<a href=3D"mailto:bdmc@bdmcc-us.com=
" target=3D"_blank">bdmc@bdmcc-us.com</a>&gt;</span>:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
I have been hunting for some time over the past couple of days, and find<br=
>
several documentss that talk about converting from an LVM2 volume to a<br>
raw disk image for Xen, but nothing about the reverse.<br>
<br>
I have a VHD disk file that I would like to put on to an LVM2 volume,<br>
like my other DomU guests.<br>
<br>
I can see using dd, but am concerned about overwriting the LVM2 header.<br>
<br>
<br>
Does anybody have any suggestions?<br>
<br>
<br>
Thanks,<br>
Brian<br>
<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</=
a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">Segmentation fault<=
/div>
</div>

--001a1141128484527c053732fbdf--
