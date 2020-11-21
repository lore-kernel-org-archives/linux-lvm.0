Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DB4F2026D48
	for <linux-lvm@redhat.com>; Sat, 21 Nov 2020 03:11:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8AD3185A7BC
	for <linux-lvm@redhat.com>; Sat, 21 Nov 2020 03:11:00 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id z21so16200636lfe.12
	for <linux-lvm@redhat.com>; Fri, 20 Nov 2020 19:10:57 -0800 (PST)
MIME-Version: 1.0
From: Sreyan Chakravarty <sreyan32@gmail.com>
Date: Sat, 21 Nov 2020 08:40:44 +0530
Message-ID: <CAMaziXsY6vpQdD+QQzW_1Km+Ltf41tz0G1WG5xAUiMARFWHoyw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000003c3a6605b4954fb6"
Subject: [linux-lvm] What is the use of thin snapshots if the external
 origin cannot be set to writable ?
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

--0000000000003c3a6605b4954fb6
Content-Type: text/plain; charset="UTF-8"

I am looking into thin snapshots since the older COW snapshots delay my
boot enormously.

My normal root fs is on a normal "non-thin" volume.

So to make a snapshot I have boot into a live cd environment then set my
root fs volume to read-only and then set it to inactive.

Commands:

       sudo lvchange -pr vgfedora/fedora
       sudo lvchange -an vgfedora/fedora

Now I create the thin snapshot using lvcreate, after that I need to restore
my root LVS to its original state:

     sudo lvchange -ay vgfedora/fedora

      sudo lvchange -prw vgfedora/fedora

This fails with:

            Command on LV vgfedora/fedora uses options that are invalid
with LV parameters: lv_is_external_origin.


I mean what is the point of creating a snapshot if I can't change my
original volume ?

Is there some sort of resolution ?

-- 
Regards,
Sreyan Chakravarty

--0000000000003c3a6605b4954fb6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am looking into thin snapshots since the older COW snaps=
hots delay my boot enormously.<div><br></div><div>My normal root fs is on a=
 normal &quot;non-thin&quot; volume.=C2=A0</div><div><br></div><div>So to m=
ake a snapshot I have boot into a live cd environment then set my root fs v=
olume to read-only and then set it to inactive.</div><div><br></div><div>Co=
mmands:</div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0sudo lvchange -=
pr vgfedora/fedora</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0sudo lvchange -an v=
gfedora/fedora</div><div><br></div><div>Now I create the thin snapshot usin=
g lvcreate, after that I need to restore my root LVS to its original state:=
</div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0sudo lvchange -ay vgfedora/fe=
dora</div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0 sudo lvchange -prw vgfed=
ora/fedora</div><div><br></div><div>This fails with:</div><div><br></div><d=
iv>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Command on LV vgfedora/fedora =
uses options that are invalid with LV parameters: lv_is_external_origin.</d=
iv><div><br></div><div><br></div><div>I mean what is the point of creating =
a snapshot if I can&#39;t change my original volume ?</div><div><br></div><=
div>Is there some sort of resolution ?<br clear=3D"all"><div><br></div>-- <=
br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signa=
ture"><div dir=3D"ltr">Regards,<div>Sreyan Chakravarty</div></div></div></d=
iv></div>

--0000000000003c3a6605b4954fb6--
