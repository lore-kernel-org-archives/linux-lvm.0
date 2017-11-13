References: <6cfeccb2-b3f6-dbd0-f5b8-b5e79a25baf8@strike.wu.ac.at>
	<bb7da243-13bd-cb2c-1e83-258a463af38d@redhat.com>
	<3450079e-1251-792f-c4c2-982f309b41b5@strike.wu.ac.at>
	<c009ef16-9f25-b6f8-bf90-0dd685ccbf77@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <41ba1e11-b499-b567-3415-d176b0226e7c@assyoma.it>
Date: Mon, 13 Nov 2017 18:41:38 +0100
MIME-Version: 1.0
In-Reply-To: <c009ef16-9f25-b6f8-bf90-0dd685ccbf77@redhat.com>
Content-Language: it-IT
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] LVM hangs
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>, Alexander 'Leo' Bergolth <leo@strike.wu.ac.at>

On 13/11/2017 16:20, Zdenek Kabelac wrote:
>>
>> Are you talking about RH bug 1388632?
>> https://bugzilla.redhat.com/show_bug.cgi?id=3D1388632
>>
>> Unfortunately I can only view the google-cached version of the bugzilla
>> page, since the bug is restricted to internal view only.
>>
>=20
> that could be similar issue yes
>=20
>> But the google-cached version suggests that the bug is mainly hit when
>> removing the raid-backed cache pool under IO.
>>
>> I my scenario, no modification (like cache removal) of the lvm setup was
>> done when the blocks occured.
>=20
> Easiest is to check=EF=BF=BD 'dmsetup status' - just to exclude if it's f=
rozen=20
> raid case.

Hi Zdeneck,
due to how easy is to trigger the bug, it seems a very serious problem=20
to me. As the bug report is for internal use only, can you shed some=20
light on what causes it and how to avoid?

Specifically can you confirm that, if using an "old-school" mdadm RAID=20
device, the bug does not apply?

Thanks.

--=20
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
