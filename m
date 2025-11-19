Received: from sonic304-9.consmr.mail.bf2.yahoo.com (sonic304-9.consmr.mail.bf2.yahoo.com [74.6.128.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B71A365A12
	for <linux-lvm@lists.linux.dev>; Wed, 19 Nov 2025 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.128.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562499; cv=none; b=l10Qx3fmaT9r4TnH4mkqNpy+Qgo91Agbw/EHOfdbGW8yD7V3c2J8EhCweXkHnKbzo2mXmXHym+xXSEZ2t+Te/UCucX9K/rVg+2YEJ55OsS0PDjOzSGjMG7lOkIiCWs79I+XnY12XpcjB264RZxniuVffgRzOO7aelbh1WY+dxuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562499; c=relaxed/simple;
	bh=Xi0wSDDTM8UDKo55pPb71ki3ieGV0DXMoXp4NuIy4Cc=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=lX0G2m0A0TH3npxnREIp6BXOzag/rPS2Ud2edUOv2FTvnczKwiZAEALvoRPgdjbwkVyVaGAoal1PfRIlMf4ESmeqeFmICL+nAyFVPUlND5aXUOTGeKxCOHuM4+KqG6LtgKzUzdDxvXTj5KCuMCf/BHGmqn9+tv7aMPMyDEDGt3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=kyEW3LYo; arc=none smtp.client-ip=74.6.128.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="kyEW3LYo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1763562496; bh=J5qbKbAmYqSSN/iljuxZ6/YkQ47lX48maH+zRMZRkYQ=; h=Date:From:To:Subject:In-Reply-To:References:From:Subject:Reply-To; b=kyEW3LYoKiq62sM0gStoba80zSVpP0gtsgBkOUDUCq2uDFR6ZB719UbxtFzriIgZ+0a0GHm8Kop+tBu0h+cX6zaSFyoZU5MuFV9gDAyHqZh6MOGajRscYcrXCDd6Jv3YmkRQqG1ehySwEFiBbYyKP/z1csGSwoOwQZIYnsd1DuvpywFpFVGzzTlF9TxivGs4jwDcKbAyXbANSOGbZhKDx2i2tIjOMNesvP+N9pVviaFKpoRk2ScqZglod1YaJJTrloLNJm7D77iQIpccG57YZrrTFUJvuW+2IdGlWDEryazPckS2H9s0XNFxkNp6KfnAJw24zrfKWApZ+uSddFs5CQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1763562496; bh=EKWYvofulqi43JnsY8BZ+gEGOYSbF4d3lRgcju2unX2=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=WuXUW09TXWgPycdrZ+3oh2/T3M5oeCxcJ1WPz8JWK0XJNx8mMewpq2xCmYPcDwosGuTQ0DDBjH5eUwGBz5NR2lrlxGMgVOlj/XtzvCghLVlFYYdVVqYtm7MHL7iuw8Sh56exNEe6TcMC0IpfV9wlowfJgJEMDaZPPWheDnnPM7jEUOv3JQFAIt+haGFRaevcATcvoQ63sOpVlWpW64PUNrJ3os61O5Yq8h7nmpOZbcY97gs/qD/ULYBXPk6L182z04D6Duw4tcp9/eWVDdpQRz6fd7EMDZwJO0ZBhoTdcgsO6qnXkbFFGgYoEIRMUPuPB37xFL7Ch2BGgpwG78jbRw==
X-YMail-OSG: koXOCS4VM1mN8YA50q4EXMkWcu1.LEUrSCsDMUVZSDSXkEE8Trhg3Hy_7zx3tuQ
 U8zFfPAKcxP2AgRsMIesNpQMzl_PGn4pDXhOTXZRhv70yZrzB_1TKtydDK9jpiVnMZ6KpNZo72cg
 RFEhbkgXtzQtA_QcWWaHDIK5UpbElwcr00LjbQsC2aJEuXA2YtMcvyYJr4iAI8gNUIbl5QXCtBzk
 yGAMrajxzOUwnBz0s3Znx1sPHUT3h8PKITyUF8kudI5a7oyhg9GPH322c0RlS2lSJVD_k_Ai7sss
 QDJAKXmhOjjDgytvBCT1G.PKO4TlLjGeSivN2wegDW7.CqR_lxGXDaEJzwtgQxHAgqGE.7mBlO98
 Xyz_7qD1S5vOtmbDoCavzRPFOngn7v6bv5IqppplST3GhvtJCG0UcFqzoH6nUYU46GcKhNYHdAUl
 nXCwkpSPwVEYXt5I5HXyxOrgcrrYZ_4Jx2pWFm_qWWoMuz46FJMNKOB48mfAtnR.Pp8YE6iNgZX4
 0QE7ClpJlYSdT6y56gXRzYYCzFqVbV9vwqwUZcIWuTtnY6WetIZdBvwS2Kx.kwmmhK_u.wfv3.WZ
 BPauVYxdo4N5HgUdImCv.0dKTKxf2Vm2c7FH3iPIiAUu_6_vHvx6T57CdWCLJgMrAP4Ybx8W7qbC
 on0LxDg6Pum_SeOck45l16zqdwQ844sQTvIyafKEYvR8unElAXb6E6jMbTEBaT9PzqsAxY2i6If6
 A853vQo0cMMKRLBmjLage0yNBsSVmOZ2IPTQ3thmmlUs8hGQEHmBEb9Zqiq.4ocj7_GKaBK7Filz
 m0GcjDYl.3_UYO3DQL0hqRfn3CqGgMB67cBXpUFGkNSvK4e0qJXGCTHGipJQARkMvppkXjRY8T_s
 _g75W8Zg3epaLdTchFwG201KZbwf2Y7hhg78XxbpL_NyxfX0fcRvKZynokUS4Wz.xGgYWYqwg8bf
 j9cj9PxUxd6K2azblJvrWdy49CZ4nrSZ48_dvL3FXnJFHLmfkR66hPTYhxgoFOWMvGfgtTuJ4Vvr
 9jKAiASrEmyZMYTCO2ZTWwuUyCpSRfWJRQRZ2iz0iNXWAW.fG5SpTW.h0Ybvlst78QXdAOtzXl0u
 Jz9BYum.k0qKZzH0H1rQRFJOD5gcK90BBCuv6joxQ2A7NWQwgod.9WJSSKGDLhySgomqCpy.60QZ
 OSvD_LV1MK1ZJR8sllt0KdgG22AJLRRfqRHkV3Tel_R11f4vU8yR4BB8rCfci7FHiskEfiJJbEns
 uzct7gVnX6G1NyAAoyHfRdAF0c_z8xuIW0y8fMyerRdXqDZfYVqq_QMeKnxBk6US5H2U5lJrHK0c
 it64nVvFiFa5hjuC_CeVj7zMrX3AbBUSFB4US3ceGIPm9162h0FTBYjFdMjv8t2Ii.vyIw9WEZsj
 pHmN1Z9dX8QPEv7_qU3so6jVKcdLKQRpwjgcE9k4MuiJ0GQjB4WcEirwZbl9S_FzHttCXsesuVWj
 PzvHr9po9Sy4NVSaco_0rJ52UTbcWM0wpr.Bj4zXJtuHLsph_.VBY8SG99ClksnULXq9OKRB2uN7
 zS7XXby5CK32ARL1K_jKjQh7BWAZF8zjQRkDVyTzgcM8mnOdz7uLQMRscB7pSV7r1KnqjfMQDF4_
 TBQK2XFWxmJQmtjonNxnwLzt62MDdj4PDYLFq__nKKetJDQ30zfGwIHrrYjnAcp.73RLdm2fWJ_A
 zbTpIq6QsD0bblEFRL22njvecu5mOwGgdwI_B06cRAb8TYmm816pxhbooKVEaaaBd7WBHOV8I2Zj
 RuLkR1GHEu1LhJXayDWMJu1oktagIWu26e6QmIqJhLJI1O00YuxvMp6Mx7kRt5N90bJ1ZUAK1pZ2
 KRQyaqTt6kPJmHUnOWJLE2MScb43GGp67CmfonmZZ4CNs9ZpuOkM9t6Sxl9K2H.kN4FzLHEMWtTX
 K51bY.lWJgeslbuFpQzaRWY1Z1VkAtCV6GMLCq3joGsrhUQq9dzwu61XjmTSyZ.wdbmTKOKzvQFW
 zub__M9bW4iKe4Mgzja2lqSgpXY1L687rPGboEWbepQITZzYrEY60UUeLR_zfZzjIAaiixRRJfaD
 1XEj_6_ZBTXrrZAKkwLp5ah3.JwLg60cKn5kFcCChbPXoUvNfxYpxeIY7Ag1tXhAAzZWBxspuJ2N
 _YVjyYxAL8ntBbbTQ2M1SOmqP7Trc3TDEAelslwCPgD8aMrJGHnGJCVtJq93dSgRlLRQYUdNKyzi
 uKIF1ZxGuxEinx03B88Hv1QVUpaojHnnE07gpjYuVwffKy2hShpe33x1yuxzpTSRCHuE4
X-Sonic-MF: <pattonme@yahoo.com>
X-Sonic-ID: 8854f6e1-1122-44fe-8dd0-b206c6b24cc7
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.bf2.yahoo.com with HTTP; Wed, 19 Nov 2025 14:28:16 +0000
Received: by hermes--production-bf1-6ffc4bb657-xmtbn (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 28db249faac567845c3c8c22b3626ead;
          Wed, 19 Nov 2025 14:07:58 +0000 (UTC)
Date: Wed, 19 Nov 2025 09:07:47 -0500
From: Matthew Patton <pattonme@yahoo.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>,
 "Brian J. Murrell" <brian@interlinx.bc.ca>, linux-lvm@lists.linux.dev
Subject: Re: pvmove thin volume doesn't move
In-Reply-To: <3620fc27-e54b-472d-bc82-be01f7b2739b@gmail.com>
References: <be9db13beb543be237fa069e3c72e22e1df2446c.camel@interlinx.bc.ca> <1b6fb117-7283-4ba9-91ee-7412a2d77b3d@gmail.com> <29209080-c09b-40df-86c3-f22c1d7f6520@interlinx.bc.ca> <5067ec8d-991b-4b90-ad3b-f9dbbb0472d5@gmail.com> <81e51a5ad8f9c32610b8262447af635da81d53c3.camel@interlinx.bc.ca> <3620fc27-e54b-472d-bc82-be01f7b2739b@gmail.com>
Message-ID: <6D706D06-AB0F-4C55-9F68-E8E07926A511@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.24652 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

<quote>
Usually once user goes with thin-pools - it's decision taken with knowledg=
e that the only way out is to take out whole data out of thin-pool and copy=
 them to the new place
</quote>

That is one hell of a wild and unsupported assumption=2E Practically nobod=
y , even seasoned sysadmins would know of this deficiency=2E Does the lvm(1=
) manage splatter this warning prominently?

Pretty sure the HP/ux and IBM implementations support thin movement=2E
 
