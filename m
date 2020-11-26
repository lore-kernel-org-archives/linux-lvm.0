Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B403B3007
	for <linux-lvm@redhat.com>; Thu, 26 Nov 2020 08:55:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 547538007DF
	for <linux-lvm@redhat.com>; Thu, 26 Nov 2020 08:55:24 +0000 (UTC)
Received: from SK-5CG0121PPS (kenny [92.240.244.202])
	(Authenticated sender: marki@marki-online.net)
	by kenny.oneemedia.com (Postfix) with ESMTPA id DB7CC22C1
	for <linux-lvm@redhat.com>; Thu, 26 Nov 2020 09:47:52 +0100 (CET)
Date: Thu, 26 Nov 2020 09:47:51 +0100
From: Marek Podmaka <marki@marki-online.net>
Message-ID: <188366775.20201126094751@marki-online.net>
In-Reply-To: <CAMaziXsttreCZ28V3aw1srY17HFawW_g2DZjvDHSpa+5EeSQag@mail.gmail.com>
References: <CAMaziXsttreCZ28V3aw1srY17HFawW_g2DZjvDHSpa+5EeSQag@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Is TRIM and DISCARD needed for normal HDD ?
Reply-To: Marek Podmaka <marki@marki-online.net>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/html; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

<html><head><title>Re: [linux-lvm] Is TRIM and DISCARD needed for normal HD=
D ?</title>
<meta charset=3D"utf-8" http-equiv=3D"X-UA-Compatible" content=3D"IE=3D9; I=
E=3D8; IE=3D7; IE=3DEDGE" />
</head>
<body>
<span style=3D" font-family:'Courier New'; font-size: 9pt;">Hi,<br>
<br>
TRIM is also used on some SMR HDDs.<br>
<br>
</span><a style=3D" font-family:'Courier New'; font-size: 9pt;" href=3D"htt=
ps://superuser.com/questions/1407990/what-does-trim-on-an-hdd-mean">https:/=
/superuser.com/questions/1407990/what-does-trim-on-an-hdd-mean</a><br>
<br>
<span style=3D" font-family:'Courier New'; font-size: 9pt;">Wednesday, Nove=
mber 25, 2020, 16:37:07, you wrote:<br>
<br>
</span><table style =3D" border-collapse: collapse;" cellpadding =3D 1 cell=
Spacing =3D 2>
<tr>
<td  width=3D2 bgcolor=3D #0000ff><br>
</td>
<td ><span style=3D" font-family:'courier new'; font-size: 9pt;">Hi,<br>
<br>
I am using thin LVM pools, but I have a normal hard disk and not a SSD.<br>
<br>
Is there any reason to enable TRIM and/or DISCARD for my HDD ?<br>
<br>
I have heard it is only useful for a SSD. Will it offer any advantages in m=
y case ?<br>
<br>
--<br>
Regards,<br>
Sreyan Chakravarty</td>
</tr>
</table>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
<br>
<span style=3D" font-family:'arial'; color: #c0c0c0;"><i>--<br>
&nbsp; bYE, Marki</body></html>
