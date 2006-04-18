Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3IKUUVK025458
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2006 16:30:30 -0400
Received: from virt.isg.si (virt.isg.si [213.157.224.197])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3IKUSUF002091
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2006 16:30:28 -0400
In-Reply-To: <4445294D.6050500@conterra.de>
References: <AAB83747-D6F3-4148-9836-7E22B8AD9ABF@isg.si>
	<4445294D.6050500@conterra.de>
Mime-Version: 1.0 (Apple Message framework v749.3)
Message-Id: <CDF11F32-D2D3-47EB-8B00-E91614CEA795@isg.si>
From: Martin Gombac <martin@isg.si>
Subject: Re: [linux-lvm] physical volume smaller than partition?
Date: Tue, 18 Apr 2006 22:30:17 +0200
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; delsp="yes"; format="flowed"
To: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Tnx. for explanation.
I didn't think that cfdisk uses 1000 instead of 1024.

Regards,
Martin

On 2006.4.18, at 20:00, Dieter St=EF=BF=BDken wrote:

> Martin Gombac wrote
>> and noticed 277.60 GB !=3D 291.08..GB. So my question is where did =20
>> the rest of disk space went to?
>
> it depends on counting "kilo" as 1000 or 1024.
> This happens even twice for kb -> mb -> gb.
>
> Thus:  277.60 * 1.024 * 1.024 =3D 291.08
>
> Memory capacity is calculated using 1024 where as disk manufacturer
> like using 1000, as this results in bigger numbers
> (but does not result in more space :-(
>
> Dieter.
