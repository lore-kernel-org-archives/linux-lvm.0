Return-Path: <SRS0=oYOT=FN=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901FEC433FE
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Dec 2020 19:08:16 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD26723A33
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Dec 2020 19:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD26723A33
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-TPxD5njUM3mohnsdg6klVw-1; Wed, 09 Dec 2020 14:08:10 -0500
X-MC-Unique: TPxD5njUM3mohnsdg6klVw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B24C1966344;
	Wed,  9 Dec 2020 19:07:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E42346EF5A;
	Wed,  9 Dec 2020 19:07:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 922AD180954D;
	Wed,  9 Dec 2020 19:07:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B9J766p014266 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 9 Dec 2020 14:07:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 25442C77C9; Wed,  9 Dec 2020 19:07:06 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B6B7C77CA
	for <linux-lvm@redhat.com>; Wed,  9 Dec 2020 19:07:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A191C858284
	for <linux-lvm@redhat.com>; Wed,  9 Dec 2020 19:07:02 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1607540822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=50H6EsUGfDsrLvlynErF45CRZajDVZdp1ZpptyV0J4o=;
	b=VzFvgK2B7PGbvc0LghbSkR/gABEfVNeyG54ke9CMDAkt2qlBmbfjc2irB4eGMbr3AHTihn
	40sAZ+pgoczUgA8JlnM6peCYB5Da8SBFXj5aMpJq6FKbBghX0NpWXFWQ2ZKwVrsopL4V8w
	NlyH7Oyn4QHwpbv9tlAUe9mROcnkDaH3w+frYTCS2un29oLmSUZhtlSmVe2kauA/vpR7F6
	zlTzpxwFMm6q2D0/hqRS6ZriZdWLJWoDQKjWy5N4C7Hofh0l5x7SAcSizV3/cbLRqMIIQD
	e+qIRNRwMHdv+i+5+WyX76yArJi1pX/ENfNKdDPfeciNmdWCX14tcC46kloqtg==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1607540822; a=rsa-sha256;
	cv=none;
	b=XdYWIag9eKv1uRI52sVzsvxucUCkkoKKYVy3IquluTSNDhhC+nF1WBeb2QljupOmfPJ+sx
	VsFwp8gTqVAbpC0BCB5kfH22frRn0dqEIo2Jv1L99mqPt7X69z+g9T++suDY5ND5YvP+Zz
	Cj8odrnx995+9BybUffx098lWHg5gsXml1eKQgmTMh/XV7beQziDtdsGKA/brlIw440KzC
	hziEZYeE60QPnkouV4qj2gOKtIWAoHZpMUdrlT/V6Z3+K7HAlLd2VUDZWcjamCqZM4ihwm
	a2LhWCPkjblKVSx7evuZnuaLBTRM/+8/ij/uFJDUoGW2HHuI/x3jJVy1CpyHSw==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=gmx.net header.s=badeba3b8450 header.b=NUo+RZ3f;
	dmarc=pass (policy=none) header.from=gmx.net;
	spf=pass (relay.mimecast.com: domain of devurandom@gmx.net designates
	212.227.15.15 as permitted sender)
	smtp.mailfrom=devurandom@gmx.net
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-580--e0K_aRCNLyMWIPPAH0Ziw-1;
	Wed, 09 Dec 2020 14:06:58 -0500
X-MC-Unique: -e0K_aRCNLyMWIPPAH0Ziw-1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1607540816;
	bh=75yQBNsQELt3s8mupude4AQ/h8vX8HuAFcfVW595ouA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NUo+RZ3fgUAusFAHJidf7JnCSQD1vVgmo4UKeTJJP6m6FMx9P4QK0G4QGjILG//5W
	0IzXPrDrKJJ6Ex3nDDBichUWPxI+D2T1isPdSvXl/zXgIqkrzru8T+Mj/POPeBsZAC
	H95KvMqUCOdQWfBoKbmKpeFT8gHeRV/ErYeuJPbE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from monk.localnet ([79.211.252.228]) by mail.gmx.com (mrgmx004
	[212.227.17.190]) with ESMTPSA (Nemesis) id 1MVvPD-1kf8q52H93-00RsOO;
	Wed, 09 Dec 2020 20:06:56 +0100
From: Dennis Schridde <devurandom@gmx.net>
To: LVM general discussion and development <linux-lvm@redhat.com>
Date: Wed, 09 Dec 2020 20:06:41 +0100
Message-ID: <5900102.lOV4Wx5bFT@monk>
In-Reply-To: <a2927a4a-006e-6b5b-3597-d7b592e21ec7@redhat.com>
References: <4384449.LvFx2qVVIh@monk>
	<a2927a4a-006e-6b5b-3597-d7b592e21ec7@redhat.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:JT3IaFyVY+drwWoG1jBj8p/ahFqUGz8c93/58AFWGsAaRALCRX9
	dV93Y+PTd/YFW3zd0mIOx5OlaeqloWw1CwOp93iIb1+jDlTyCTTFMnnltR1N+euwpNAvw1y
	ZjI/AQmYNEvT+SCWsbSpYMQCzAy4WMXH+PF+i9HHbdgtN8o9VWK5vAFcY//W+UMwwxdhjls
	8zG0tGRoTUfz6XNXd3NVw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:i/d76wlY4MY=:jdoVx0TkFY0Vx0KMIMo+Af
	FmfS87QuBNOddL5D+Xz1t0A0Bn4wmiFfebN382Bw7V281T4+aFk5DZLsdTG9yBL56djKHuH+5
	qXMXgVqdABsufQTKDDSh0Q9GPWnS1ZHnxl/xCPo+llM6TMrSGpRQNtNO4d7ohitqmJZNB/Q+o
	3tQCr3L8S7NFCzDy9jPzJCJpFjs1F/1l77+6VIByuv1JnJEyrWecV5YCbywwkVCP0+QwuBBqC
	vgjvrV8PVWSMrhdNs3apxNKMFz9mZnwmYFlbGpi6M5vB48RjOQDMqfoAjvsF03Zbh+ETXC4iy
	tbiuIBNkQMn6M/79zgqCLmYtFtQPnmt/aezI5zp1YfcRB2zWMP7l52DYcSMS5/x40at3PEd+m
	/H/lIsekCKeBc4vNFbISyxBrOdetY9yNKYWdGjh2KANJjRtpIpLqa4dfTsL3ZxN0epHiH9dac
	eeQoHtncUNFU9GhNxr5AVju9gT4+nCN5UQUR8G9Uh5PCgFBRmXC29YTcXDyT3HN3lPHvfrDex
	w0Ll2oYEIRPUgI8HZii6MWyAAm7I8WfOnSw751eHC/SoueL2S8Ru7qfIkTbnyxa0x7h2Z4/pZ
	wGnB9hLUmWyzrQaHO4TgekajrjBXjK0vOMJHor5+qHTCaA1GH3WZ9hGVA0hsvBN38Wwv6v9Y5
	5+MasRTWLEnsGkXCeiTa/TBP5Jst3EVijlEk4MGWjPMHXlHnC/R0HCwF7Z6tBSo1+kVF2GoW0
	OHASP4MQzga2cnNTGickid9RMuHm/7fNgCKXflZGVI8RC7/AM3+liUYQIUuhpXcn/qPpyNonr
	9GxpdboiXJSa43KIVLXYzkHwG5QemZ6irQry/Z5MoC1Z0ZGiAVSNU55UCI+U6tx/kLaqlE6ZB
	4sgxjVj7Bh2xfUPd7Ecw==
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=gmx.net header.s=badeba3b8450 header.b=NUo+RZ3f;
	dmarc=pass (policy=none) header.from=gmx.net;
	spf=pass (relay.mimecast.com: domain of devurandom@gmx.net designates
	212.227.15.15 as permitted sender)
	smtp.mailfrom=devurandom@gmx.net
X-Mimecast-Spam-Score: 0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-lvm@redhat.com
Cc: Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [linux-lvm] cache_check --clear-needs-check-flag does not clear
	needs_check flag?
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0154809314481019401=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13

--===============0154809314481019401==
Content-Type: multipart/signed; boundary="nextPart4845882.31r3eYUQgx";
	micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart4845882.31r3eYUQgx
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Dennis Schridde <devurandom@gmx.net>
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [linux-lvm] cache_check --clear-needs-check-flag does not clear
	needs_check flag?
Date: Wed, 09 Dec 2020 20:06:41 +0100
Message-ID: <5900102.lOV4Wx5bFT@monk>
In-Reply-To: <a2927a4a-006e-6b5b-3597-d7b592e21ec7@redhat.com>
References: <4384449.LvFx2qVVIh@monk>
	<a2927a4a-006e-6b5b-3597-d7b592e21ec7@redhat.com>

Hello Zdenek!

Thank you for your reply!

On Mittwoch, 9. Dezember 2020 12:05:13 CET Zdenek Kabelac wrote:
> Dne 06. 12. 20 v 22:01 Dennis Schridde napsal(a):
> > The live system I am running these commands from is a Fedora 33:
> >
> > $ uname -a
> > Linux localhost-live 5.8.15-301.fc33.x86_64 #1 SMP Thu Oct 15 16:58:06 =
UTC
> > 2020 x86_64 x86_64 x86_64 GNU/Linux
> >
> > $ sudo lvm version
> >
> >     LVM version:       2.03.10(2) (2020-08-09)
> >     Library version: 1.02.173 (2020-08-09)
> >     Driver version:   4.42.0
>
> It seems you are using  'cvol' instead of 'cpool' solution which has been
> evolving and you will need a newer lvm2 version.
>
> If you want to using caching with the version of lvm2 you have - you will
> need to use cpools  (which are a bit faster anyway).

2.03.10 is the latest released version of lvm2.  So I would have to use the
Git main branch instead?

A bit confusing is that the lvmcache(7) manpage of lvm2 2.03.10 suggests to
create a cachevol as the first option:
$ lvconvert --type cache --cachevol fast vg/main

Should this be adjusted, if cachevols are not yet fully supported in 2.03.1=
0?

How would you proceed to repair this cache?  I can recreate it as a cachepo=
ol,
but first I need to gain back access to the data, i.e. get into a state whe=
re
I can --uncache.

--Dennis

--nextPart4845882.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEE0Ngi/nirHnbsz3NFz+h/M161qdwFAl/RIEEACgkQz+h/M161
qdyc5wv+MDwL1tbFGmFyAKOCaBPEQ+pfu2qlkxNbtDIgxte4FE7xwb0T+4LaRP0i
FO+dJ95ha6HpuRaRfcgolQs97LmX1YS/8OxDMnbbp7EISpf0F0YrZtBUREWD+SDa
8dATueXNEt+VQz4UN3nOYtWNHFwrgauHLo007yeHL8XagCmOqM806vi/xH7JWJNN
TvyARR66HykEG9GFjTp0Rm2zyDkHIl3qHi7lK3aRiwiHdQpRQxcEOPA5OKN3EDhj
XuJpx57cHVHOoqxvZBhwgWsCurCR2NJoMQ1Q6r05J33g+hCWVF9I+oiYYbT2aQrn
1ZGVetUCWCIb2WnJ5gZ/ZIG6Rpy+9oPdTkMEfrSAzyUNFvV2Wtb83TG/TePSUihX
8Hfp+Y0YVwTn/ll9RWervyK61KxIZTFLbv3S7C6RvZXx1E+G6esG9mW8XoZCRljP
o+/ktbJ2Vm3nD0MZAKSAnXDXrEa8V8+RuypwvzMQVIeatc+jSviE70BmzDLfq68D
Vpas2EYT
=WHp/
-----END PGP SIGNATURE-----

--nextPart4845882.31r3eYUQgx--




--===============0154809314481019401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============0154809314481019401==--



