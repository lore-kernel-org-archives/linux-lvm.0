Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B98682218
	for <linux-lvm@redhat.com>; Mon, 17 Sep 2018 23:41:28 +0000 (UTC)
Received: from server1.tudorejo.org (server1.tudorejo.org [172.104.8.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF10C3A26E
	for <linux-lvm@redhat.com>; Mon, 17 Sep 2018 23:41:26 +0000 (UTC)
Received: from [::1] (port=40122 helo=server1.tudorejo.org)
	by server1.tudorejo.org with esmtpa (Exim 4.91)
	(envelope-from <tudor@tudorholton.com>) id 1g238v-0001k0-LT
	for linux-lvm@redhat.com; Mon, 17 Sep 2018 23:41:25 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Sep 2018 09:41:25 +1000
From: tudor@tudorholton.com
In-Reply-To: <a032c5fd-5381-49f3-0b16-a9baac9b5e43@redhat.com>
References: <c0a0c50159e74ffc44bf813b82673f1b@tudorholton.com>
	<a032c5fd-5381-49f3-0b16-a9baac9b5e43@redhat.com>
Message-ID: <086f04e0e43d27d5637a7516c4a27877@tudorholton.com>
Subject: Re: [linux-lvm] (Why) Does lvmcreate --raid6 need 5 drives?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--------snip------
> We do have a constraint in lvm2 to require the raid6 minimum for N to=20
> be 3.
>=20
> Configuring a raid6 LV (an array by MD terms) with 2 data stripes is
> suboptimal for performance,
> because data striping is minimal in this case.=C2=A0 In addition, the
> metadata overhead is maximal
> for parity, P- and Q-syndromes being half of the brutto size of the=20
> raid6 LV.
>=20
My apologies.  I googled "brutto size" but came up with nothing.  I do=20
have a basic understanding of P and Q syndromes so I think I have a=20
vague understanding of your meaning.

I understand it's suboptimal, but not non-existent.  In particular why=20
is this a restriction and not just a warning?

Performance aside, I could also argue that there's a use case for a=20
minimal (and not degraded) set before expansion.

Cheers,
Tudor.
