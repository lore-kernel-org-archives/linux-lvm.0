Return-Path: <SRS0=nYqM=HY=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBAE5C433DB
	for <linux-lvm@archiver.kernel.org>; Mon, 22 Feb 2021 13:08:56 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5B7664E12
	for <linux-lvm@archiver.kernel.org>; Mon, 22 Feb 2021 13:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5B7664E12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eworm.de
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-8LFXupR_NnKbDLN1UGm-tA-1; Mon, 22 Feb 2021 08:08:51 -0500
X-MC-Unique: 8LFXupR_NnKbDLN1UGm-tA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E10D1020C20;
	Mon, 22 Feb 2021 13:08:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2229219C45;
	Mon, 22 Feb 2021 13:08:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 87CB918095CB;
	Mon, 22 Feb 2021 13:08:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11MD4eLE024361 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 22 Feb 2021 08:04:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 345961111C72; Mon, 22 Feb 2021 13:04:40 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D7DB1111C75
	for <linux-lvm@redhat.com>; Mon, 22 Feb 2021 13:04:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4555186E122
	for <linux-lvm@redhat.com>; Mon, 22 Feb 2021 13:04:37 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1613999077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=FF/k9U2IKu/pj3vw7K3sOU1IDk0P8RIK6ESluRhEi0Q=;
	b=I3P62qBKQfzu9cBhx/D3yKAcLRbcSBjlRHiLJ1Io/HfnwqwW70s0IeBKp/+3fpurntArw6
	57HsaOGboKDlFwpp7a7EO5nA/mM6QW+iMOk8b2xIEmfnM0qgMyrWPM/O/95DEWQF7LQscF
	La4sKu/Bdmtb/oPgdWCY2HPo6A6nP3mvP7EDSlkR0J4igRLdnsyK+rxF2zVb6wG8p3cb/1
	dlammTYOiCH6A8biX6iV8wB1jrmUTzNba2nGx9TZXv/Ivb2FJjtSSuGxM0nVmEeNDtlazF
	cSha4Z9jEU2cka12FapLrAlFdNG36PcJ36ei3vpRoxouJX9+w/hEFJTYxcRh0g==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1613999077; a=rsa-sha256;
	cv=none;
	b=Rnf3oBnzrH6idE1gpwlb9dGyox56KXr1Z9lvg34G44WwiBwU1BqE3foLgOZYL3s09FLKcw
	vTkBcVOOjaqMDj6qgk0Zr5A2svDhhMIZXKwqWT6Nx39uT+XxNn/zwX/dAMPBzOLG7vrpg7
	zu+cJoKfloSunZRmb8TrkxZoOhO9TyKCRwpjUWpUlhwOz+eOQNYjpuPkJVbNJ8K3bHXI/j
	CAwzmACs7rB6IQpoCQGMoVylnNNsJTfNb/aaRVIZxX7Ef6cuQwKn7qRtHTkKdjjgk7AQqK
	LHsqPGYSNlhg7RosBf1hOInu/IUb/FlnMuEll7S//2DDdp8FSqnaqkfUoC7EhA==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=eworm.de header.s=mail header.b=4y6nOMk0;
	dmarc=none;
	spf=pass (relay.mimecast.com: domain of list@eworm.de designates
	195.201.174.144 as permitted sender)
	smtp.mailfrom=list@eworm.de
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [195.201.174.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-327-PIUCvhp1ODOVGVewdjn8Dg-1; Mon, 22 Feb 2021 08:04:31 -0500
X-MC-Unique: PIUCvhp1ODOVGVewdjn8Dg-1
Received: from leda (p200300Cf2f0f1C00625718FFfE7f1598.dip0.t-ipconnect.de
	[IPv6:2003:cf:2f0f:1c00:6257:18ff:fe7f:1598])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
	server-digest SHA256) (No client certificate requested)
	by mx.mylinuxtime.de (Postfix) with ESMTPSA id 2404010FF7B;
	Mon, 22 Feb 2021 14:04:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eworm.de; s=mail;
	t=1613999069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=csUVWmH7hrKjFiA5rcvaIF1+FqrALX8X6iVZwzuxBak=;
	b=4y6nOMk0V8PR90cVHe0Hpbd17BLdMdFQqrHcZ63wCRyZN12/RRpccSlTheF76wqP2cMaE2
	OkwYiJv1BXwzMUlyPQYSpqNmWbpwcNiek9VNi5c1hDl9zhyIfsLUqahYyAPsJyKBeSBpM0
	3SrF/QjqpnAEiNeqZd7xrn2Gl7+l7CA=
Date: Mon, 22 Feb 2021 14:04:17 +0100
From: Christian Hesse <list@eworm.de>
To: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <20210222140417.4f890bec@leda>
In-Reply-To: <bcb2eb82-46b3-8e6b-c9b6-56442b4f63a3@redhat.com>
References: <20210211111623.34968-1-list@eworm.de>
	<f18dff7a-050a-d41d-c643-4616522ba4a0@suse.com>
	<ae893a3606dd32b07cab16bd538c132af555c956.camel@suse.com>
	<20210217130329.7de41147@leda>
	<20210217133826.u4gglfsowqfvxdff@spock.localdomain>
	<ea269d6255c4cd48bb60771aa7e4204e4f70db8a.camel@suse.com>
	<20210219163722.GA13644@redhat.com>
	<22b3cc5b-24fb-a684-be90-1f767d5ac678@redhat.com>
	<f627b3e7a0d16f31ec68cb07b3454e977e8fe1d0.camel@suse.com>
	<bcb2eb82-46b3-8e6b-c9b6-56442b4f63a3@redhat.com>
X-Face: %O:rCSk<c"<MpJ:yn<>HSKf7^4uF|FD$9$I0}g$nbnS1{DYPvs#:,~e`).mzj\$P9]V!WCveE/XdbL,L!{)6v%x4<jA|JaB-SKm74~Wa1m;
	|\QFlOg>\Bt!b#{;
	dS&h"7l=ow'^({02!2%XOugod|u*mYBVm-OS:VpZ"ZrRA4[Q&zye,^j;
	ftj!Hxx\1@; LM)Pz)|B%1#sfF; s; ,N?*K*^)
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAGFBMVEUZFRFENy6KVTKEd23CiGHeqofJvrX4+vdHgItOAAAACXBIWXMAAA3XAAAN1wFCKJt4AAACUklEQVQ4y2VUTZeqMAxNxXG2Io5uGd64L35unbF9ax0b3OLxgFs4PcLff0lBHeb1QIq5uelNCEJNq/TIFGyeC+iugH0WJr+B1MvzWASpuP4CYHOB0VfoDdddwA7OIFQIEHjXDiCtV5e9QX0WMu8AG0mB7g7WP4GqeqVdsi4vv/5kFBvaF/zD7zDquL4DxbrDGDyAsgNYOsJOYzth4Q9ZF6iLV+6TLAT1pi2kuvgAtZxSjoG8cL+8vIn251uoe1OOEWwbIPU04gHsmMsoxyyhYsD2FdIigF1yxaVbBuSOCAlCoX324I7wNMhrO1bhOLsRoA6DC6wQ5eQiSG5BiWQfM4gN+uItQTRDMaJUhVbGyKWCuaaUGSVFVKpl4PdoDn3yY8J+YxQxyhlHfoYOyPgyDcO+cSQK6Bvabjcy2nwRo3pxgA8jslnCuYw23ESOzHAPYwo4ITNQMaOO+RGPEGhSlPEZBh2jmBEjQ5cKbxmr0ruAe/WCriUxW76I8T3h7vqY5VR5wXLdERodg2rHEzdxxk5KpXTL4FwnarvndKM5/MWDY5CuBBdQ+3/0ivsUJHicuHd+Xh3jOdBL+FjSGq4SPCwco+orpWlERRTNo7BHCvbNXFVSIQMp+P5QsIL9upmr8kMTUOfxEHoanwzKRcNAe76WbjBwex/RkdHu48xT5YqP70DaMOhBcTHmAVDxLaBdle93oJy1QKFUh2GXT4am+YH/GGel1CeI98GdMXsytjCKIq/9cMrlgxFCROv+3/BU1fijNpcVD6DxE8VfLBaxUGr1D5usgDYdjwiPAAAAAElFTkSuQmCC
MIME-Version: 1.0
X-Rspamd-Server: mx
X-Stat-Signature: mfqbu4pk744fwcowaztsujifdmdd34aa
X-Rspamd-Queue-Id: 2404010FF7B
X-Spamd-Result: default: False [-6.42 / 15.00]; ARC_NA(0.00)[];
	URIBL_BLOCKED(0.00)[redhat.com:email]; FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
	NEURAL_HAM_LONG(-3.02)[-1.008];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	DKIM_SIGNED(0.00)[]; NEURAL_HAM_SHORT(-0.69)[-0.694];
	RCPT_COUNT_SEVEN(0.00)[7]; RCVD_COUNT_ZERO(0.00)[0];
	FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:~];
	MID_RHS_NOT_FQDN(0.50)[];
	ASN(0.00)[asn:3320, ipnet:2003::/19, country:DE];
	BAYES_HAM(-3.00)[99.99%]
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=eworm.de header.s=mail header.b=4y6nOMk0;
	dmarc=none;
	spf=pass (relay.mimecast.com: domain of list@eworm.de designates
	195.201.174.144 as permitted sender)
	smtp.mailfrom=list@eworm.de
X-Mimecast-Spam-Score: -1
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-lvm@redhat.com
Cc: Natalenko <oleksandr@redhat.com>, linux-lvm@e1890.dsca.akamaiedge.net,
	Oleksandr, David Teigland <teigland@redhat.com>,
	LVM general discussion and development <linux-lvm@redhat.com>,
	Martin Wilck <mwilck@suse.com>, Heming Zhao <heming.zhao@suse.com>
Subject: Re: [linux-lvm] [PATCH 1/1] pvscan: wait for udevd
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4954071212149141993=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23

--===============4954071212149141993==
Content-Type: multipart/signed; boundary="Sig_/EVnDotJvV_XTyupEd_3Oims";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EVnDotJvV_XTyupEd_3Oims
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Zdenek Kabelac <zkabelac@redhat.com> on Mon, 2021/02/22 10:57:
> > I've gone through the various tasks that dmeventd is responsible for,
> > and I couldn't see anything that'd be strictly necessary during early
> > boot. I may be overlooking something of course. Couldn't the monitoring=
 =20
>=20
> As said - during ramdisk boot - monitor shall not be used (AFAIK - dracut
> is supposed to use disabled monitoring in it's modified copy of lvm.conf
> within ramdisk)

I could not find anything in dracut that modifies lvm.conf, but looks like
dracut calls the lvm commands with `--ignoremonitoring`.

To date this is not handled in lvm2's mkinitcpio hook... Wondering if
that would help. Oleksandr, you could undo the udev workaround, then apply
the following diff to /usr/lib/initcpio/install/lvm2, regenerate the
initramfs and retry?

--- lvm2_install=09(revision 408582)
+++ lvm2_install=09(working copy)
@@ -34,6 +34,7 @@
     add_file "/usr/lib/udev/rules.d/95-dm-notify.rules"
     add_file "/usr/lib/initcpio/udev/11-dm-initramfs.rules" "/usr/lib/udev=
/rules.d/11-dm-initramfs.rules"
     add_file "/etc/lvm/lvm.conf"
+    sed -i '/^\smonitoring =3D/s/1/0/' "${BUILDROOT}/etc/lvm/lvm.conf"
=20
     # this udev rule is specific for systemd and non-systemd systems
     if command -v add_systemd_unit >/dev/null; then
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH=
"
"CX:;",b;for(a/*    Best regards             my address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*    Chris            cc -ox -xc - && ./x    */b/42*2-3)*42);=
}

--Sig_/EVnDotJvV_XTyupEd_3Oims
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXHmveYAHrRp+prOviUUh18yA9HYFAmAzq9EACgkQiUUh18yA
9Hb65QgA5e0mrKyhFIWv9kRdWzOYYdOIIPvRohadCf7UxrkbYEyvkx6Zt06xFRTJ
AdM0W2dsK24k9UYlj56z+HdFQqWN254ymXrdkEmI7M6uAsBf8Z9plnkP9XRO4aiv
3JAq9AkpU73Ntuo+GmqdK/QR56SygWBX0cbwdcl6fxjNjKUbNGVadJcScUsHermt
JJIjluwkTGkQ9U5Ta/ZCeBvRSOYAQX8+fVvu6TWBS2PmKUAxXbaPiERh6YHRrGcM
S+RKmcp2QqfP2n6K+acBEbprZTD9H493+jg5Y72ts7Q63pbkayp/VEvGhuQ0swi0
s/k+yk7z6waRnRBlI93E3W4Itb8Ulw==
=u2Ab
-----END PGP SIGNATURE-----

--Sig_/EVnDotJvV_XTyupEd_3Oims--


--===============4954071212149141993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============4954071212149141993==--

