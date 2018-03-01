Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B90C25E1C5
	for <linux-lvm@redhat.com>; Thu,  1 Mar 2018 09:43:05 +0000 (UTC)
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 22F04356DC
	for <linux-lvm@redhat.com>; Thu,  1 Mar 2018 09:43:04 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id n82so3284323vkf.7
	for <linux-lvm@redhat.com>; Thu, 01 Mar 2018 01:43:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <c5f98473-1dad-b48e-ef3f-b311e5de2ee9@redhat.com>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<fa8b9d2e-6f1f-d201-263a-48178815a055@assyoma.it>
	<2f9c4346d4e9646ca058efdf535d435e@xenhideout.nl>
	<f934657c1724caba1c432cace2f0ca69@assyoma.it>
	<5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
	<e12f977563bfccf0a2a39aa3e53b9cf4@assyoma.it>
	<b1b73e21196be7c50daa098b2724880a@xenhideout.nl>
	<6dd12ab9-0390-5c07-f4b7-de0d8fbbeacf@redhat.com>
	<3831e817d7d788e93a69f20e5dda1159@xenhideout.nl>
	<0ab1c4e1-b15e-b22e-9455-5569eeaa0563@redhat.com>
	<51faeb921acf634609b61bff5fd269d4@xenhideout.nl>
	<4b4d56ef-3127-212b-0e68-00b595faa241@redhat.com>
	<bd9a12f33412163e9c65b4a9b78eeb4f@xenhideout.nl>
	<6dd3a268-8a86-31dd-7a0b-dd08fdefdd55@redhat.com>
	<9142007eeb745a0f4774710b7c007375@assyoma.it>
	<eea26091-40e7-8f31-e4ba-dfab059f3d70@redhat.com>
	<0a322a6f355a0744427f2a7a45162c81@assyoma.it>
	<c5f98473-1dad-b48e-ef3f-b311e5de2ee9@redhat.com>
From: Gianluca Cecchi <gianluca.cecchi@gmail.com>
Date: Thu, 1 Mar 2018 10:43:02 +0100
Message-ID: <CAG2kNCw=L+9wwu=sKc0HK-i1nPDYWzt+VyPg3WePfOeVcHOoMg@mail.gmail.com>
Content-Type: multipart/alternative; boundary="001a1143d3ac9c07e8056656af98"
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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
Cc: Xen <list@xenhideout.nl>, Gionatan Danti <g.danti@assyoma.it>

--001a1143d3ac9c07e8056656af98
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 1, 2018 at 9:31 AM, Zdenek Kabelac <zkabelac@redhat.com> wrote:

>
>
> Also note - we are going to integrate VDO support - which will be a 2nd.
> way for thin-provisioning with different set of features - missing
> snapshots, but having compression & deduplication....
>
> Regards
>
> Zdenek
>
>
Interesting.
I would have expected to find it already upstream, eg inside Fedora 27 to
begin to try, but it seems not here.
I found this for upcoming RH EL 7.5:
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/storage_administration_guide/vdo

but nothing neither in updates-testing for f27
Is this one below the only and correct source to test on Fedora:
https://github.com/dm-vdo/vdo
?

Thanks,
Gianluca

--001a1143d3ac9c07e8056656af98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Mar 1, 2018 at 9:31 AM, Zdenek Kabelac <span dir=3D"ltr">&lt;<a href=3D=
"mailto:zkabelac@redhat.com" target=3D"_blank">zkabelac@redhat.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
Also note - we are going to integrate VDO support - which will be a 2nd. wa=
y for thin-provisioning with different set of features - missing snapshots,=
 but having compression &amp; deduplication....<br>
<br>
Regards<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
<br>
Zdenek</font></span><div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br=
></div></div></blockquote><div><br></div><div>Interesting.</div><div>I woul=
d have expected to find it already upstream, eg inside Fedora 27 to begin t=
o try, but it seems not here.</div><div>I found this for upcoming RH EL 7.5=
:</div><div><a href=3D"https://access.redhat.com/documentation/en-us/red_ha=
t_enterprise_linux/7/html/storage_administration_guide/vdo">https://access.=
redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/storage_admi=
nistration_guide/vdo</a></div><div><br></div><div>but nothing neither in up=
dates-testing for f27</div><div>Is this one below the only and correct sour=
ce to test on Fedora:</div><div><a href=3D"https://github.com/dm-vdo/vdo">h=
ttps://github.com/dm-vdo/vdo</a><br></div><div>?</div><div><br></div><div>T=
hanks,</div><div>Gianluca</div></div></div></div>

--001a1143d3ac9c07e8056656af98--
