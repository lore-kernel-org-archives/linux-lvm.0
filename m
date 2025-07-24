Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0512C15AB
	for <linux-lvm@lists.linux.dev>; Thu, 24 Jul 2025 14:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753367616; cv=none; b=O1Y8hVS1YCHh37D3CwiHOj5tErnqFQuCHYLaekNb8MfaYKtZi2JnKGcLkjFAdeUCxY+gP1ymY3a4wJoYj3zmIMVNwNlorzPyhUa9mNkfEYS536fOHwqIHdq1CXn3xTKFaG0hVn8xdTsvKfC91ih4/NwwpCN88TivbLYYDn0Qy94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753367616; c=relaxed/simple;
	bh=tKqXf2L0aQKyoNSBwu82IZ05e0sAX0XX9SMFIZ1xGB0=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P5ZiDsxI2NCorfTkCOjT4eVjh0BnEXBl9es/khgXDw+qSziaizRMfvZxLqWXN9tYm55+iJ4LaTTgBKep8be8d3Tc8BvvpCH4A3jYP/w2n71xqlEdKNYzcQCiFZWT09pMwWinG7mUGD97oYTRVuyYejOPRR4pqni7aaQnjXswlds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erwinvanlonden.net; spf=pass smtp.mailfrom=erwinvanlonden.net; dkim=pass (2048-bit key) header.d=erwinvanlonden.net header.i=@erwinvanlonden.net header.b=eEHEm5+J; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erwinvanlonden.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erwinvanlonden.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=erwinvanlonden.net header.i=@erwinvanlonden.net header.b="eEHEm5+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erwinvanlonden.net;
	s=protonmail2; t=1753367602; x=1753626802;
	bh=NIZeQ6B3FKvdRkICH+oL8urZCQICUZ3+YJP5Ip9UM2s=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=eEHEm5+JruBBVuI39R5tFOkuuTMwO7qzGzCYzAx0thx7HfHr/mL1PSZo38IDuZ8zB
	 0XxMbWqW5qJWTXn1XyyNzuxAxWEaG/WFJ8YI7P5eXV9Gj2qdCnxJaJId2NVuGCSkLC
	 1MyJzQTcDLnlS5gWbiikkVzK4DTTSb6vsaIy7YnN8TO6+030kFxIp+Wux1KBW32PDV
	 r4bb5w77NpHgpUITazRVm5lBccBGKTqki7vy+6979/Qhp6vbs1qjx6DbV7SsY84eqG
	 pq230pFYi0Xjdpq28WJ4S6pYkJDCejSxBiRxNCr4UMkWYWbG1Q6RTeXaH5BN8Wu5ly
	 g4+F0VOnl9bNA==
Date: Thu, 24 Jul 2025 14:33:18 +0000
To: "Henry, Andrew" <andrew.henry@eon.se>, Zdenek Kabelac <zdenek.kabelac@gmail.com>, "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
From: Erwin van Londen <erwin@erwinvanlonden.net>
Subject: Re: striped LV and expected performance
Message-ID: <3e8ce1b8-8a10-40e0-b0ed-468873f3c6e0@erwinvanlonden.net>
In-Reply-To: <FR6P281MB367272794788E0000A0AD50DEB5EA@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
References: <FR6P281MB3672085D192D8BF5CB45CFE4EB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM> <FR6P281MB3672F7D1B62E229AFCD31D0DEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM> <9f6afc0d-ce58-472a-942b-15527f693d28@gmail.com> <FR6P281MB367296DD8DAECAB5633C9BDDEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM> <630443e7-b5c6-449a-8f6d-402a71967710@gmail.com> <46e3e8c3-429f-4ffc-a710-5d8d585fbd1a@erwinvanlonden.net> <FR6P281MB3672CD74F16FBA40D66B8100EB5EA@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM> <5a03bead-580c-4c23-9154-e7b72a62a92b@erwinvanlonden.net> <FR6P281MB367272794788E0000A0AD50DEB5EA@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
Feedback-ID: 68637514:user:proton
X-Pm-Message-ID: 37fdde40ce553c60d1bbbf3d4d1d4b121d688058
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 25/7/25 00:10, Henry, Andrew wrote:
> Yes, me too, I've also been in the IT industry since 1992, and understand=
 product spec sheet theoretical maximums.
:-) Old-timers then... Hehehehe.....
>
> ""dd" will always give you a sequential read or write workload which will=
 always trigger optimisation functions in the various controllers and HDD/S=
SD firmware. The only thing it will show you is that your numbers will some=
what align to the numbers in the datasheet."
>
> Which is what I'm initially trying to validate, but not seeing.
I thought your first post started off running on a hypervisor. In that=20
case all bets are off and you're subject to what the host OS will allow=20
you to do. That puts a whole other pie in the mix.
>
> " Furthermore, reading from /dev/zero to push a workload will for sure sk=
ew numbers. The controllers are very smart and have been for a long time. I=
f they "see" a certain data characteristic they can change the write behavi=
our to the physical platter or the NAND cells."
>
> I had considered this, and if this was the case, wouldn't it give *better=
* performance?  If a DeDup identifies a pattern for instance, wouldn't I ge=
t *better* values in my tests than what the hardware was capable of?  In wh=
ich circumstance would I see worse numbers when controller logic kicked in?
One of the reasons could be that load-leveling logic in the SSD firmware=20
may cause delays, that's not something you can control. Also, if the=20
hypervisor does allow direct-io and the guest needs to wait for IO=20
completion or if the hypervisor has some settings applied that interfere=20
with IO completion, you will likely see skewed results. My experience is=20
that whenever you want to validate a specsheet you need to test this=20
under the same characteristics or you would need to be able to align=20
your IO profile that aligns to the specifications of the hardware. It=20
can be a massive time-waster if you can't automate the test-logic and=20
validate the outcomes to the datasheet numbers.
>
> /AH
>
>
> -----Original Message-----
> From: Erwin van Londen <erwin@erwinvanlonden.net>
> Sent: 24 July 2025 15:57
> To: Henry, Andrew <andrew.henry@eon.se>; Zdenek Kabelac <zdenek.kabelac@g=
mail.com>; linux-lvm@lists.linux.dev
> Subject: Re: striped LV and expected performance
>
>
> Having worked in the storage industry since around 1995 with DEC, Compaq,=
 Hewlett Packard and Hitachi Data Systems (Vantara) I've seen a fair amount=
 of spec sheets. Be aware, what you see on these sheets are indeed optimum =
values measured against optimum characteristics for that piece of hardware.=
 These sheets are only partially written by engineers but will have a marke=
ting sauce added resulting in some potentially skewed information. Engineer=
ing information will most often outline the conditions of these numbers whe=
reas marketing people will most remove them as it simply looks better.
>
>   =C2=A0"dd" will always give you a sequential read or write workload whi=
ch will always trigger optimisation functions in the various controllers an=
d HDD/SSD firmware. The only thing it will show you is that your numbers wi=
ll somewhat align to the numbers in the datasheet. Various OS settings on t=
he scheduler, dm and filesystem can have a significant influence on these n=
umbers. I'm pretty sure that the information datasheets is about the maximu=
m you can suck out a piece of hardware.
> Everything you do on your side in the various OS layers will only negativ=
ely impact the raw performance numbers, let alone having a representative a=
pplication workload pushed onto it.
>
> "fio" gives you a bit more options and parameters however this will also =
depend significantly on how the kernel and it's IO layers such as the devic=
e mapper and filesystems interact with the hardware. Using zones for exampl=
e would require insight into the way the hardware is build, especially on H=
DD's. If you don't have that you may as well put a wet finger in the air an=
d go for a trial and error run.
>
> Furthermore, reading from /dev/zero to push a workload will for sure skew=
 numbers. The controllers are very smart and have been for a long time. If =
they "see" a certain data characteristic they can change the write behaviou=
r to the physical platter or the NAND cells.
>
> Everything you do that does not reflect a real life workload is a "just f=
or shits and giggles" exercise but will not give any real meaningful outcom=
e. Believe me, I've been through this discussion more than once.
>
>>
>>
>> -----Original Message-----
>> From: Erwin van Londen <erwin@erwinvanlonden.net>
>> Sent: 21 July 2025 05:26
>> To: Zdenek Kabelac <zdenek.kabelac@gmail.com>; Henry, Andrew <andrew.hen=
ry@eon.se>; linux-lvm@lists.linux.dev
>> Subject: Re: striped LV and expected performance
>>
>>
>> 3. Unreal cache optimisations. Using dd is by far the worst option to us=
e for performance tests as it will never (Ok, almost never) align with real=
 workloads. If you use dd for performance test you will find that this will=
 backfire in most cases when a normal workload is applied. The main reason =
is that dd will always have a sequential workload unless you start a large =
amount of dd instances to the same disk at once with different offsets. Eve=
n then you will see an obscure number coming back.
>>
>


