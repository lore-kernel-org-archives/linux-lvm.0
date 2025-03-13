Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5B263B9
	for <linux-lvm@lists.linux.dev>; Thu, 13 Mar 2025 00:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741826334; cv=none; b=rnwpeQ+m0JyUqJZHRS80kw0f4hdo/p94JXvokNTvCJwJYW0Ah90YVHl4D3smkYELdc2tfEumQYfsWU1ZAHWO0xKAmUfyMcHgZw41MSe8btDHFuFFDDB+VmBsgcrydpPjgbaQkENjYyVvj3fMn1T5zXzE22H1MUVeyJLJCyTkna4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741826334; c=relaxed/simple;
	bh=Gg1BTgKwpR60YJgwamKlj0/7QjxnWWftX9P+f+tLiSQ=;
	h=MIME-Version:Date:From:To:Message-Id:Subject:Content-Type; b=km4gcPC+fh+Inx7cwKiwA9cK3T/NRBIKeaUEjjghIC6nhuLNn60hE2lYNyzhL3//VsnId8hbkqetN1gAFRl0hutjdZYodwckf5OiRL/aZzubMKQQC9Np+L2kLk+4L1Qa3Mzlgah/7D87crg71Uyi5rB2eHAKmBDMwSO/t50qikY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stormcloud9.net; spf=pass smtp.mailfrom=stormcloud9.net; dkim=pass (2048-bit key) header.d=stormcloud9.net header.i=@stormcloud9.net header.b=cj6xA1yM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XIzByzt/; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stormcloud9.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stormcloud9.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stormcloud9.net header.i=@stormcloud9.net header.b="cj6xA1yM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XIzByzt/"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 674541140165
	for <linux-lvm@lists.linux.dev>; Wed, 12 Mar 2025 20:38:51 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Wed, 12 Mar 2025 20:38:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stormcloud9.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1741826331; x=1741912731; bh=15
	IsCUFZvWzUq8RlMzhieinLjPPkdhwFn0BZLD1HpIw=; b=cj6xA1yMCg152OFwT3
	ovi19WobRTrHsCgfWLiGHt+7FERvZElf2Gf3rJfK18XZIN37a9y5gUZflE4OrdBz
	a1t15AWZ7ciE76+j2PnHMe5kkjYiK4AUlReoMEbNZC6VCKRSTpPYa2VNnt571g3y
	xeE5uFUwgA93l16ctFRoA8bc7o+clHLuXdJsZlh6tmOR9O4ydlMyAqHrb4Be4r3M
	d+Zrfbh99opKBRaqFvmFUGnbe8gDAiPQsw6uFb+Lqph5ojHLhSdVJK50bQp1ja5N
	nolRGCq6S1ZWTEEY3Aj+rTNZAYqDMCH33kaX4luFa2PGu3UNuJlHNicY9ynBeU5A
	WuBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1741826331; x=1741912731; bh=15IsCUFZvWzUq8RlMzhieinLjPPkdhwFn0B
	ZLD1HpIw=; b=XIzByzt/OyktfrC7+uucZ8P269r6AL/ziTAb6xFNy8Wbu3d0cRc
	jB8sWblqX/HJaeKtgYMKng2OAO1ZPfvxi8kKElHdm7x7YkSNHsYs7A9V/xq8VrEn
	h3XjP2Nq56yTpYKkl7G5KXYs70+6cM4kCH92XSCJbdF+o1LKNcgqhDlNhcFe8Nav
	TieApX8SUaS88fXX5H5cGK3y9sxmRz/386SNXt7rY/WwzVJ1TXcFPXYLicIBi4Dl
	9bERnP1r7Uwl7DCeln1iQD+k0HCOxfbTexZSGQWVg9XyfdC2LbJZ7DlEf8POHaVd
	ycDu/a5mEFog4nphlVYqccN+/YkE5CrdKPw==
X-ME-Sender: <xms:GynSZ8VK_m44cQApbS7WNDykY2rh0ugm7jxCUsSkg4HU4-9siLjotQ>
    <xme:GynSZwnwBMV9XBzgvafRXJtf0X98lXhDqSj0oaFrG3FqpAVuyKisfDFY9qQD19et7
    smqos6e1O72MluGUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdeiheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefogg
    ffhffvkffutgfgsehtjeertdertddtnecuhfhrohhmpedfrfgrthhrihgtkhcujfgvmhhm
    vghrfdcuoehphhgvmhhmvghrodhlvhhmsehsthhorhhmtghlohhuugelrdhnvghtqeenuc
    ggtffrrghtthgvrhhnpeejteehleeffeettddttdehvedukeejudduteekheffveeihfeh
    leevudduffekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehphhgvmhhmvghrodhlvhhmsehsthhorhhmtghlohhuugelrdhnvghtpdhnsggp
    rhgtphhtthhopedupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqd
    hlvhhmsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:GynSZwaibmAq8xe2GTKOtGGX7qycjfy81TiwWzrHPDwDSptrSm4L9g>
    <xmx:GynSZ7XMF0vqs3hbjjPiu91BQRxTaXLY0AUs3dzNMc475U0OUd2vwA>
    <xmx:GynSZ2mLLERgbwJb6bFl6TWcDOIt-lHmrdqS0X3bfz5ttyo9fycc-w>
    <xmx:GynSZwdO6h-X8sN1V2WCi2MH2H3wKFbpmv5GCmsduka0Qws4jfqf_Q>
    <xmx:GynSZ9u5D3K5tijjrIybuDgFite4BYio-yALpZgdb9K_zV0M_UorTlt2>
Feedback-ID: i6f514245:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 05963BA006F; Wed, 12 Mar 2025 20:38:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 12 Mar 2025 20:38:27 -0400
From: "Patrick Hemmer" <phemmer+lvm@stormcloud9.net>
To: linux-lvm@lists.linux.dev
Message-Id: <0eb680b5-ad45-45e6-bc17-de052aa583a1@app.fastmail.com>
Subject: Converting thin stripe volume to linear
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I've got a LVM thin stripe volume across 2 drives that I'm trying to migrate to a new larger single drive (getting rid of the old drives). Following various information on the subject, it seems the procedure here is to first convert from stripe to mirror, and then from mirror to linear. While attempting this, I seem to have hit an issue on the second part of that process, and am not having much luck resolving it.

So to start, the drives at play are sda (a new larger drive), sdb (one of the older drives being removed), & sdc (the other drive being removed). The VG name is "ssd".
This is what the initial layout looked like:

# lvs -o+lv_layout,stripes -a
  LV                                     VG   Attr       LSize   Pool Origin                        Data%  Meta%  Move Log Cpy%Sync Convert Layout      #Str
  [lvol0_pmspare]                        ssd  ewi-a----- 236.00m                                                                            linear         1
  thin                                   ssd  twi-aotz-- 930.59g                                    92.40  98.76                            thin,pool      1
  [thin_tdata]                           ssd  Twi-ao---- 930.59g                                                                            striped        2
  [thin_tmeta]                           ssd  ewi-ao---- 236.00m                                                                            linear         1
(plus some other LVs which are using the thin pool volume that I've omitted)

I initiated the mirror with:
# lvconvert -m 1 ssd/thin_tdata
  Replaced LV type raid1 with possible type raid5_n.
  Repeat this command to convert to raid1 after an interim conversion has finished.
Are you sure you want to convert striped LV ssd/thin_tdata to raid5_n type? [y/n]: y
  Logical volume ssd/thin_tdata successfully converted.

And this is where I'm stuck. If I follow the instructions there and repeat the command, I get a nasty warning:
# lvconvert -m 1 ssd/thin_tdata

  Using default stripesize 64.00 KiB.
  Converting raid5_n LV ssd/thin_tdata to 2 stripes first.
  WARNING: Removing stripes from active and open logical volume ssd/thin_tdata will shrink it from 930.59 GiB to <465.30 GiB!
  THIS MAY DESTROY (PARTS OF) YOUR DATA!
  Interrupt the conversion and run "lvresize -y -l476464 ssd/thin_tdata" to keep the current size if not done already!
  If that leaves the logical volume larger than 476464 extents due to stripe rounding,
  you may want to grow the content afterwards (filesystem etc.)
  WARNING: to remove freed stripes after the conversion has finished, you have to run "lvconvert --stripes 1 ssd/thin_tdata"
  Can't remove stripes without --force option.
  Reshape request failed on LV ssd/thin_tdata.

If I go with other information I've found online, and skip to `-m 0` here instead of repeating the `-m 1` command, I get:
# lvconvert -m 0 ssd/thin_tdata
  Using default stripesize 64.00 KiB.
  No change in RAID LV ssd/thin_tdata layout, freeing reshape space.
  LV ssd/thin_tdata does not have reshape space allocated.
  Reshape request failed on LV ssd/thin_tdata.

This is what the layout currently looks like:
# lvs -o+lv_layout,stripes,devices -a 
  LV                                     VG   Attr       LSize    Pool Origin                        Data%  Meta%  Move Log Cpy%Sync Convert Layout      #Str Devices                                                             
  [lvol0_pmspare]                        ssd  ewi-a-----  236.00m                                                                            linear         1 /dev/sda(0)                                                         
  thin                                   ssd  twi-aotz--  930.59g                                    92.40  98.76                            thin,pool      1 thin_tdata(0)                                                       
  [thin_tdata]                           ssd  rwi-aor---  930.59g                                                           100.00           raid,raid5     3 thin_tdata_rimage_0(0),thin_tdata_rimage_1(0),thin_tdata_rimage_2(0)
  [thin_tdata_rimage_0]                  ssd  iwi-aor--- <465.30g                                                                            linear         1 /dev/sda(118)                                                       
  [thin_tdata_rimage_1]                  ssd  iwi-aor--- <465.30g                                                                            linear         1 /dev/sdb(0)                                                         
  [thin_tdata_rimage_2]                  ssd  iwi-aor--- <465.30g                                                                            linear         1 /dev/sdc(1)                                                         
  [thin_tdata_rmeta_0]                   ssd  ewi-aor---    4.00m                                                                            linear         1 /dev/sda(119234)                                                    
  [thin_tdata_rmeta_1]                   ssd  ewi-aor---    4.00m                                                                            linear         1 /dev/sdb(119116)                                                    
  [thin_tdata_rmeta_2]                   ssd  ewi-aor---    4.00m                                                                            linear         1 /dev/sdc(0)                                                         
  [thin_tmeta]                           ssd  ewi-ao----  236.00m                                                                            linear         1 /dev/sda(59)                                                        

This is with lvm2-2.03.23-1 on Fedora 40

Any idea how I get past this point? I could just build a completely new logical volume and manually copy the data, but there's around 40 logical volumes on this thin pool, many of which are snapshots, so would be much easier to just convert it if possible.

--
Patrick

