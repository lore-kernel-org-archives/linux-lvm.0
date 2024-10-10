Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC5F8F6A
	for <linux-lvm@lists.linux.dev>; Thu, 10 Oct 2024 00:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728519716; cv=none; b=OpPmRaRNH1LMJhdFpE/8CwXxR3J2g+krsO4AWYdBHhlxkVqXL6heQGITdzAufh2boVRaTBOuv9OsaOgCp0Ehfh2AlzM7TGu/ZSedPkw+W6do/0tPBBskEWEfcaMVA+ASXqeqAQ0h2+2Wi3Pwtk2ZcZgLqx8h3Hl+Oocb3yrF5Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728519716; c=relaxed/simple;
	bh=ypw79ZYHzvEEavQlBH37IqZxRcfKPdboAYvBMpwn25U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ViZ76RZNFtWIYrKOcdy7ZYUH66H30Qq3rojqoPZu80hZaoADudxZ1rYVRMSTejQCPa6fByKV3YU4EwZw/ljqxeIGxGTmlLvyQ/kd+YZo5KrQIehWIJWFL248ZZammL6oHX8iA2tkSxd6/7xHy5YLTJUu1z3Y3GPIMqkpphtoF5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erwinvanlonden.net; spf=pass smtp.mailfrom=erwinvanlonden.net; dkim=pass (2048-bit key) header.d=erwinvanlonden.net header.i=@erwinvanlonden.net header.b=hCG8ARmu; arc=none smtp.client-ip=185.70.40.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erwinvanlonden.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erwinvanlonden.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=erwinvanlonden.net header.i=@erwinvanlonden.net header.b="hCG8ARmu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erwinvanlonden.net;
	s=protonmail; t=1728519710; x=1728778910;
	bh=k4z7oHewwpyT1TKbSxIeDRj8nl5Xo8ihl34lhIPstuY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hCG8ARmuwcm7Z9yQ2uwikLTx0TlSFXh9SKWjfKMjQ/YLHq5xQjkGtNEHu6tNnDFcH
	 qF6bsiVeQeJe1QW+3PGIK3z8XBWuQhqAnSebfeHDXy1TrgyCQNl1invKcKFXbUmV3n
	 6Uxwqf7Io38dYyBiTC61DaYr+dRfZGttmTF9b8i9Oe8CYR/w2MhYyjOibjEUg2yKUI
	 bw7CO33M/ZIfB8Jeav/aKv83ZCM75nZfRrzBf/9XtBuIRJASguuC8WPP9cw+wjLp6o
	 WxaYCaYdcwR/qXyiJbvEBZyXBQFiZLjsyJ7rwujrepzCcUQW0jKi2IC+iRN8P2xIqB
	 yTRplEpf43lAA==
Date: Thu, 10 Oct 2024 00:21:44 +0000
To: David Teigland <teigland@redhat.com>, Fabricio Winter <admin@notfab.net>
From: Erwin van Londen <erwin@erwinvanlonden.net>
Cc: linux-lvm@lists.linux.dev
Subject: Re: Help diagnosing lvm ioctl log spam
Message-ID: <68130b26-27a6-43dd-905a-84a94f88b047@erwinvanlonden.net>
In-Reply-To: <ZwaYvaL3Vh0YCZlL@redhat.com>
References: <CAKP6pzFDt42gCDjwg7m_o5YRh7MGCSfxrXkNt=nPV_B=-pRAQw@mail.gmail.com> <ZwaYvaL3Vh0YCZlL@redhat.com>
Feedback-ID: 68637514:user:proton
X-Pm-Message-ID: 55013fbe4d68d61a84b521d9cb14c496292703eb
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="b1_hzY7NTKqv2e32JPvLQFwrwh6oqDNX0jHQFVWFfaLU"

This is a multi-part message in MIME format.

--b1_hzY7NTKqv2e32JPvLQFwrwh6oqDNX0jHQFVWFfaLU
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Could it not be that, given the fact this is a volume carved out of a=20
thin pool, the underlying free space threshold is near or at capacity=20
and the the device mapper is more busy doing garbage collection than=20
actual application IO's. I've seen many nightmares with thin provisioned=20
volumes if this is not managed properly.

Have you used the "fstrim" command or is the filesystem mounted with the=20
"-o discard" option?

Check some setting with, for example, "lvs -o=20
lv_full_name,lv_health_status,lv_when_full". If it is a space issue make=20
sure that you have enough free space in your volume groups and configure=20
the "thin_pool_auto_extend_threshold" and=20
"thin_pool_auto_extend_percentage". Also turn on "monitoring" if that is=20
not enabled by default.

Another thing that could be an issue is that the filesystem has the "-o=20
discard" mount option set, device mapper wants to propagate this to the=20
underlying hardware (or in your case a hypervisor which may also send=20
this through to the underlying storage array), and that is not supported=20
on that hardware. The "Inappropriate ioctl for device" message hints in=20
that direction. Has there been movements of volumes to other provisioned=20
disks or changes on the hypervisor?

Cheers
Erwin

On 10/10/24 00:52, David Teigland wrote:
> On Wed, Oct 09, 2024 at 06:28:26AM -0300, Fabricio Winter wrote:
>> Hello people, we have been experiencing an issue with lvm2-thin on
>> _some_ of our production servers where out of nowhere
>> lvm2/device-mapper starts spamming error logs and I can't really seem
>> to trace down the root cause.
>>
>> This is what the logs look like;
>> Oct  9 06:25:02 U5bW8JT7 lvm[8020]: device-mapper: waitevent ioctl on
>> LVM-CP5Gw8QrWLqwhBcJL87R1mc9Q9KTBtQQmOowipTAFuM7hqzHz6pRVvUaNO9FGzeq-tpo=
ol
>> failed: Inappropriate ioctl for device
>> Oct  9 06:25:02 U5bW8JT7 lvm[8020]: waitevent: dm_task_run failed:
>> Inappropriate ioctl for device
> It appears related to dmeventd monitoring the thin pools, and the kernel
> returning ENOTTY when dmeventd does the DM_DEV_WAIT ioctl.  Maybe there's
> a fast retry loop in dmeventd on that error case rather than quitting.
> I wonder if there's a way you could kill dmeventd when this happens.
>
> Dave
>
>


--b1_hzY7NTKqv2e32JPvLQFwrwh6oqDNX0jHQFVWFfaLU
Content-Type: application/pgp-signature; name=OpenPGP_signature.asc
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=OpenPGP_signature.asc

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NCg0Kd3NENUJBQUJDQUFqRmlFRUZPblkrL0o1
ZHJNTmx2bFptRnVRa3AyUTRvSUZBbWNISGhBRkF3QUFBQUFBQ2drUW1GdVFrcDJRNG9Jcw0Kd1F2
K081MER0RHhHV0lsVEZ6QUIwTDBablRXb01PTHpnYlgwZ1hlY1pyN2h2SHlDQm4yTmI4SWt1Vmhn
M0MweUc4MXVqQjZSMjV5Kw0KTmVXR3hlSmd5UElWaU5YUkF1cU9iOWxhMWFJcmUyZ2lJM3FsdFNW
b0xLTU8rZFhaK2duL3RLa1J0T2FPcmozcitvaGJseUNCdWlneA0KcXBmbnBmaGlLbGFtbFErNzhQ
WWg0Nzc3YUNnRTU0dU50OWltb2hzYUJvcDU0d3lVcEZDcXQrSFN1UHp6cENET2VSRXhXTm5LT3pE
VQ0KdVJJdjVlMWNPa0t6dnNzdGdJWkZrNXYzb2RuQ3BNZGM3Y0NzTHlHWmIxb0JxalM5Wk9NVmoz
OFJpM0Y1bjdYRnF1cWFvVk1RQmNqeQ0KNFlGQ1JFbjNHZjZVZVhvS1hFQyt3ZzNNSUpPOExGWjlk
blBQRDBUY1ZlbzFOWTdVSWhLWHpmblVQdDBDRHhWWkthWTVmNlNhc1BkSg0KOHJ1aVN5V2cvUE1O
ZjZiMGgwNHM3dU0rMmVSb0M5WDFmSTd6bFdqTElZcmhCay9rYkt3S2xJNHFJV2kvbXZob0Jiekdk
cURMZW5VTw0KQ1hmQnRBZUEyalFsZG4zdThjZjlaaTNkWUNId1lIVkpvcmNYRTRlRVBIS1hKVkFQ
MEM5b1RWZTRPOEt4DQo9RlhvOA0KLS0tLS1FTkQgUEdQIFNJR05BVFVSRS0tLS0tDQo=

--b1_hzY7NTKqv2e32JPvLQFwrwh6oqDNX0jHQFVWFfaLU
Content-Type: text/vcard; charset=UTF-8; name=erwin.vcf
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=erwin.vcf

QkVHSU46VkNBUkQNClZFUlNJT046NC4wDQpOOnZhbiBMb25kZW47RXJ3aW47OzsNCkZOOkVyd2lu
IHZhbiBMb25kZW4NCkVNQUlMO1BSRUY9MTtUWVBFPXdvcms6ZXJ3aW5AZXJ3aW52YW5sb25kZW4u
bmV0DQpVUkw7VFlQRT13b3JrOmh0dHBzOi8vZXJ3aW52YW5sb25kZW4ubmV0DQpFTkQ6VkNBUkQN
Cg==

--b1_hzY7NTKqv2e32JPvLQFwrwh6oqDNX0jHQFVWFfaLU
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
LS0t

--b1_hzY7NTKqv2e32JPvLQFwrwh6oqDNX0jHQFVWFfaLU--

