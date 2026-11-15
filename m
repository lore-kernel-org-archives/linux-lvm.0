Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794737572;
	b=mOemRvu4qPhvB04JfKpBD1Oc9oQH7Qk1WMQB8ACfwBijCDRmpooDFWQSz2PQu99UJYK9
	 k5HrAnteCiXpDa5M7jv+7HKuksSYfisXAiuo3YWV5B2DDCPjcgu3cU7s7qGyEQa+Ocwxg
	 S/aK020NRxHoKgM/M7EUiMWZit+1Y1RFwLg80X+rSZBbuLFb5dRJ4/3gW10QGy0rm0ACG
	 ZwyUvjhz5N3a8moZW1OdZoufDxK1ebu1p4pz41ydYC+7XLHwbpvM7crSFLntAA47yzDnF
	 pj1UWBILHOF7FBbwmfsVYYNLvfulSkQXczRY69PWQZtAebyhPvQQk2HA7fSXrwjpJfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=k59g2OUchoQSb37aPSfu83aqfxKIBIKn5QWqd0BUleE=;
	b=be33fWr3hkra/uC64IPJSKTlK6RlhdNjX7lbgzVYRxrMYc4JqdpZDE+aYfkcGQLHPLLH
	 rmCa3T/CTXuFZUpyhtJ3fAh1HxW+01b2DzQZxi+2PSfzg7aGsMY2ORMlC6vW3qDU8wgTa
	 eUDWwTrfai0AhojneNmLLhgSDmgK3CZxDu1QU6oK8tApSnJYhktSE9xjQhNqBsd+J9Qkn
	 lsBo/6steD2Vin06khEyfCQ3KamOxyzyhZIfUHf556cvPnTiBY5EKNuNj2vWv0KqtO4YI
	 HYF9GtNxnhO7ogX0/T3G0E/a7kGKjbetIa0WoRqPwLvzpjd8vR/q5gRLS/PWgOaaBtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fD/z2oD8";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C815F606A329
	for <linux-lvm@lists.linux.dev>; Sun, 15 Nov 2026 10:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C815F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fD/z2oD8
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36e795af1d4so1815518eec.1
        for <linux-lvm@lists.linux.dev>; Sun, 15 Nov 2026 02:12:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794737571; cv=none;
        d=google.com; s=arc-20260327;
        b=dfRdhtpWPT9Oqki3hsxEF+ws4ffsyf/0QhB9UWSy0zJcslQIrRPEA7Er6HOUOYB1lf
         eVZxKgjqtrbrqnzL66flofHOTFzZjJGIX1ZMDWwP7iU2INgDdU87aS9A3iedqAJUf7CP
         1XK122IBlm2KeaN4JFX58jNqriXGNbtIJ6689CJO655H8KOCT+qVXIJwvl3VSpe6pH8+
         gHMq1kC6WEQSN57+dfO5No8zlz/r28b9pP4mUM7ldy/deQBqQDn92wTO1eoGWM72rhg3
         VLsnG2t0R2XXzdUCCVqux9rVWRv7VwSNlh8dZTWEENHLe+Ge4JbJPd+UmT105FtuzN4b
         /ExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=k59g2OUchoQSb37aPSfu83aqfxKIBIKn5QWqd0BUleE=;
        fh=iQOWxowsu+faQgcWO2V4Hll1LFv7Q5iitXvpXh+DqLU=;
        b=QULzBOGzwgCe13liPBSwwX9mD/9WYlcJUEcSduRgJI1OiI0OwV6npHgH9XCZxmR+nc
         eCa0GzGArQw9gxbWklMgOW3wz4fKafIpnYlDER6ILpIIK4d/kvB3YdE9fP5upDQY5Iep
         GYJnmSjzGpSmSJOlM55wD9rDKxlVtu9MvqHhuq8SlUW/TZSWc9AAxEA8fAKEAmxMd0qE
         Ztf5q8+askm29s5D+x0MIMkDSt1vxnUPQ2afG+kPTAEQnZH+hhNNRP/CqSaCzH2Jf4O1
         s6mOM/6DUGUHGc9GBeBfPZyUTXTTaJv7uqwXHlDMu8Iyhzt2RapbyUpSbh6LVdj4jKiZ
         08uw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794737571; x=1795342371; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=k59g2OUchoQSb37aPSfu83aqfxKIBIKn5QWqd0BUleE=;
        b=fD/z2oD8tD9EKXx0YnHkGYxgYfKPgF+p9CQujTl9ZDI5VxgIpBEQjfPoHUVN/QqBf4
         9I9mERubyIgr6mTvQpb14HsfPYilHuQkZbzPcK5Rbo3bY1V8+gO5w3IRI4ckUmF8dPcI
         BjlVdRS3hbzvO08bJDuYWeN6S8e9fAqcwoWUx502Ih81VubWEXseB+YYtV0zlSG01i6Y
         Q56gFgGMSKvA3bd69B5+JbrTEhBJ7X5rE4b1g5IQrsZAxMGR4WvL2z+sm2/+VKU0WPLc
         PEC7Vuwv/kZFxHBVwCJZFEOU3L8l3Oeyl8k1wzi0QqAvwuxnHUNAEJPjXyw46ZpvNuUU
         3w/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794737571; x=1795342371;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k59g2OUchoQSb37aPSfu83aqfxKIBIKn5QWqd0BUleE=;
        b=j0f1oSWQEq4PwgHDlrOHOIFF75CupiapgAkc3COsGyky6mg3OxjPGKjXrQ+fvWoBWx
         WElxCm7lHENzUakmF9NwM1V29PRwtUiwdJkxpXuOTfiS4ZexmiBc50Exq3LhR9101tg5
         i0dZU3wHAT4sSbLjpBXfUNsxO3TYyG/qO9uqiTZNI2ilCHFosaccq6aQwd/giSW5zK6+
         tlFlfZSTXg3sZ1MC1j6N55VNeNZTpXxtcL6r1B3NS8p5UyDc8IFtP3ozR6wRO5v8YBOZ
         gLK1u7XtaxITh5mEsWCoLE0fiZHiK7dqA4TvpnXEV08cKobxrPm2obAGcxVI/Y/VwbPV
         inmQ==
X-Gm-Message-State: APuU4Z+PUiaNOxmA5KAj3NFiECd2NOtuhy3N5A9vtxts0eN4QIl5u3QW
	BYuEc7QSiiuzWWeTFxwugWhXSqFsoNvS1B1deIY/oNf5X8hLA/ySUJOg25aJB0FRZX1CnNlQhhw
	XyvYz6qKM7wj5mcAJifQgbDvPhdPvJxWeZ/ApR8g=
X-Gm-Gg: AYBFou1w4euxs8WrrwUXa+oHzWuE76Zi/9oSF6tIjB3EiAKeeQarAbAxAmrCyFiA3L+
	nUpmZLc4Dp6vDgbUArbfEWxVdJOp3v+dSrv8Wl9UwJnGTOewiM3LRn9LhSTqs603m5okBfmlb7K
	+QF0h8PALmJip3ThkuLkzHE0J8qZImf8HhJgQ83BeZIOSHnRb4aNLXLXBw/fPUDH9wGVkP2KWx7
	Jr+R6SKYHYerS8UWP8kl50pEge5mKVaBDRDNI6/+J/Fc/jr2s31A/eC/qFLsdo63Q+WjTT8SeCH
	bXzP+bv2JVchckV+eJsH7Xn76U32v29obnghGy8V3fWX1BTod+CS/RzOf/At+7WSoPnT/jW0qqN
	6Q6+kSWHdYTDu2OfYKCxyizZIkp+Ad+BUUuXiGJtg9z/M+l2W3CZe+gOsgq+5OpkfzH8=
X-Received: by 2002:a05:7301:4718:b0:375:85ac:d14f with SMTP id
 5a478bee46e88-377e10172d1mr9194042eec.14.1794737570782; Sun, 15 Nov 2026
 02:12:50 -0800 (PST)
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Post: <mailto:linux-lvm@lists.linux.dev>
List-Help: <mailto:linux-lvm+help@lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-lvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: "Matwey V. Kornilov" <matwey.kornilov@gmail.com>
Date: Sun, 15 Nov 2026 13:12:39 +0300
X-Gm-Features: AclHuK9f34YQ_rBYGGN-y7-MriOAMNlI05cLEzIOg4nQ2hDJo_17NTRWphdKR8U
Message-ID: <CAJs94EY01OBuV0hsOeP3sy=kMCamMRBO-6m4Zx3x72rLcNc46Q@mail.gmail.com>
Subject: lvmthin man page is not clear on pmspare and RAID
To: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Dear LVM team,

Recently I came across the lvmthin man page. My interest is in having
a thin pool on RAID1 (mirror). While there is information on this
topic in the man page, I am not sure that I understand all the
concepts correctly. I think that when we are talking about storing
data, it is better to explain things explicitly.

The most problematic topic is how pmspare is related to RAID and vice
versa. In the section "Thin Pool on LVM RAID", there is an example of
a mirrored thin pool, where I can see that the pmspare volume is not
mirrored. Why? What happens when the physical drive containing pmspare
goes out of service? vgreduce won't let me remove the failed drive
from the volume group due to the hidden pmspare volume allocated on
"[unknown]".

My understanding, based on the section "Thin Pool Metadata check and
repair", is that pmspare is really used only while "lvconvert
--repair" is running, either manually or automatically, so the volume
can be safely disposed of as long as there is enough free space in the
volume group. And this means that each physical drive in the volume
group needs to have enough free space for the pmspare volume in case
of an emergency. Is this correct?

I would be particularly happy to see a new section, "Recovering Thin
Pool on LVM RAID", in the lvmthin man page, explaining these specific
concerns.

Thanks.

-- 
With best regards,
Matwey V. Kornilov
