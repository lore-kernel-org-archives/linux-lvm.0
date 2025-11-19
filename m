Received: from sonic318-26.consmr.mail.bf2.yahoo.com (sonic318-26.consmr.mail.bf2.yahoo.com [74.6.135.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15590317712
	for <linux-lvm@lists.linux.dev>; Wed, 19 Nov 2025 18:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.135.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763575372; cv=none; b=CPQCKs7T/9WWUPBPKq24yODszmlhqVF8j4THYq55NpArs8CP+3e0sBCHSRxSKSIoloa+EInX+MaMRw+o55FZq2pYTzDALHKXgiUol0q8Izi3u4hTzOtSHB8HoXqS4u2sMt0hcUmgNqu8flfgqbojBWS2bYL2olkh2wfmbnQHnt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763575372; c=relaxed/simple;
	bh=yBIF8buh65GuBznvCFuxXe8FSVKlJ6gQ2TAAQYFpxfg=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=RzeW8AnMh0E5m3dnWuSRSYFMrALEPXpjp2ejnQ3/8Wv/16rxf4ttFXCw6HEu+CD0yBPVBVnB6e6K0L2mqEf414vy2uN4nYWj0sAVzjbPu66SJ/KS/mK+Ek6ZogwVxG5VOO2SnJPflqM8gAqkIYjL7hvqOPfPq+l9a0q5sPDUSTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=qCAyu143; arc=none smtp.client-ip=74.6.135.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="qCAyu143"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1763575363; bh=yBIF8buh65GuBznvCFuxXe8FSVKlJ6gQ2TAAQYFpxfg=; h=Date:From:To:In-Reply-To:References:Subject:From:Subject:Reply-To; b=qCAyu143FN6nujS3RYvtSV5eeuysIm5po/UXkEI3hF5qPpE5piZN46HkxoowLzVT4gTGMbe9iuo3KNggK4O1vzfBukM2ovUswxx3rVvaUojqsJa3bXVfDlVnboVFBRvTkJe8Q/AVK/f2wEB595UQKQhI8CztJPRHx+MRXCbgMpcC45lsgmxjZoK+xA4+E/cH/sUx8GZkk2bm1qJVYTH8alnVpftKIvc8u9pJl8rxanfL8waX2ypwh5t6DXchptKcVcSFoFn98VO1vk9p/+URCVI4vdsIV1IRvPmN6If0hKrpiW9JuUK4mE0uaa9xhdJg05D8TkFAjTKzPpZWnTyMxA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1763575363; bh=Q52na8sHgAFzqQ46Ix2BKcjlOkse6VdjXo7cA/plbPh=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=iNDPmc+9Izql+djK9ma88c8rog6S4Ls4wNI8geP00uF3pCSn47g29w0UHKf4Qo9y341v/mMCRC7gtqgiS00pV2Vho5Lo4GffauujkcSXZj4CQ6pHMDJUxottK02BXJey36xgW55atIdYrr5KCAcrwAYnFjTBkiozfW8eh9lpKPJWNe+ZzMOVq/9KMFsnklsuIVnMhH1a2nzwboCp0vYhioAcS25NVdegkMKgY8L8Fq9y1HjVJYVXJJL3r6FrjoUa6DS8fSiXNvCTEfXmoSqH4ElLS0/wKuSlT7uXEVAVg0LFIxQpaCVOlNWMTkETxliyNK2UY6xxx+0Cv/3r9IKndg==
X-YMail-OSG: dh9PhqgVM1m85XewV9UUV3tb3lEOIgylPeUaIDugJq1y8IT60V2ho3zE0DtoI1h
 AkCrpwnwZxZmMLaQXJwWxLwVFUWFPGlinTPhaPfUSPzlTb4LEQhXso2laHdfcZnaCJRqwwTczcPp
 FGpNxpUwLjls0Mn.NXj03ALbGMJsHHE1oJ5nHDXUE8o9xH.8L35J1OM.MoGdg4bTNKwZB9TqZVrf
 FiereslVCTo5triusgqjXZrlK86nncvsv6.6xuhGJG_9bu5HfLgaaQspKI.3Q2XvpYs2j6RIGe44
 PnA_IXdcSHKJm9mU0Z4cM2qWWGOIotg88HNpazZjxVUpxl.sO.IF75x4_uKwxcimiHM3PYWJSE9q
 bCUcLyHWzqXHeLEC_bPY4WNWw64ikjSAK4IrxmJ1LLHlHIMhaoes0_k1TI4QvSr3jFDRRQw52GfQ
 9olAWoMKtdn.fvWyhMGH5DuvYp3tIkPhjng6MF_cibBgp1I8PKWeLn9Hc9NEFt8Fngqy38nUVIFJ
 L0kGfxCzB4LFWc799JML3S.6.5AJHwXjpcsjde.DAId7nPiLwgdeYC4yi9c_LBkOIP.zji4nxYgb
 XGsKTNJFyIdta3Mu7F1CzXGK64UyN7E2AMnPR4RTHDEwFYTUz3XeGkJk7jxprTDEVq3m.n9BYQCs
 YNyOQa6i_AOGi7zU3bj7vMVA9bveXYvLU2DzkqjQ0ecZ.nOVXqnip4OIbWnNo0XLfySEK7Fu16Q7
 xysCql8hPnsz4yTlJtm.nBCmMcMDLPRf1hv.m5oUQn2O2oIEdUHm0fWpUMfZrx9UPoZBOzkVMh6I
 3sF6bdD2VB7T1ZP9NlotHYT8uCF6toDFuUnyI3kgVkOmy6vCvx9uBjysmxINqtet66AzKKKQ6vSF
 TDa2ssSDj6zpZiJ7k8nJRssxmihki8buUiX.y3r_Ih0H1WhThKPqIqpxB.A5xkUAvCjLUFy9DIW1
 sWektFBaDgO9KxtV3qjCc0j7CBtybzE84NIj_CUP5669gszs8Uc6DHkjtGNGVkV6iKKAllxxRqlD
 pjRHsyXtcfxQG5zCeRS0K0xIUDmcWiQZ92TgBCvHmcNpVY5YtjuB8FpAEbwvj.mqumY6tC_uCO2k
 FmpE7hz3PCV.0KT4k3rxzm3Y8w7_twCliMyuwv2tN9K5ALlygLhelIgEq1.yXtGTIlGdOEX9x4Vw
 F9o6TInDY5ieD7VaJLwNPSc.lfzgEOIehjZ4rxOpfddxW_HzE3QG4PJ1d0vd80ctTTAzGJPq_20l
 7Rsy34mxvhBF_dYOJyj2YU0UKCndRj4xUlctf3zBBuNMErLvC2PxwT.P31GawffqeEjTsEo_mBho
 PXeCjIAvHe_i0i3q8W2Y693J_E_8ct2nTRrWlSHx2epuGF54wH_PK2w8eZKR.XyE2ejqHrGLfETO
 PVekEz5bQ_jY4KFmyFmyHolfAK4arP3BuUd4ksjqyQRo9Z217oDDfmJBRpOcYhjh2z55eR0WnFpV
 6dZGg2Q1sfjtSg5TulY1QtHuUwD8ECzbxLRm2lzD2PUtK0EYo6lI9Q5OQZ1D.2p5PkUQZ9Oic8v0
 hFMZdONYr8cO3Gy2PA8OlmTyWAzqypKsnByt936HsgRNtZBCglOu6Z2Ixe4BK_X.udEFpllJOrt3
 TTk_SBsbiu1vtD6BWAdFLr1z5tS8P37JrO67aHAhP6kENwtBVnKyDutl6apoLO87PgGMQhw.Oswk
 dFEk2Z.XYEICZVdW5TgvbAOJj.fozeNsqZuzJf.7y21Cq3aWB_oIaKfANXqdJ9hcVtEw35aPVo_Y
 iTBVLkmlxuZOz.HHJpG.J.xluI_ACj3XT.QoQSEZGj5IcpoPSYfev0Jq3TmgWvrufZfckrs_bJXK
 2k4_pvvjDH0DpV1jLgV7unP8eRgl_uoqcd4_CMeUDl6cVkCyNxpNaTe3Ravsp24pTNeTKeMrInR6
 yytqNtA.Qqvw83uvxUaNF83IZhPFUaVq42rk9SXTMHwknPNu6.Yo6w2FYIjnQw9eREDa_.am9ROP
 RcE4bw8woEWvQ6zJCLqWr9SPHnFUJrWT0HRGQpO4EIdoY3OL40XlvFT2Zz0UV_tcAbYMpZopDCFr
 3h_cNKpaRrOZ__4n.84kbwunnKF3fSLHUXogF8A0406wOgF79Hd_.5gssD.2IJhZISdsGAcMc5lw
 hxlg4xY5pDB_WSWri5Oy4f3H0AQif0VfUOeQbUJNKt_ngW0ls8WwjGoXretqnxefg0qVvXEi.fRG
 5h9bJLYjySd1wWkr1Vrv6jriUo529ndmj_BGQESs-
X-Sonic-MF: <pattonme@yahoo.com>
X-Sonic-ID: 4aba843a-41e5-4f59-aac5-b8baed674f8e
Received: from sonic.gate.mail.ne1.yahoo.com by sonic318.consmr.mail.bf2.yahoo.com with HTTP; Wed, 19 Nov 2025 18:02:43 +0000
Date: Wed, 19 Nov 2025 17:22:12 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
To: "Brian J. Murrell" <brian@interlinx.bc.ca>, 
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>, 
	Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <94679191.5310372.1763572932545@mail.yahoo.com>
In-Reply-To: <9c2a15d0-0d7d-4462-af43-83221c2ecbdd@gmail.com>
References: <be9db13beb543be237fa069e3c72e22e1df2446c.camel@interlinx.bc.ca> <1b6fb117-7283-4ba9-91ee-7412a2d77b3d@gmail.com> <29209080-c09b-40df-86c3-f22c1d7f6520@interlinx.bc.ca> <5067ec8d-991b-4b90-ad3b-f9dbbb0472d5@gmail.com> <81e51a5ad8f9c32610b8262447af635da81d53c3.camel@interlinx.bc.ca> <3620fc27-e54b-472d-bc82-be01f7b2739b@gmail.com> <6D706D06-AB0F-4C55-9F68-E8E07926A511@yahoo.com> <9c2a15d0-0d7d-4462-af43-83221c2ecbdd@gmail.com>
Subject: Re: pvmove thin volume doesn't move
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.24652 YMailNorrin

Right,=C2=A0 so LVMThin(1) conveniently omits "Oh BTW standard functionalit=
y like pvmove() is not implemented."

lvmthin is a sub-set or sub-class of LVM, therefore any reasonable person w=
ould assume all functionality cascades down. Because it pretty much does fo=
r everything else.

> lvm2 has 'no idea'=C2=A0 which disk space is in-use for any individual th=
in LV.
> (there are tools like 'thin_ls/thin_rmap' for that)

And any reasonable person would assume lvmthin would have implemented the n=
ecessary hooks so that pvmove() would work by lvmthin handing lvm back a li=
nked-list of all of the pieces in the correct order so they could be writte=
n to lvm(thick) or to another lvmthin pool. This is not that big of a cogni=
tive leap.

That Linux LVM thin is missing "obvious" functionality is fine, it just nee=
ds to be stated very clearly.
