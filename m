Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [46.4.70.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895D31F3B8A
	for <linux-lvm@lists.linux.dev>; Mon, 16 Jun 2025 07:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.4.70.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750060002; cv=none; b=Ua4UWCsjS7p1evKdukqhw0b5aczdonY4Dwix8C2bSXb5xx5L3bUh7ZX0lrE0SvPwwdM1hESXiuJB2jMaKp+6ilgwyUxINdObnX3OyrCix4kvLvo0uc+zM7egyaSrmP2FnHqf2nNJk1DOxUXVSrt3Q8eYqD//aC4DRHcz64xoz44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750060002; c=relaxed/simple;
	bh=B+bMnBzkzZ7hqLh3msuwniAF0ygkpPyVJrjD48zmZH8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KDSHb2q8BdHEb7IyUKa22q7OEKoBGYmfMlrLvVq0pL1ZhBPKzj38dTORS/6ptb9wIV+mmvzPj0TFCMmXWTKw6yRIcMOOjEtnMgLldF296RSUNR377OtjMJD28uOuOY7XK8cfdBGwRYenJ3BJNgvwPtmwVYKdKglBR0VbmZsB4xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eworm.de; spf=pass smtp.mailfrom=eworm.de; arc=none smtp.client-ip=46.4.70.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eworm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eworm.de
Received: from leda.eworm.net (unknown [194.36.25.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx.mylinuxtime.de (Postfix) with ESMTPSA id ECCD71253E6;
	Mon, 16 Jun 2025 09:37:24 +0200 (CEST)
Authentication-Results: mx.mylinuxtime.de;
	auth=pass smtp.auth=mail@eworm.de smtp.mailfrom=list@eworm.de
Date: Mon, 16 Jun 2025 09:37:24 +0200
From: Christian Hesse <list@eworm.de>
To: DeCay <decayhonor@gmail.com>
Cc: linux-lvm@lists.linux.dev
Subject: Re: [packaging] Who packages LVM2 for Manjaro
Message-ID: <20250616093724.734b23ab@leda.eworm.net>
In-Reply-To: <9322a409-f101-4c81-bade-7ea4700c8379@gmail.com>
References: <9322a409-f101-4c81-bade-7ea4700c8379@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
X-Face: %O:rCSk<c"<MpJ:yn<>HSKf7^4uF|FD$9$I0}g$nbnS1{DYPvs#:,~e`).mzj\$P9]V!WCveE/XdbL,L!{)6v%x4<jA|JaB-SKm74~Wa1m;|\QFlOg>\Bt!b#{;dS&h"7l=ow'^({02!2%XOugod|u*mYBVm-OS:VpZ"ZrRA4[Q&zye,^j;ftj!Hxx\1@;LM)Pz)|B%1#sfF;s;,N?*K*^)
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAGFBMVEUZFRFENy6KVTKEd23CiGHeqofJvrX4+vdHgItOAAAACXBIWXMAAA3XAAAN1wFCKJt4AAACUklEQVQ4y2VUTZeqMAxNxXG2Io5uGd64L35unbF9ax0b3OLxgFs4PcLff0lBHeb1QIq5uelNCEJNq/TIFGyeC+iugH0WJr+B1MvzWASpuP4CYHOB0VfoDdddwA7OIFQIEHjXDiCtV5e9QX0WMu8AG0mB7g7WP4GqeqVdsi4vv/5kFBvaF/zD7zDquL4DxbrDGDyAsgNYOsJOYzth4Q9ZF6iLV+6TLAT1pi2kuvgAtZxSjoG8cL+8vIn251uoe1OOEWwbIPU04gHsmMsoxyyhYsD2FdIigF1yxaVbBuSOCAlCoX324I7wNMhrO1bhOLsRoA6DC6wQ5eQiSG5BiWQfM4gN+uItQTRDMaJUhVbGyKWCuaaUGSVFVKpl4PdoDn3yY8J+YxQxyhlHfoYOyPgyDcO+cSQK6Bvabjcy2nwRo3pxgA8jslnCuYw23ESOzHAPYwo4ITNQMaOO+RGPEGhSlPEZBh2jmBEjQ5cKbxmr0ruAe/WCriUxW76I8T3h7vqY5VR5wXLdERodg2rHEzdxxk5KpXTL4FwnarvndKM5/MWDY5CuBBdQ+3/0ivsUJHicuHd+Xh3jOdBL+FjSGq4SPCwco+orpWlERRTNo7BHCvbNXFVSIQMp+P5QsIL9upmr8kMTUOfxEHoanwzKRcNAe76WbjBwex/RkdHu48xT5YqP70DaMOhBcTHmAVDxLaBdle93oJy1QKFUh2GXT4am+YH/GGel1CeI98GdMXsytjCKIq/9cMrlgxFCROv+3/BU1fijNpcVD6DxE8VfLBaxUGr1D5usgDYdjwiPAAAAAElFTkSuQmCC
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EjTuEBAFa6NtVo4K8u63ip+";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.00 / 15.00]
X-Rspamd-Server: mx
X-Rspamd-Queue-Id: ECCD71253E6
X-Stat-Signature: 3qfgqaaojfbqk7otnt6zj8opwgq53zsq
X-Rspamd-Action: no action

--Sig_/EjTuEBAFa6NtVo4K8u63ip+
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

DeCay <decayhonor@gmail.com> on Mon, 2025/06/16 11:08:
>  =C2=A0=C2=A0=C2=A0 I have a question regarding LVM package for Manjaro L=
inux. Are you=20
> involved in packaging ?
>=20
>  =C2=A0=C2=A0=C2=A0 lvmdbusd is missing on my system and I want to unders=
tand why. I=20
> started from the Manjaro forum:=20
> https://forum.manjaro.org/t/no-lvmdbusd-binary-in-lvm2-package/175096
>=20
>  =C2=A0=C2=A0=C2=A0 I was told to look at the package's URL, which is=20
> https://sourceware.org/lvm2/. I think that it's just a project's site=20
> and it's not related to the packaging process in any way.
>=20
>  =C2=A0=C2=A0=C2=A0 The packager (Christian Hesse <eworm@archlinux.org>) =
doesn't=20
> response either.

The packager is Arch Linux developer and not involved with Manjaro,
thus not interested in registering in that forum to discuss.
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Best regards             my address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*    Chris            cc -ox -xc - && ./x    */b/42*2-3)*42);}

--Sig_/EjTuEBAFa6NtVo4K8u63ip+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEXHmveYAHrRp+prOviUUh18yA9HYFAmhPybQACgkQiUUh18yA
9HZ/2Af+JJq0OW3eYdnKj/VZ/klJe2Ns7GSmL7I3Yt9ChVZaoYLjzBshFRZuHpUa
jBchB4Z7VYjAzQN4cJY63TLHc9EekS7u+7pC9P8HnoE8D9hQTVVxm01pHczRb4rv
O25R1BLp6E4zkgAtxrrH2hnpNmCkzt09KzGoNS/W79iXczUuJoyzzN3NBWwvJmVH
RjmYdigS8NZi6Sdmcc/2R062pISFUvaFoRgg8pYDr3IkcwLEDOCQFlFKGyk5cPBP
KbF6vFXXSeME4EP/SjZxKMpCeH77OHDxuC8DO3T5arMJsGy79kG1sc1x6t8q6kdM
WyErcGqONTkUElvvPAnwrGEmlOhgTQ==
=BZha
-----END PGP SIGNATURE-----

--Sig_/EjTuEBAFa6NtVo4K8u63ip+--
