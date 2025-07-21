Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch [109.224.244.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC97F4F1
	for <linux-lvm@lists.linux.dev>; Mon, 21 Jul 2025 03:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753068383; cv=none; b=JLh86a28Kr8Znki3w/1FSoNYbypjH7MVqB7LWZ3sK9pkTNX5UFx5XGdcNlhNMLv5G3vDCMzwM8yIbXYvm6LSTyjl06OY7JoZUSPkNIDRSs38ETqwopB1ed9aQZyL89fckDm+sqKJu0qG2aqSEf1SWLDyImC/38YRY8qJRuaRA4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753068383; c=relaxed/simple;
	bh=Q0K7V8YECnGlLb1ImidIGS4kSBusddB4TGV/EarGaFY=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bgdwl/hgHnO6Uv2fMt2PMyVKbzIpwRvlhLVPtWcH1VIz4HP78n9LB5wPPL3aOvIfPQaTcS9G2mHrC5zc4P6hwRk1wrGRIq+B4dkxvDRZOcUCgEEJS22fm1S/Ntwi3xHbz546W+15h755DAr+CAoPzdptYG/O8xlzLpZVbSACwSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erwinvanlonden.net; spf=pass smtp.mailfrom=erwinvanlonden.net; dkim=pass (2048-bit key) header.d=erwinvanlonden.net header.i=@erwinvanlonden.net header.b=VqP5mD2f; arc=none smtp.client-ip=109.224.244.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erwinvanlonden.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erwinvanlonden.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=erwinvanlonden.net header.i=@erwinvanlonden.net header.b="VqP5mD2f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erwinvanlonden.net;
	s=protonmail2; t=1753068370; x=1753327570;
	bh=Q0K7V8YECnGlLb1ImidIGS4kSBusddB4TGV/EarGaFY=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VqP5mD2fwEte4P/KduoivmkfgGwJ3c7IqBoOG+OTqBy5oh/S9cXFnJu7W5CcQn8ZP
	 3opaMVhKkmdRdhM/NlopOk6lmorRTNgT5dFzIxevvYXd3p6UGARsDBX3VvLg4AwyYK
	 mhVEZne5o+dtQhpwnjWVjiBruhGGjW88V1kIG1GOYLkb1tdUVMelr27Qgzse1BaNJi
	 5NkzXCIPmpVkSqaONY0aOcDW3S/sEdPQ4q2VZnQv9MqbXJERkfYlMpHjBmIS16+CvR
	 oaLPziLPPF35FKRo5OmiTE1M5egExJE2L1wus1lc58npARXuhrRV5iape4rtTJ5lOa
	 PwcTvj12LzAFA==
Date: Mon, 21 Jul 2025 03:26:07 +0000
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, "Henry, Andrew" <andrew.henry@eon.se>, "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
From: Erwin van Londen <erwin@erwinvanlonden.net>
Subject: Re: striped LV and expected performance
Message-ID: <46e3e8c3-429f-4ffc-a710-5d8d585fbd1a@erwinvanlonden.net>
In-Reply-To: <630443e7-b5c6-449a-8f6d-402a71967710@gmail.com>
References: <FR6P281MB3672085D192D8BF5CB45CFE4EB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM> <FR6P281MB36727398D141AD2A1A1E76DAEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM> <67b28bf7-b862-4878-8434-aaf0d157f2ca@gmail.com> <FR6P281MB3672F7D1B62E229AFCD31D0DEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM> <9f6afc0d-ce58-472a-942b-15527f693d28@gmail.com> <FR6P281MB367296DD8DAECAB5633C9BDDEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM> <630443e7-b5c6-449a-8f6d-402a71967710@gmail.com>
Feedback-ID: 68637514:user:proton
X-Pm-Message-ID: bfd05f34a5667431c2f7ac304859336ab01691f2
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 19/7/25 04:08, Zdenek Kabelac wrote:
> Especially in virtual world you often get already some 'provisioned' spac=
e
> which nowhere near to anything physical. Try to stripe such drives makes
> no practical sense.

Been following this discussion with interest. I think the above sentence=20
sums up the entire discussion.

A few more things I want to add.

1. Adding controllers, even in a physical machine, with individual disks=20
and stripe across them is by far the worst thing you can do. As=20
controllers, especially the high end ones, do have a huge amount of=20
logic and knowledge of the underlying topology, it can, and will=20
optimise read and write operations to align with head positions and=20
other characteristics in case of HDD's. On SSD's it can/will align to=20
disk firmware settings and instructions. These are in 99% of all cases=20
not available in the OS as they will be masked by the controller. If you=20
add more controllers these will all operate independently and have no=20
insight in the IO pattern and can therefore only operate on a single io.=20
As there are then dependencies on different controllers and different=20
disks, all controls will need to come from the OS side.

2. Using guest IO controls. (Such as direct io parameters). These kind=20
of parameters will almost always be ignored by the underlying hypervisor=20
as that will by itself needs to determine the IO parameters in=20
conjunction with other io activity of other guests on that hypervisor.

3. Unreal cache optimisations. Using dd is by far the worst option to=20
use for performance tests as it will never (Ok, almost never) align with=20
real workloads. If you use dd for performance test you will find that=20
this will backfire in most cases when a normal workload is applied. The=20
main reason is that dd will always have a sequential workload unless you=20
start a large amount of dd instances to the same disk at once with=20
different offsets. Even then you will see an obscure number coming back.

4. Use a tool that can record and replay io workloads such as SWAT and=20
VDbench.

There are a massive amount of dependencies when it comes to storage=20
performance profile and optimisations. You may get really disappointing=20
outcomes when systems are configured with settings that come out of an=20
unrealistic profiling exercise and a real world workload will get=20
deployed on them.


cheers

Erwin


