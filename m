Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch [109.224.244.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6DA2D94B7
	for <linux-lvm@lists.linux.dev>; Thu, 24 Jul 2025 13:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365444; cv=none; b=pbtVwoaeVNF+xUCyFCxSO4jTjjCOxnIhpzqz6QdxhPwilkXdBYaDfjzC2nY6Iz4CNRTxZJt3wygZMaHuyFjfKqzVd+PsfH6o8Jed7Uh3Dqm7GDJtBFqTDh87D1Bt0dtGCfrPMzAtpr39i81LP7mGE/jsdRkZGXKjFmOOC+AsCZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365444; c=relaxed/simple;
	bh=QmQOX7wkN6mcfiBpVAIgL/lgPmmYaNJxkR5Bq6w2m6s=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OlWrdqTUgAxsL4vXPX7Hv2zzn4PxGcT092XMN3FiUX2CxlK0ImZriK+7dGyjtuLuZChuxB6ehd9zGwzIyCTUVXy27ig16+jEa9q9BFs2+42iGYQNV6ywVD51jYu7NQ0LFMiiV3F1H7Qd8BzI1jMmBqJU5tXf/PeNZst6ovsjoM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erwinvanlonden.net; spf=pass smtp.mailfrom=erwinvanlonden.net; dkim=pass (2048-bit key) header.d=erwinvanlonden.net header.i=@erwinvanlonden.net header.b=LreUIac+; arc=none smtp.client-ip=109.224.244.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erwinvanlonden.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erwinvanlonden.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=erwinvanlonden.net header.i=@erwinvanlonden.net header.b="LreUIac+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erwinvanlonden.net;
	s=protonmail2; t=1753365414; x=1753624614;
	bh=KOMwNUxmtclCdp8GdSZXRphyJKTWTyMqB4pDRDXSNBc=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=LreUIac+AV6ldtXTnlIacdp/8t2kVIcybk7O22/lMMYDdjX3U5Eh+3iRLkLx7nA+C
	 M9jofi/gJbs+htdW3lOwTvvdfY3iisMTLAuVTkY1zCSqzQkCthhgIKYWZUF8n4CHe1
	 o3JkNcAWxit0Wx1AnWu3ZASGv8O/XWHq07ZP39+GIMFyW0fdd+CQmPlQgFi2HHmdMa
	 ZNR8GJpFWN/27cYbhCJOpn9fapEEbvUIpcZStYi+XvglveWr9ofpljOruD2h47d290
	 uqmUpF0zNV8/ng2UXQ9LGyo7fZWPTbWapaAqy9kDfO8VOAQ+1zBLErRqkPR7SmoUoz
	 yBnkgL+8ix43w==
Date: Thu, 24 Jul 2025 13:56:50 +0000
To: "Henry, Andrew" <andrew.henry@eon.se>, Zdenek Kabelac <zdenek.kabelac@gmail.com>, "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
From: Erwin van Londen <erwin@erwinvanlonden.net>
Subject: Re: striped LV and expected performance
Message-ID: <5a03bead-580c-4c23-9154-e7b72a62a92b@erwinvanlonden.net>
In-Reply-To: <FR6P281MB3672CD74F16FBA40D66B8100EB5EA@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
References: <FR6P281MB3672085D192D8BF5CB45CFE4EB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM> <FR6P281MB36727398D141AD2A1A1E76DAEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM> <67b28bf7-b862-4878-8434-aaf0d157f2ca@gmail.com> <FR6P281MB3672F7D1B62E229AFCD31D0DEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM> <9f6afc0d-ce58-472a-942b-15527f693d28@gmail.com> <FR6P281MB367296DD8DAECAB5633C9BDDEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM> <630443e7-b5c6-449a-8f6d-402a71967710@gmail.com> <46e3e8c3-429f-4ffc-a710-5d8d585fbd1a@erwinvanlonden.net> <FR6P281MB3672CD74F16FBA40D66B8100EB5EA@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
Feedback-ID: 68637514:user:proton
X-Pm-Message-ID: e3727b1f7c37d225013fba5d3344a4695cb807df
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 24/7/25 17:09, Henry, Andrew wrote:
> I've been thinking about the point below, about using dd as a performance=
 test.  Although I do wholeheartedly agree that real-life workload tests mu=
st to be conducted (ideally where a production workload is recorded, and th=
en played back in a test environment), I still think that dd and fio provid=
e valuable insights into disk performance.
>
> On real physical hardware, where I know all of the variables, the product=
 spec sheets, and the theoretical performance ceiling of all the components=
, I actually see results that are close to the physical capabilities of the=
 hardware involved when I use dd or fio.  To be clear, fio is showing the s=
ame results as dd when using direct writes, which indicates that dd isn't t=
hat bad of a quick test and is a viable replacement for fio to be able to g=
et a quick idea of where performance lies.
>
> In these cases, testing a system with dd or fio, what I'm after is a vali=
dation of the physical capabilities of the hardware, as a starting point in=
 performance tuning.  If these results aren't in line with expectations, th=
en it's pointless tuning any other layer until this is resolved.
>
> Unless someone can provide evidence that dd or fio do not and simply can =
not show true hardware speeds when testing in a virtualized environment, th=
en I can only continue to use these tools in benchmarking.
>
> Because when it comes down to it, we buy hardware for their performance c=
haracteristics, and want to verify that we are seeing that same performance=
 in our environment after purchase.
>
> /AH

Having worked in the storage industry since around 1995 with DEC,=20
Compaq, Hewlett Packard and Hitachi Data Systems (Vantara) I've seen a=20
fair amount of spec sheets. Be aware, what you see on these sheets are=20
indeed optimum values measured against optimum characteristics for that=20
piece of hardware. These sheets are only partially written by engineers=20
but will have a marketing sauce added resulting in some potentially=20
skewed information. Engineering information will most often outline the=20
conditions of these numbers whereas marketing people will most remove=20
them as it simply looks better.

 =C2=A0"dd" will always give you a sequential read or write workload which=
=20
will always trigger optimisation functions in the various controllers=20
and HDD/SSD firmware. The only thing it will show you is that your=20
numbers will somewhat align to the numbers in the datasheet. Various OS=20
settings on the scheduler, dm and filesystem can have a significant=20
influence on these numbers. I'm pretty sure that the information=20
datasheets is about the maximum you can suck out a piece of hardware.=20
Everything you do on your side in the various OS layers will only=20
negatively impact the raw performance numbers, let alone having a=20
representative application workload pushed onto it.

"fio" gives you a bit more options and parameters however this will also=20
depend significantly on how the kernel and it's IO layers such as the=20
device mapper and filesystems interact with the hardware. Using zones=20
for example would require insight into the way the hardware is build,=20
especially on HDD's. If you don't have that you may as well put a wet=20
finger in the air and go for a trial and error run.

Furthermore, reading from /dev/zero to push a workload will for sure=20
skew numbers. The controllers are very smart and have been for a long=20
time. If they "see" a certain data characteristic they can change the=20
write behaviour to the physical platter or the NAND cells.

Everything you do that does not reflect a real life workload is a "just=20
for shits and giggles" exercise but will not give any real meaningful=20
outcome. Believe me, I've been through this discussion more than once.

>
>
>
> -----Original Message-----
> From: Erwin van Londen <erwin@erwinvanlonden.net>
> Sent: 21 July 2025 05:26
> To: Zdenek Kabelac <zdenek.kabelac@gmail.com>; Henry, Andrew <andrew.henr=
y@eon.se>; linux-lvm@lists.linux.dev
> Subject: Re: striped LV and expected performance
>
>
> 3. Unreal cache optimisations. Using dd is by far the worst option to use=
 for performance tests as it will never (Ok, almost never) align with real =
workloads. If you use dd for performance test you will find that this will =
backfire in most cases when a normal workload is applied. The main reason i=
s that dd will always have a sequential workload unless you start a large a=
mount of dd instances to the same disk at once with different offsets. Even=
 then you will see an obscure number coming back.
>


