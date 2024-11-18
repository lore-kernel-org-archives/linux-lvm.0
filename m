Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6ECA55
	for <linux-lvm@lists.linux.dev>; Mon, 18 Nov 2024 13:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731937113; cv=none; b=JkuXuFRMCSMYqLD9MatCHSesh7RX3Xv10Foq50JoBBuCjz4qMlUGEElJQsKVS2YQyy/glMoBp0aiW4mGvMYnB8Ossv8jUYk/iSvoy/WwPJcn/Kfw8rY2GQu2cJO+M/NrUiY7r4xdCfGKuOoOb4ud/g/3rLRC/O+QV7U7al5O/gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731937113; c=relaxed/simple;
	bh=RhjvSrpD1RUBa1+XAYq9b06tmzeOE6xJxmz0FN2rzMU=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J4y2OnyCQ0znQ7vN44+GwlVlC4OrN9G9F/+bHMcqLJwFeA2pFFZ5ZdK/7WSYxY2FLOf3ZaiX7XEJZfMAdrWywCmhRxqcQlkQGNg0UabjKedrsupUK8p398Wg6/b2OBnKKuqsp0Un8K43ffcb99yBvnSIhBtiq94vatCumnVu+4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erwinvanlonden.net; spf=pass smtp.mailfrom=erwinvanlonden.net; dkim=pass (2048-bit key) header.d=erwinvanlonden.net header.i=@erwinvanlonden.net header.b=OTd19DDS; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erwinvanlonden.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erwinvanlonden.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=erwinvanlonden.net header.i=@erwinvanlonden.net header.b="OTd19DDS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erwinvanlonden.net;
	s=protonmail; t=1731937099; x=1732196299;
	bh=OtSS23IWD/8hS6pf3nEVrsls4wU1THCTIQ6BHMCqJZg=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=OTd19DDSe7XXjStKGqd/ymF7QkWWuFcd60tdKRGsgIMZG2YgOk/yIAGVHm3wCMBX6
	 5XjYYVbTy4cjhBFlH5IDzZRsPe+pDtWr3cUYzc4X/jYErf72QbnyRit0dpHXDiZbX6
	 jQewKpPNXmRPlqhYjoXPkk7jCxcI/KMrRhwCiU5yAYr677UFPcCxmGFZx4ns5XjaQz
	 Rs336gs/9VwVwtYdYn2Q2Ofc1iUa2yCq5SNstq7AIcuevVo7YQfXju/R62QW4a49MB
	 JtBqGd8dIujmADNCRNjTSUXbWYESP/EXlQzBI45G+LWoHyz7VdKrrJkwcrVKe2nlk6
	 FkJbrqRUj3wlQ==
Date: Mon, 18 Nov 2024 13:38:12 +0000
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, Gionatan Danti <g.danti@assyoma.it>, linux-lvm@lists.linux.dev
From: Erwin van Londen <erwin@erwinvanlonden.net>
Subject: Re: Import duplicate VG from a read-only device
Message-ID: <aec40095-abbc-43d0-910c-2b001fb1e29b@erwinvanlonden.net>
In-Reply-To: <218e6c33-c5d3-473b-9f5b-3c5684563b30@gmail.com>
References: <65d1cd8d1b9189ffcd7eb919c91c1b59@assyoma.it> <218e6c33-c5d3-473b-9f5b-3c5684563b30@gmail.com>
Feedback-ID: 68637514:user:proton
X-Pm-Message-ID: c606f34883c8fb8274dc50e3b2283da07d3ac84c
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="b1=_zJi1puyGLi1xs1KPwmcenNUlVnwByhUutGz3GOvdrk"

--b1=_zJi1puyGLi1xs1KPwmcenNUlVnwByhUutGz3GOvdrk
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 18/11/24 19:53, Zdenek Kabelac wrote:
> Dne 15. 11. 24 v 21:07 Gionatan Danti napsal(a):
>> Hi list,
>> is it possible to import a duplicate VG name from a read-only device?
>>
>> I know about vgrename, but it needs to update metadata - which is not po=
ssible
>> for read-only device.
>>
>> I tried to un-manage the host native read/write VG, deleting it from
>> system.devices, but lvchange -ay shown an error about not being able to =
create
>> the /dev/VG/LV symlink (and a "device busy" issue, probably related to t=
he
>> already-existing symlink). I also tried to activate the specific LV via
>> lvchange -S lv_uuid, but it shown the same error as above.
>>
>> In this specific case I put the device in r/w mode and solved the issue =
with a
>> plain vgrename. But what if I could not enable writes on the device? Is =
the
>> only solution to mount it on a machine without the same VG name (ie: on =
a live
>> USB), or can a VG/LV be enabled specifying a different path for the syml=
ink?
> Hi
>
> You can always write appropriate  lvm.conf  filter or use  devicesfile  t=
o
> list only those devices/PV you want to use and not cause 'duplicate VG'
> problem for command processing.
>
> However there is no chance to activate duplicated VG/LV as clearly there
> cannot exist 2 DM devices with the same name/uuid - they must be unique!
>
> So perhaps maybe you can 'rename' VG of the system you are running from -=
 if
> you cannot change the metadata on you read-only device.
>
> Here I'd probably suggest to simply avoid creating such problems upfront,
> AKA - if all your systems are using the same VG name and then you want to
> 'share/swap' such devices between your systems - you should always pick a
> unique VG name for each such system. That way avoids all the problems....
>
> Regards
>
> Zdenek
>
>
> PS: I think ATM lvm2 is already complicated enough to creating some 'over=
lay'
> level of referencing  lvm2 names in the system through some 'abstract'
> mechanism to solve the issue that can be easily eliminated ahead makes no=
t
> much sense to implement....
>
>
Do I agree with the above sentence!!!!.=C2=A0 I've seen major issues where=
=20
administrators have created a massively complex system out of LVM to the=20
extend they dug themselves a rabithole from which they couldn't escape=20
anymore. ALWAYS keep it as simple as possible and only use what you=20
actually need. Try to stay away from bells and whistles if you don't=20
needs them....

Cheers

Erwin


--b1=_zJi1puyGLi1xs1KPwmcenNUlVnwByhUutGz3GOvdrk
Content-Type: application/pgp-keys; name=OpenPGP_0x985B90929D90E282.asc
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=OpenPGP_0x985B90929D90E282.asc

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tDQoNCnhzRE5CR1FSWVg0QkRBQzhC
Nm93c051WGhqdS9HQVRIVHF5Mm95Tm5wOWowek5NU0czNHRYOEdXbU5oN01xNnUNClIyd2JLUllm
UHRnellUWThYZ2ZNYm1Sa3FJTmJGQ0hTUjNBY05QV0lnckY2REVoUzJJSkVGdkRTSFpmL1dCNnAN
Cmw3NXN3UE1UL0l4QkRQR2VuZWptYjNsR2g4QW9WRnJINEZkdjF4aG9FbW04ckQ2MEVEdWo1aHJ2
bnRSdG5QdlINCnlRVmZqNDlscmtNeUJJTndVS0Z1WXpkVGZvR2IyMHl0REhHMEkyZ3lmR3JWRFdy
ZE96Ykc1cTNiM3QyUTZZWSsNCnBPWFVveDFDT3dma21IVXhLT1hGQVIyNkNFTzArNWNMUDlFYUNK
THJsQjRCMUYvcW5ucHpXbVJZKzgvcHlCcysNClFabHhqRFJQZHdTcUh6ZHluTC81WDcxUThEZGxH
Nk5ORkgvejBhYlZ6bnRaZmQySmpBUE5DUWtkUUJwdDF2Q04NClE0TXVhSkMzc202TmdiRFFQNXY4
ZGtXMldXd2hMWTZTdWxWWE01OVdKY1ZJbEtibFdaVnhIQ0dTbGliVWFTTUwNCm1lZmZ6M3hiTG5p
dFV1T3NaVnBHenNhRW4ybkh4S2ZBaG5lTU5QaXlSdnBzWGR6QStZeW82Y0NwSUF3KzA0OUcNCmRX
UUlNcFFTWU82anFac0FFUUVBQWMwclJYSjNhVzRnZG1GdUlFeHZibVJsYmlBOFpYSjNhVzVBWlhK
M2FXNTINCllXNXNiMjVrWlc0dWJtVjBQc0xCRndRVEFRZ0FRUlloQkJUcDJQdnllWGF6RFpiNVda
aGJrSktka09LQ0JRSmsNCkVXRitBaHNEQlFrSlpnR0FCUXNKQ0FjQ0FpSUNCaFVLQ1FnTEFnUVdB
Z01CQWg0SEFoZUFBQW9KRUpoYmtKS2QNCmtPS0NYdWNNQUkrRkxzR0RvMStQQ1YrOHVKTHo2cGdL
Si9BRTAxMDRKUTVmMGNyb2grU0twT2NRNkNOcUNrY2kNCklLYysraWNjQzloVXlDcTdHV3U5UW1y
VDU2TzFqWUw3dExnanZ0dWdzWGhMZExoVlZoWWt6aGZPcGdPZVZvS3cNCkZwamlEanY0NWhLdDVF
bDRLRmpXcWczZUtoN0JlaFF4d2t0azV3cno0OWFZcVJQbFA2akZDVml0bTIranF2K24NClY3NFFR
VVpwY0tHMlVzZDhxRGV5S05VNzhvV29EdUovamJ0Ui9LdldLbEJibDl2QStHTlF4TFFqMEVWU2tW
c0sNCmpkS3BoQ1BUU0dMVVBHY3RTQ0o1VkNBVWJ2SVlJVVUxVTNOMTEweTJuU3MzQ0QyRFNaNjFp
K2N1UElOZ09uUXoNCjhGT3JkMDNKUnhnWnNzSm9uZ0NIWHo4aVd6bnpRUkl4OVZnaFliWWFVa2pZ
dDZGNDZ4Y2M1YmhvQ280WWppakMNCjM2TEtGT3dHZTYwdlFBdG9qRTNJeDZJSXRKTndRNDkvRmt6
VjlkdzFaK1Z0WEU3QlZlSlRXUmE0VTJrdVAyVUYNCkl6RmdockpCRU85ZXc4RFBadSsrbHhpZXVL
Z3B1YWFVc2gvQ25BOEdjSDVHTkVBYXdZMlNTZkMvK2FxaVMyaVMNCm5uZnAvSVJDNjg3QXpRUmtF
V0YrQVF3QW9xQURvUTBVVWZkd1ptMEpXNTZIeWFVODdSQmZoQXFwQWE2TFlIeHUNClJGSk1lUlNV
QkgxOTQzcGNORG1TWEhXUkZ2WGVaQlRsRi9YY3lnWVNWTEtOUHpwMXNxaEthTnRGb3QzMHQ3UWYN
ClJmRnlFNHVDNWhrYVZuSmhza01CQTZyeXk2aExUbzIzRnJBSS9RaDBMbXU0eXFZaytYWmx5ZFh5
SXZ6bnRwKzkNCkgzeDd4dWdIV3RrU3IwU0s5T2FNN2NydjNXOUpVcFJpV0xVa3huQlhGMTNRMjMr
Y0JMMloza2ltVkNtUW5GM08NClQvRyttd2RIUElJdk5tQWtzazBNa1dXRTk1b2tPVzN1THk1MGdY
QWllU1NpQXpNUlllM0RhYWlKMDNVV1ZMRkgNCmN5bjdUcUp5Tlg5a2czK1pVajdXS0gxSGxJK2Nt
aTFFU0ZWMkNTcGxuQ0VFNDhWZ3ZCVVNINTRWQU5LOHVDM3ENCmdXSmRDdzBjdS9WMWVKYlVSZTdu
M1RjNUpiYU9yRjloVkdYNVFRUXV4d3pjdjczSzJRR1IyZWk0WldwV0RaVWUNCnRQMnFUWHJIYy9x
cmRPcnlPWDhRYlJIejVUck1oZzlLTW1JQ3JLRXNNZ1l6OUFqU3hhWFVhWjhrNmw0dk1SMFgNCkpZ
cHZzRitxUXVtRzNoWDRrN3lnbHZjTkFCRUJBQUhDd1B3RUdBRUlBQ1lXSVFRVTZkajc4bmwyc3cy
VytWbVkNClc1Q1NuWkRpZ2dVQ1pCRmhmZ0liREFVSkNXWUJnQUFLQ1JDWVc1Q1NuWkRpZ3BmY0Mv
OUxZdHF6TVp3TnFCMWINCmoybkV3cWtOM2paSkU4cU5NeEMxV01kUWRCM3dWVVNKTWhmV3BoeGxq
V1hTTkd4a3FBV0FBU0MrS2xXd3lOWnQNCk8yY0c1MWpzNHk1NjU2bjJCUnZJZjQ0aEVSa3lvazlj
VDA0aDVEd0pvRmg4SG95Vzd3ZDB1V3BIUVNsSzdRM0sNCmdEOWFlbExFTEhtclFBZjVpZ25zYlI2
Um5BWUhMaWZsbXp1ZURkWXZYWk5NMEJPd01Qem5JZEZKQ0dLazlrU3kNCmR6MkJmeEttdlp5UGRC
T3ZjZU9HY0lrQ0V2UVBTd201YVNRS0tNUDdJZC9vc083R041VTN2SUhWbzUxcDBPN2gNCnNkSUo5
dkEwL0tOZUtRam1uZTR3R2ZxbytEV1Q1ZXYyQnJDRGhVMU9JYWhJSWRHZ2VTWkwwYlE4MkpzNWg2
Q28NCmNxZGMxNFJiamMvS2ZMaERjRWVvRm1rM285cXlZbEJnakhtd3hHeDFRYVlnU1FHZzBnTU1m
dFlEVENjMENtU28NClBOVXc3ZUh1azhETGh5TU1CaHNuNTdqVUJLNW00dHZ2MEZ4bGRKemlBR1M3
UWVYNE96bGZrTzJkNVFVZkhLb2YNClJvUlVCcWhiL1hBWkNoUGs1cnM2NmwwNjhiVWZlbkVDMXNY
MmdFeWF4STkzL20rbk84UT0NCj1SUFIvDQotLS0tLUVORCBQR1AgUFVCTElDIEtFWSBCTE9DSy0t
LS0tDQo=

--b1=_zJi1puyGLi1xs1KPwmcenNUlVnwByhUutGz3GOvdrk
Content-Type: application/pgp-signature; name=OpenPGP_signature.asc
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=OpenPGP_signature.asc

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NCg0Kd3NENUJBQUJDQUFqRmlFRUZPblkrL0o1
ZHJNTmx2bFptRnVRa3AyUTRvSUZBbWM3UXpvRkF3QUFBQUFBQ2drUW1GdVFrcDJRNG9LNg0KR0F3
QWtESnRiaEJ4azZvWlg3L3hxREhtbWRFVVRBd0Y4Tk43U0pjeElWZGJ5ZlVIc3cvcVlwSUdsSlk3
Z2dxQkRCZE1NdHNwYkUyUA0KaTVhYy81SmpVY0dhL0ltTmFZc3lVU0VvQUJabDRSaTczVGpKRERQ
ZjliQU5nVlFsYkdWdUk1dDBzMXZtU0ZYTWpLaGpEUUxNbGpyKw0KQkM3ci83ekNSQ2pueGl4aGxG
cHN4ZWkxMUZSV2VYT0I1cnlFV3BiUHJJUmlEVDBZUGovdGZaSWRzMkpSeDdyakpXamw0eTBmRHVI
Uw0KNDg1Y09pK1lNWWFpYUZRZ3ZDYVhzRXdoRFJ1S3c5d1NXUitMVEYzcUdXVU80NmpGUjZLN2Vn
ckxtUldaajJHZlk1WG8xRlpMZEw2cQ0KcXJ3azBhWXJzNitScFBNLzE0NU4zZnRvRUovY0hqZWpK
dnFhQ2t5K2NrdFcwSTdlZG13WXd0MGVwWXZnbUdqVXhEQlFIL1l0bWoycg0KaFZqMWFEYWxPUFI5
Nk5wcW5Pd2FjWEhJOUFRQ2M1R2tzR1NnTnpVYW9mYzVsUG9IUVZFL2tVNnNXN0QxWjYvWkpISW90
RzVJNHR1eg0KcEt4ZmpRaFVOWU1DeE91SjhmWW8wL3dBdUFFK0dLTzJQMmhkazBaNGsrVVhjbWdJ
N3NpT0N0WHNrYWJWDQo9ekNhcA0KLS0tLS1FTkQgUEdQIFNJR05BVFVSRS0tLS0tDQo=

--b1=_zJi1puyGLi1xs1KPwmcenNUlVnwByhUutGz3GOvdrk--

