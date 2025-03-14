Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E28645
	for <linux-lvm@lists.linux.dev>; Fri, 14 Mar 2025 00:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741911456; cv=none; b=UYMNa+/ADmdyl0wCGt8n6fsFiMl1gOxnpBVJbSKUV1J/+ZkinmdPoSUrVJ80WNeZVKvu/crpY7mb9hk7v8jcc2yOC4PUKaXEDqQL0T3ZhZTAaGeQxmOBvgNWi8cgnCWTZNb8WqnvfOg8pOD71eI0zBZM92UQfaYtboiJ/vl4p48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741911456; c=relaxed/simple;
	bh=RPsHTO752XqkMj9cqzsnATyX/78x/UcBO9C/R/873WE=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=f4OFU5AGBjKCnbCnWBhrK9B3ee4L+Hz036NROyauTJjTfGsCrrtv1P/9q0DQRJ6WpQrJZyxuMdGIleM3Eo3ONz3prdZe9KTQ8Az27WZUsFxn9FV2QAPkVrcA7aUc1DDb4vnWTHTxr/pqN0PA/ye9D3XDln4DpY3BJ+dUtr1yI2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stormcloud9.net; spf=pass smtp.mailfrom=stormcloud9.net; dkim=pass (2048-bit key) header.d=stormcloud9.net header.i=@stormcloud9.net header.b=sxUdj6eZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VszqpAue; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stormcloud9.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stormcloud9.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stormcloud9.net header.i=@stormcloud9.net header.b="sxUdj6eZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VszqpAue"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DABF725401C8;
	Thu, 13 Mar 2025 20:17:32 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 13 Mar 2025 20:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stormcloud9.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1741911452;
	 x=1741997852; bh=gAaAWytFMt0oaBrTwhJvd8qzBvRJ0VKluIFPEAtVqfg=; b=
	sxUdj6eZN0RmaibrrrRhR1A5nBB4g8FRNbbrxaClfs0VKRs0Ba2nNO/KMBvS6Q0W
	LT7W/SdAe4jltbvodIPXBqonPeq0yLqlNS1RrGOcFHN1d+CMYCzmu7k0jjDi9FTv
	BVm80yoe4DXj0r0LkEhJmIxSwzQdb/dq1eedo8UaeChpUd9EKtRHjsbyk+QQjCz7
	4zzrLZ1GM4ziwhMXPE8gM00jHPscunN2CIz/8Uw9WgoPcO1gXA7WEGIM/iP7pZPM
	a7Rr/h7fbCuOtu+jIzbYmV8QqYKXppjtIWmQ6OY33JmI4P5Y9SWWdlLzgJuTNQDk
	djpEG+FB1VCTkriaJadWfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1741911452; x=1741997852; bh=g
	AaAWytFMt0oaBrTwhJvd8qzBvRJ0VKluIFPEAtVqfg=; b=VszqpAueIlIBqaUPt
	UzMoUZ8NPE5PK0cPr2kZ2lb87c8XqOmNQO4i1C2h2I31DwB5vP76aHK1jyr5ESYZ
	crcTVMiT9+4jbgpUa9vinUmFsFRhdqjgMIuWXpJVkTBbjgt88VZbNYXRigpVFV6h
	tbnlm0fWkAL4bHSZEf9uV7wqMvQ8sB+R0ad3+r+Xylvc1ao3Ro5mXBOzzWPYVQMh
	TpB7Q9DYM8VcOIfrrFV8AMPtAQMV7ljjLOYr6gocfuSCtvhkwRS13yQN7KtknmIC
	CCNkUnWqlnJ+1iSqjIF3hxENBqmrccxuga4KaaTU5MfaaDU26CIuZguByOyYqIF5
	Nn1SA==
X-ME-Sender: <xms:nHXTZwP_TSKRNQ09R2QIVYuaLK1ushQ8mruEqGV1cJ8NYYPacACK6A>
    <xme:nHXTZ29iDKf5N3pLgjQvQPmTQf0G4C6ZYvEfsh6SErvo-c6-6CO90kRolUAL8rcvi
    AbULlExxR86-K-QNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdelfeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvffkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfrrghtrhhitghkucfjvghmmhgvrhdfuceophhhvghmmhgvrhdolh
    hvmhesshhtohhrmhgtlhhouhguledrnhgvtheqnecuggftrfgrthhtvghrnhepgfdtjeef
    kedvkeefkeevhfejheevjefhhfffjefgtdduhfelhefhgeffteejueetnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphhhvghmmhgvrhdolhhv
    mhesshhtohhrmhgtlhhouhguledrnhgvthdpnhgspghrtghpthhtohepvddpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepiiguvghnvghkrdhkrggsvghlrggtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtoheplhhinhhugidqlhhvmheslhhishhtshdrlhhinhhugidrug
    gvvh
X-ME-Proxy: <xmx:nHXTZ3T7aTgBuZRPCtWrhv5cz6SLNtEukdQSFbSmNI2lPo6mKBmHAg>
    <xmx:nHXTZ4u03ega6UW4aXLMZ8VFUal1LS4Oh53KHGoitTcgpNmFQDHOTw>
    <xmx:nHXTZ4eFAo0EezTjeQ_EjK32tzkC6oGcZ3uu8GJYeC5LbdcMuO4ylA>
    <xmx:nHXTZ83AZPmtpqo8kYgRaWt6rgMlo_yyvUr0soI2W0SyZAYcu-7IBg>
    <xmx:nHXTZ0GmJEBYHdVGhoJv_XZqMW8cAF8LfaCsODTLmYFKlHAjtgmGLstf>
Feedback-ID: i6f514245:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7FD70BA0072; Thu, 13 Mar 2025 20:17:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 13 Mar 2025 20:17:12 -0400
From: "Patrick Hemmer" <phemmer+lvm@stormcloud9.net>
To: "Zdenek Kabelac" <zdenek.kabelac@gmail.com>, linux-lvm@lists.linux.dev
Message-Id: <9cc24dd9-9589-42fc-85e0-620996523cc8@app.fastmail.com>
In-Reply-To: <c6889d49-e07b-4452-bcb9-f800087b9e90@gmail.com>
References: <0eb680b5-ad45-45e6-bc17-de052aa583a1@app.fastmail.com>
 <c75b67e6-fff1-4a06-8abb-e0501bb039c3@gmail.com>
 <a6386aa0-4eba-4a29-b737-aa93aa2232ff@app.fastmail.com>
 <c6889d49-e07b-4452-bcb9-f800087b9e90@gmail.com>
Subject: Re: Converting thin stripe volume to linear
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Thu, Mar 13, 2025, at 20:05, Zdenek Kabelac wrote:
> Dne 14. 03. 25 v 0:14 Patrick Hemmer napsal(a):
>> On Thu, Mar 13, 2025, at 14:54, Zdenek Kabelac wrote:
>>> Dne 13. 03. 25 v 1:38 Patrick Hemmer napsal(a):
>>>> I've got a LVM thin stripe volume across 2 drives that I'm trying to migrate to a new larger single drive (getting rid of the old drives). Following various information on the subject, it seems the procedure here is to first convert from stripe to mirror, and then from mirror to linear. While attempting this, I seem to have hit an issue on the second part of that process, and am not having much luck resolving it.
>>>
>>> Hi
>>>
>>> Likely you can convert your nearly full thin-pool with a single thin volume to
>>> a linear  LV by just taking  'dd' copy of  if=/dev/thin of=/dev/linear - using
>>> direct io option (and this can be actually faster then raid mirroring).
>> 
>> I assume I need to copy both the tdata and tmeta volumes to their new linear counterparts. Did this, but now I assume I need to do something to get lvm to rescan the new linear thin volume to pick up the logical volumes that are now on it. And also stop LVM from picking them up off the old thin volume. I deactivated the old thin volume, but LVM is still recognizing up all the logical volumes inside it. I could completely delete the old thin volume, but I'd prefer to get the new volume online before doing that.
>> 
>
> Hi
>
> Thin volume is using thin pool that is using data & metadata.
>
> Thus thin-pool can remain active even when thin LV is already deactivated, 
> depends on the use case - and you can obviously deactivate also your thin-pool.
>
> In your case you need to 'forget' copying thin_tdata or thin_tmeta or even 
> thin-pool ssd/thin itself.
> Your 'lvs -a'  you've shown unfortunately  lists *ONLY* thin-pool  (ssd/thin)
> but not a single thin LV  (with letter 'V' in attributes and using 'ssd/thin' 
> as Poll volume)
>
Yes, I mentioned a couple times in the first email that there are many volumes which sit on top of the thin volume, but which I omitted. And that I did not want to copy them manually, because there's a lot of them, and many of them are snapshots. So to recreate the snapshots, I'd have to copy the oldest snapshot to the new thin volume, snapshot it, copy the next oldest, etc down the line. That would be a very time consuming and painful process. Hence why it's not under consideration.

Here's the complete output as it stands right now:

# lvs -o+lv_layout,stripes,devices -a 
  LV                                     VG   Attr       LSize    Pool Origin                        Data%  Meta%  Move Log Cpy%Sync Convert Layout      #Str Devices                                                             
  crypt                                  nvme -wi-a-----  270.00g                                                                            linear         1 /dev/nvme0n1p2(90571)                                               
  crypt-old                              nvme -wi-a-----  200.00g                                                                            striped        2 /dev/nvme0n1p2(36096),/dev/nvme1n1p2(36096)                         
  crypt-old                              nvme -wi-a-----  200.00g                                                                            striped        2 /dev/nvme0n1p2(69632),/dev/nvme1n1p2(69376)                         
  crypt-old                              nvme -wi-a-----  200.00g                                                                            striped        2 /dev/nvme0n1p2(72832),/dev/nvme1n1p2(72576)                         
  crypt-old                              nvme -wi-a-----  200.00g                                                                            striped        2 /dev/nvme0n1p2(77312),/dev/nvme1n1p2(77056)                         
  docker                                 nvme -wi-ao----   15.00g                                                                            striped        2 /dev/nvme0n1p2(55808),/dev/nvme1n1p2(55296)                         
  home-phemmer-luks                      nvme -wi-ao----  350.00g                                                                            striped        2 /dev/nvme0n1p2(4096),/dev/nvme1n1p2(4096)                           
  home-phemmer-luks                      nvme -wi-ao----  350.00g                                                                            striped        2 /dev/nvme0n1p2(57728),/dev/nvme1n1p2(57472)                         
  home-phemmer-luks                      nvme -wi-ao----  350.00g                                                                            striped        2 /dev/nvme0n1p2(62592),/dev/nvme1n1p2(62336)                         
  home-phemmer-luks                      nvme -wi-ao----  350.00g                                                                            striped        2 /dev/nvme0n1p2(68352),/dev/nvme1n1p2(68096)                         
  home-phemmer-luks                      nvme -wi-ao----  350.00g                                                                            striped        2 /dev/nvme0n1p2(74752),/dev/nvme1n1p2(74496)                         
  home-phemmer-luks                      nvme -wi-ao----  350.00g                                                                            striped        2 /dev/nvme0n1p2(159691),/dev/nvme1n1p2(84096)                        
  home-phemmer-luks                      nvme -wi-ao----  350.00g                                                                            striped        2 /dev/nvme0n1p2(166091),/dev/nvme1n1p2(90496)                        
  root                                   nvme -wi-ao----   70.00g                                                                            striped        2 /dev/nvme0n1p2(0),/dev/nvme1n1p2(0)                                 
  root                                   nvme -wi-ao----   70.00g                                                                            striped        2 /dev/nvme0n1p2(62208),/dev/nvme1n1p2(61952)                         
  root                                   nvme -wi-ao----   70.00g                                                                            striped        2 /dev/nvme0n1p2(72192),/dev/nvme1n1p2(71936)                         
  root                                   nvme -wi-ao----   70.00g                                                                            striped        2 /dev/nvme0n1p2(74112),/dev/nvme1n1p2(73856)                         
  root                                   nvme -wi-ao----   70.00g                                                                            striped        2 /dev/nvme0n1p2(81152),/dev/nvme1n1p2(80896)                         
  stmp                                   nvme -wi-ao----  110.00g                                                                            striped        2 /dev/nvme0n1p2(54528),/dev/nvme1n1p2(54016)                         
  stmp                                   nvme -wi-ao----  110.00g                                                                            striped        2 /dev/nvme0n1p2(64512),/dev/nvme1n1p2(64256)                         
  stmp                                   nvme -wi-ao----  110.00g                                                                            striped        2 /dev/nvme0n1p2(160971),/dev/nvme1n1p2(85376)                        
  stmp                                   nvme -wi-ao----  110.00g                                                                            striped        2 /dev/nvme0n1p2(167371),/dev/nvme1n1p2(91776)                        
  var-log                                nvme -wi-ao----    2.00g                                                                            striped        2 /dev/nvme0n1p2(54016),/dev/nvme1n1p2(57216)                         
  lvbkup-nvme-crypt                      ssd  Vwi---tz--  270.00g thin                                                                       thin,sparse    0                                                                     
  lvbkup-nvme-crypt-20250226             ssd  Vwi---tz-k  270.00g thin lvbkup-nvme-crypt                                                     thin,sparse    0                                                                     
  lvbkup-nvme-crypt-20250227             ssd  Vwi---tz-k  270.00g thin lvbkup-nvme-crypt                                                     thin,sparse    0                                                                     
  lvbkup-nvme-crypt-20250228             ssd  Vwi---tz-k  270.00g thin lvbkup-nvme-crypt                                                     thin,sparse    0                                                                     
  lvbkup-nvme-crypt-20250301             ssd  Vwi---tz-k  270.00g thin lvbkup-nvme-crypt                                                     thin,sparse    0                                                                     
  lvbkup-nvme-crypt-20250302             ssd  Vwi---tz-k  270.00g thin lvbkup-nvme-crypt                                                     thin,sparse    0                                                                     
  lvbkup-nvme-crypt-20250303             ssd  Vwi---tz-k  270.00g thin lvbkup-nvme-crypt                                                     thin,sparse    0                                                                     
  lvbkup-nvme-crypt-20250304             ssd  Vwi---tz-k  270.00g thin lvbkup-nvme-crypt                                                     thin,sparse    0                                                                     
  lvbkup-nvme-crypt-20250305             ssd  Vwi---tz-k  270.00g thin lvbkup-nvme-crypt                                                     thin,sparse    0                                                                     
  lvbkup-nvme-crypt-20250306             ssd  Vwi---tz-k  270.00g thin lvbkup-nvme-crypt                                                     thin,sparse    0                                                                     
  lvbkup-nvme-crypt-20250307             ssd  Vwi---tz-k  270.00g thin lvbkup-nvme-crypt                                                     thin,sparse    0                                                                     
  lvbkup-nvme-crypt-20250308             ssd  Vwi---tz-k  270.00g thin lvbkup-nvme-crypt                                                     thin,sparse    0                                                                     
  lvbkup-nvme-crypt-20250309             ssd  Vwi---tz-k  270.00g thin lvbkup-nvme-crypt                                                     thin,sparse    0                                                                     
  lvbkup-nvme-crypt-20250310             ssd  Vwi---tz-k  270.00g thin lvbkup-nvme-crypt                                                     thin,sparse    0                                                                     
  lvbkup-nvme-crypt-20250311             ssd  Vwi---tz-k  270.00g thin lvbkup-nvme-crypt                                                     thin,sparse    0                                                                     
  lvbkup-nvme-crypt-20250312             ssd  Vwi---tz-k  270.00g thin lvbkup-nvme-crypt                                                     thin,sparse    0                                                                     
  lvbkup-nvme-crypt-20250313             ssd  Vwi---tz-k  270.00g thin lvbkup-nvme-crypt                                                     thin,sparse    0                                                                     
  lvbkup-nvme-home-phemmer-luks          ssd  Vwi---tz--  350.00g thin                                                                       thin,sparse    0                                                                     
  lvbkup-nvme-home-phemmer-luks-20250226 ssd  Vwi---tz-k  330.00g thin lvbkup-nvme-home-phemmer-luks                                         thin,sparse    0                                                                     
  lvbkup-nvme-home-phemmer-luks-20250227 ssd  Vwi---tz-k  330.00g thin lvbkup-nvme-home-phemmer-luks                                         thin,sparse    0                                                                     
  lvbkup-nvme-home-phemmer-luks-20250228 ssd  Vwi---tz-k  330.00g thin lvbkup-nvme-home-phemmer-luks                                         thin,sparse    0                                                                     
  lvbkup-nvme-home-phemmer-luks-20250301 ssd  Vwi---tz-k  330.00g thin lvbkup-nvme-home-phemmer-luks                                         thin,sparse    0                                                                     
  lvbkup-nvme-home-phemmer-luks-20250302 ssd  Vwi---tz-k  330.00g thin lvbkup-nvme-home-phemmer-luks                                         thin,sparse    0                                                                     
  lvbkup-nvme-home-phemmer-luks-20250303 ssd  Vwi---tz-k  330.00g thin lvbkup-nvme-home-phemmer-luks                                         thin,sparse    0                                                                     
  lvbkup-nvme-home-phemmer-luks-20250304 ssd  Vwi---tz-k  330.00g thin lvbkup-nvme-home-phemmer-luks                                         thin,sparse    0                                                                     
  lvbkup-nvme-home-phemmer-luks-20250305 ssd  Vwi---tz-k  330.00g thin lvbkup-nvme-home-phemmer-luks                                         thin,sparse    0                                                                     
  lvbkup-nvme-home-phemmer-luks-20250306 ssd  Vwi---tz-k  340.00g thin lvbkup-nvme-home-phemmer-luks                                         thin,sparse    0                                                                     
  lvbkup-nvme-home-phemmer-luks-20250307 ssd  Vwi---tz-k  340.00g thin lvbkup-nvme-home-phemmer-luks                                         thin,sparse    0                                                                     
  lvbkup-nvme-home-phemmer-luks-20250308 ssd  Vwi---tz-k  340.00g thin lvbkup-nvme-home-phemmer-luks                                         thin,sparse    0                                                                     
  lvbkup-nvme-home-phemmer-luks-20250309 ssd  Vwi---tz-k  340.00g thin lvbkup-nvme-home-phemmer-luks                                         thin,sparse    0                                                                     
  lvbkup-nvme-home-phemmer-luks-20250310 ssd  Vwi---tz-k  340.00g thin lvbkup-nvme-home-phemmer-luks                                         thin,sparse    0                                                                     
  lvbkup-nvme-home-phemmer-luks-20250311 ssd  Vwi---tz-k  340.00g thin lvbkup-nvme-home-phemmer-luks                                         thin,sparse    0                                                                     
  lvbkup-nvme-home-phemmer-luks-20250312 ssd  Vwi---tz-k  340.00g thin lvbkup-nvme-home-phemmer-luks                                         thin,sparse    0                                                                     
  lvbkup-nvme-home-phemmer-luks-20250313 ssd  Vwi---tz-k  340.00g thin lvbkup-nvme-home-phemmer-luks                                         thin,sparse    0                                                                     
  lvbkup-nvme-root                       ssd  Vwi---tz--   70.00g thin                                                                       thin,sparse    0                                                                     
  lvbkup-nvme-root-20250227              ssd  Vwi---tz-k   70.00g thin lvbkup-nvme-root                                                      thin,sparse    0                                                                     
  lvbkup-nvme-root-20250228              ssd  Vwi---tz-k   70.00g thin lvbkup-nvme-root                                                      thin,sparse    0                                                                     
  lvbkup-nvme-root-20250301              ssd  Vwi---tz-k   70.00g thin lvbkup-nvme-root                                                      thin,sparse    0                                                                     
  lvbkup-nvme-root-20250302              ssd  Vwi---tz-k   70.00g thin lvbkup-nvme-root                                                      thin,sparse    0                                                                     
  lvbkup-nvme-root-20250303              ssd  Vwi---tz-k   70.00g thin lvbkup-nvme-root                                                      thin,sparse    0                                                                     
  lvbkup-nvme-root-20250304              ssd  Vwi---tz-k   70.00g thin lvbkup-nvme-root                                                      thin,sparse    0                                                                     
  lvbkup-nvme-root-20250305              ssd  Vwi---tz-k   70.00g thin lvbkup-nvme-root                                                      thin,sparse    0                                                                     
  lvbkup-nvme-root-20250306              ssd  Vwi---tz-k   70.00g thin lvbkup-nvme-root                                                      thin,sparse    0                                                                     
  lvbkup-nvme-root-20250307              ssd  Vwi---tz-k   70.00g thin lvbkup-nvme-root                                                      thin,sparse    0                                                                     
  lvbkup-nvme-root-20250308              ssd  Vwi---tz-k   70.00g thin lvbkup-nvme-root                                                      thin,sparse    0                                                                     
  lvbkup-nvme-root-20250309              ssd  Vwi---tz-k   70.00g thin lvbkup-nvme-root                                                      thin,sparse    0                                                                     
  lvbkup-nvme-root-20250310              ssd  Vwi---tz-k   70.00g thin lvbkup-nvme-root                                                      thin,sparse    0                                                                     
  lvbkup-nvme-root-20250311              ssd  Vwi---tz-k   70.00g thin lvbkup-nvme-root                                                      thin,sparse    0                                                                     
  lvbkup-nvme-root-20250312              ssd  Vwi---tz-k   70.00g thin lvbkup-nvme-root                                                      thin,sparse    0                                                                     
  lvbkup-nvme-root-20250313              ssd  Vwi---tz-k   70.00g thin lvbkup-nvme-root                                                      thin,sparse    0                                                                     
  [lvol0_pmspare]                        ssd  ewi-a-----  236.00m                                                                            linear         1 /dev/sda(0)                                                         
  thin                                   ssd  twi---tz--  930.59g                                                                            thin,pool      1 thin_tdata(0)                                                       
  thin2                                  ssd  twi-a-tzF-  930.59g                                                                            thin,pool      1 thin2_tdata(0)                                                      
  [thin2_tdata]                          ssd  Twi-ao----  930.59g                                                                            linear         1 /dev/sda(119235)                                                    
  [thin2_tmeta]                          ssd  ewi-ao----  236.00m                                                                            linear         1 /dev/sdb(119117)                                                    
  [thin_tdata]                           ssd  rwi---r---  930.59g                                                                            raid,raid5     3 thin_tdata_rimage_0(0),thin_tdata_rimage_1(0),thin_tdata_rimage_2(0)
  [thin_tdata_rimage_0]                  ssd  Iwi---r--- <465.30g                                                                            linear         1 /dev/sda(118)                                                       
  [thin_tdata_rimage_1]                  ssd  Iwi---r--- <465.30g                                                                            linear         1 /dev/sdb(0)                                                         
  [thin_tdata_rimage_2]                  ssd  Iwi---r--- <465.30g                                                                            linear         1 /dev/sdc(1)                                                         
  [thin_tdata_rmeta_0]                   ssd  ewi---r---    4.00m                                                                            linear         1 /dev/sda(119234)                                                    
  [thin_tdata_rmeta_1]                   ssd  ewi---r---    4.00m                                                                            linear         1 /dev/sdb(119116)                                                    
  [thin_tdata_rmeta_2]                   ssd  ewi---r---    4.00m                                                                            linear         1 /dev/sdc(0)                                                         
  [thin_tmeta]                           ssd  ewi-------  236.00m                                                                            linear         1 /dev/sda(59)                                                        


> Once you know which thinLV you want to copy - simply use 'dd' to copy data 
> from a thinLV to your new storage.
>
> dd if=/dev/ssd/your_thin_lv of=/dev/new_block_dev bs=1M \
>     iflag=direct oflag=direct status=progress...
>
> Your new blockdev/LV must have at least the size of your thin_lv!!!
> (thin-pool has 930.59g but thinLV could be possibly much bigger - so be sure 
> you know what you are copying and where!
>
> I'd highly recommend to check at least  'man lvmthin'  before you will try to 
> follow any googled advice.
>
> Regards
>
> Zdenek

--
Patrick
