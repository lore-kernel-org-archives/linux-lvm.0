Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j47EINO14250
	for <linux-lvm@redhat.com>; Sat, 7 May 2005 10:18:23 -0400
Received: from cali.ucd.ie (cali.ucd.ie [193.1.169.37])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j47EIHNu008895
	for <linux-lvm@redhat.com>; Sat, 7 May 2005 10:18:18 -0400
Received: from conversion-daemon.cali.ucd.ie by cali.ucd.ie
	(Sun Java System Messaging Server 6.1 HotFix 0.04 (built Sep 29 2004))
	id <0IG400M01HNQ0600@cali.ucd.ie> (original mail from
	colm.connolly@ucd.ie)
	for linux-lvm@redhat.com; Sat, 07 May 2005 15:18:17 +0100 (IST)
Received: from [193.1.132.217] by cali.ucd.ie
	(Sun Java System Messaging Server 6.1 HotFix 0.04 (built Sep 29 2004))
	with ESMTPSA id <0IG400FAXIEG6IF0@cali.ucd.ie> for linux-lvm@redhat.com;
	Sat, 07 May 2005 15:18:16 +0100 (IST)
Date: Sat, 07 May 2005 15:18:16 +0100
From: "Colm G. Connolly" <colm.connolly@ucd.ie>
Subject: Re: [linux-lvm] help
In-reply-to: <472d4b2505050508052371491e@mail.gmail.com>
Message-id: <427CCE28.8020209@ucd.ie>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_SWSB9Vu7BBM4gQOv9tKU0w)"
References: <427A1103.7030207@ucd.ie> <20050505125502.M61440@pk25.com>
	<472d4b2505050508052371491e@mail.gmail.com>
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

This is a multi-part message in MIME format.

--Boundary_(ID_SWSB9Vu7BBM4gQOv9tKU0w)
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

David Mohr wrote:
> Hi,
>=20
> On 5/5/05, Diaz Rodriguez, Eduardo <ediaz@pk25.com> wrote:
>=20
>># From LVM how to
>>
>>xfs
>>There is no way to shrink XFS file systems.
>>
>>If your are touch lvm2 you must know that about 250Gx1000 and 233x1024.
>>
>>try use xfs_repair -n for see the reparis..
>=20
>=20
> I don't think that's an issue here because the history that was posted
> did not include an xfs_grow after he grew the LV. As such this should
> IMO be a pure LVM issue, because XFS was not grown.

Yep. I never changed the size of teh XFS filesystem. The issue was with the=
=20
underlying LVM geometry.

>=20
>=20
>>I use (but it is only a personal opinion, this is very dangerous)
>>(use again the first commands).
>>vgextend my_volume_group /dev/hdc1
>>lvextend -L250G /dev/HOME_VG/HOME_LV
>>lvscan
>=20
>=20
> Hmm, I agree that it sounds a bit "dangerous" but it might be worth a sho=
t.

Well it worked. I've since copied everything off the logical volume and=20
recreated it with the correct size.

>=20
>=20
>>In this point use xfs_repair -n
>>If you see good, use xfs_repair (pray)....
>>if you don't have luck try xfs_repair -d (after of this reboot) (read man
>>xfs_repair)
>>try to mount. (pray again).....
>=20
>=20
> See above, should not be necessary.

Thanks to all for the help.

Regards,

--=20
Colm G. Connolly		| Tel   : +353-1-716-2855
Department of Computer Science	| Fax   : +353-1-269-7262
University College Dublin (UCD)	| Web   : http://inismor.ucd.ie/~colmconn
Belfield, Dublin 4, =EF=BF=BDire	| MSN   : colmconn@hotmail.com

--Boundary_(ID_SWSB9Vu7BBM4gQOv9tKU0w)
Content-type: text/x-vcard; name=Colm.Connolly.vcf; charset=utf-8
Content-transfer-encoding: 7BIT
Content-disposition: attachment; filename=Colm.Connolly.vcf

begin:vcard
fn:Colm G. Connolly
n:Connolly;Colm
org:University College Dublin;Computer Science
adr:;;Belfield;Dublin;;4;Ireland
email;internet:Colm.Connolly@ucd.ie
title:Dr
tel;work:+353-1-716-2855
tel;fax:+353-1-269-7262
tel;cell:+353-86-307-8186
x-mozilla-html:FALSE
url:http://inismor.ucd.ie/~colmconn
version:2.1
end:vcard


--Boundary_(ID_SWSB9Vu7BBM4gQOv9tKU0w)--
