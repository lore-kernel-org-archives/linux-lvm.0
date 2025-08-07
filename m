Received: from sonic.asd.mail.yahoo.com (sonic310-15.consmr.mail.bf2.yahoo.com [74.6.135.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92901F956
	for <linux-lvm@lists.linux.dev>; Thu,  7 Aug 2025 02:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.135.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754534549; cv=none; b=QyueeBW2DVfe4EVamqIpM56f771q5jsynd1FanVYeWXbUYX94f8uzxoQe8ex6sxlYusuHGyuShXZ21EnIaKmG/v5CNqbhe6XDvsYwpGFxEUGXH0PYvHVNMl09aW/9e+NsIk7+p9lHlr3tS83WJxGLO3WVdwLj5SMrHBgeVv4ry4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754534549; c=relaxed/simple;
	bh=oj8dqyRBYPMGQcYNAPQPdis+C79MgWq1OvF+kMAxNzs=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=sekp9m1PK8TSBgQp2QSKG7I9LNVZyY0aq1Jd6mpQtOt+p1bRSUDYKsD7kN8o5mfI82SYS1TiVpB03UGKqMb8PluQYaxFcvP17Eb1lp32ROeNCHmxNvDj9kVq8osyvQ3Ng9OLQ24l7TdW6x4aosPHaladz7bMNbF9nmoAM/oKJVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=hDlTkUPn; arc=none smtp.client-ip=74.6.135.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="hDlTkUPn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1754534546; bh=oj8dqyRBYPMGQcYNAPQPdis+C79MgWq1OvF+kMAxNzs=; h=Date:From:To:In-Reply-To:References:Subject:From:Subject:Reply-To; b=hDlTkUPn+qYgq7BTcVy54R7jj13WL9VMVxgzEEKYXpxFqx7qLxDylcqp41QJiNTiefCu7cJdVkXg2sb7AxvUBaSewDHskovszdG/CACwqVhPvHnmDRGp7Kf3j0yfjjLrnVhY86CP7sXuXVbLap7lnw3jKoDpgZd+QMAjzg+FFdG+wfCjH4IITOr31zBXoOiEOwo6FpRa7NlzMrlTIQDqxsmKa3Wcd2lVR8BNw7c16j+x6OtbSfAJhWzqULxM+JHowa+vwJNKikaHIpXcjmjedM0URwEp8L6v6tWcvr3ojPwhrLhTT0ez5VwM+pizZ8sVIcwOouxICv5WHEmIzLaFOw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1754534546; bh=SjZQulJdZjrW0df3sx85Din1WDciNiZ+1KbtZ39Ylbf=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=ZG228BlKM+zp2OuiUWi8Ha702I4+XxMNP2gV2hH0QDmhmfXFB3YPSkL76iunBXqUQ4j4IeaJJ8VEGseBjm+Hf4Q0pQyBTFWvIAtUuma+3WIqxWZlNpopg2MZK5fIGRhYL4oY3uEB7vnGXtDJelWeoTIKg9LasLDNECWWzem74CSvM9f5nq5fkpq7+WnkUEA1H2XR3FAdSO0RRNRA4KU48ty2o0bu+5nFeeHv1tSSXRmj+gsCr6RTDcEHDF0zzn8g/XR6aZVbfOe5AsQIktuDZ8s5bjz2tOGAq/gQjeXKOwE+ouygVoncojK9F88cisXeRaln7eQXL3PwipgYEsS1Zw==
X-YMail-OSG: YWiGX90VM1nT55p56gFdahoEjRih8iVaC2R1a0hNu0TmxuOcLknEZA1N4MUir6h
 Cd0qd9XigMWxoTcUCUGqpq9DNcXH7y4zSAm7LCFZFDGZjZM9dhlRSpH9MA2rqxByDAkICUBR9Fvf
 4NqNNrpOHNLizneozc7ygX9szVr68tmWrsHrckJGF4yhXSjkjC18k.9RYZ6Mm1q1pZC6RXofU0xD
 2tTCTBQS7rZLQzpbXH8rVq5QeJ6HkIy5DRK4VKWxG4lTiDMbbKKgJlGIuBtQt3Nssz.6quK6QXpq
 dr69BzPrMqNXZJcgX1FkyWkOkPL53EB5fI641m2S9Wd4IC1W7whgEyKVfdIKXy0ykDDs96ZsGbqm
 vabMAGcrvXIFHXrJW7.Ulumz3dM8UQ7AK1HQqJ11biD61KSfgQOnGeG1.M_71fhBHjhCfvF6y6Sy
 qDz3ealFLBqdym4qvWGds2NnSh2gqHsrEuFypZ7DyffiRu4AIwCT5_5aytPOjrgxFD9bONeayCq6
 lyUjqhubelEAEwdSyKmv8VY7A8b7QobAp5SzXm.iMD0L4Rf7dllMYkzF7QjO548j0k1O013gy.4x
 OsOFbwo0UKZEMHbJgr7Owvm6Hgq29MbgBExMtZhUSr7t7GLCsTk6f.aK_8NURT80pEZMakzt4F44
 U5c9j7BHHzXhou7D8Y4yHTDr3izeIrBieuJg_ET5cqt5A.2iNMJEBw.kenLw48Hkpfm47.FLGBi8
 BRy00C9ZsWH3QIzIJUdK48tWU3KgHmNrrU87ujzjq.OKKPVvyoBZ5Qatdo_kQO0wpLqCEmMsY2X5
 RvN6A4ZqJ7ON.XO27McvBlX0uLu7iX717wN6kRVgIfaytHgjhArMpEHA_HMyXqM0PJ365g7sj7yu
 c1v9fiwXKOv63c2BXISOs5X14FSq6H51jqwdOrFAtSmKaJ7SJS94Hi6J8FZ6JZMr8cSpTVV8p7sc
 7fkRDRvCT0DnsN5PBbav_LIskAQ3mD1GxfvJiHiiiRv9EZWDS.olfRK7W4YCjM_zJOIbQ65fWOXk
 i2mnXxPy.qAK3lIkMlCQYOGNYsrcc0XZuHxLY0wN1mTxq2Mkqi0YN9KhR1syZ1THo1iRpEidOd4j
 8X.NP4oH6KXgPfumyCU3jCjIPhd5exfzJbZirGAWw.0Mwqfunzv7fCmQtMt9cEQsFFxj7ogDquPO
 e.jZueE3DuRCVt5mGKZ5S8cvEzqPIS4jXri5pR6hUVt_6phSGK2r1Yarx4p8YcsbQltPoqDSQrNS
 8FkGhzihZiJs9TOVQj_MsydOMmoz_BenYSMNA0svR2TilVz7eIStx36lvJbrJS8MqN0OyP9lyOgS
 7F9sUNaj7hPeFEEtH3uodJ4L1HNghhmSx7a_BdO..91zQ3PFdhCvzcryRxr3jLYuikM2NwD50in5
 EWjpkL5SjcorXqEJuU9FmpiypIySO99OZMWeijf29oFTMhU2Z8WlU_PaU9BnG6Z2Xmd9pkIzYz2n
 McUkSs39iG2bwWYjyWz9tWuGOqRtWnR.T_XKBkMUpY.l2r_j_Ii4baMZfQlsn5M3V97nyhlfzKHX
 dXvgw62dOeOI0RWSRbC1muiZMZIHDc3Nw_ezFl295CMBOrSv3fpjMETzTcUUH.2vtU3rK.6fX2Ry
 gFcfTlAjRabVbyO.Sd9mJoY10ePJ2ptzcYwf9dUqH_GHQAOJGVd7tNjVTnaA4Llp5lyZO64Gjo5Z
 Tvn1kNUc9n8aCPw.XUQQGQ8EyHnqBLer9g8NBX7ZeSVBZcN.I3Nv0QN8E4yGrcEi_BlSuq1yYyUw
 M9MB1Nyfn9nqXHVE6Rn9hBBdxghrSRcXv5JMxqg4.OzDnDSB2EujCZV5c6P8oMFHaVXB9wpOstsl
 hWgYvF.izwTg5xTjtFZEmHIXaom6D5o8bs_e4p5LUS4G3N6GAInwlu2VX_HEEs27r1m_vI3QvtSW
 ZrlC_cdwGk9zGilEKgK5i6XGyvZQW7q3ICQU9b6V.yxYZDQuJOO.ypuBDL9jiVcuSWVe1.HoeGZ4
 rVmK9MOBJDBrPIzKXbSOPB_IhqVEyG6E6XjNe4fDVEt._3l1jVqyt9v15rPprZrjDUfCJ9tPWEvd
 L2ifNYhYBKByQVFNZ6bs1XeSEzRQM1kpXAonp.iqZxGKa7ijveX560Jq9bRgXNowHaU3F12Ay1QM
 wwaXTb8hIEPP.teAy1oqXUUX03zbq.JDrE1ID3xJA1FS2WVr_z3QOOl0JoKDPOEuZULizqPMAsWu
 sBPHre3e1QRj0OOOvQAElDe_rb242Rw--
X-Sonic-MF: <pattonme@yahoo.com>
X-Sonic-ID: f97d5b91-8736-4c16-9146-d3089982dfcb
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.bf2.yahoo.com with HTTP; Thu, 7 Aug 2025 02:42:26 +0000
Date: Thu, 7 Aug 2025 02:22:10 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
To: "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>, 
	"Brian J. Murrell" <brian@interlinx.bc.ca>
Message-ID: <2070465037.1525842.1754533330183@mail.yahoo.com>
In-Reply-To: <1b749fa978a120d9d9e3ed1951aa45aa753e8006.camel@interlinx.bc.ca>
References: <1b749fa978a120d9d9e3ed1951aa45aa753e8006.camel@interlinx.bc.ca>
Subject: Re: Best use of a small SSD with LVM
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.24260 YMailNorrin

>=C2=A0IOW is LVM caching effective?

no it is not. Unless your workload pounds on the same files over and over w=
hich for OS files is nil.
You want open-cas Linux.=C2=A0https://github.com/Open-CAS/open-cas-linux
