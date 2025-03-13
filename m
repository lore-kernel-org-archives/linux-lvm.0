Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536FE2AF00
	for <linux-lvm@lists.linux.dev>; Thu, 13 Mar 2025 23:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741907753; cv=none; b=CElngaTz1vzqyhpFAm/EAQ+GkNW9ohvCywpgpCaRsJVDpbs2S8+tA+IAmVgzJv47OSyMOhINZ4TcJ8a44Ls2D5YvJOW/lfNj1S0WWSwaePt5fOpLbr6XY2ISfUYhPcb0JN1M3qg/5JnmF657pv7ABqiWvNHYrbkiHC6m91eUdbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741907753; c=relaxed/simple;
	bh=99BSInOeHBWU1xA4imTPvJM/NRUzIrACcMz9AxTIXXI=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=hEC4QtKl0pPaYQKcxAOEY5AiS3y7q6EecEMcfhOhzQFKxPAU0okx3V8dCsp/ziENR58UyIGAxLiRavoEdyXKvpbU7d7xQ90c3Z1xKnk6wdfvlSnEbx4IU+HBFH8PfA2/YJPKQxx3kUfFVDnzN97QLxJDKPScML4lUfBEoXL6h10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stormcloud9.net; spf=pass smtp.mailfrom=stormcloud9.net; dkim=pass (2048-bit key) header.d=stormcloud9.net header.i=@stormcloud9.net header.b=ASa3t+j8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=u/EsM+0W; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stormcloud9.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stormcloud9.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stormcloud9.net header.i=@stormcloud9.net header.b="ASa3t+j8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="u/EsM+0W"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2B5222540209;
	Thu, 13 Mar 2025 19:15:50 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 13 Mar 2025 19:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stormcloud9.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1741907750;
	 x=1741994150; bh=y5JptQ7IJespS0csGlnT7zT9YikzzTRadtThgAd5SsU=; b=
	ASa3t+j8VvGOFHCM5gRSvgdwIuRNhqSM8SvOqRo1tYq47HOKKL7pr4Q9k1H5PB2n
	GcltdjPFzly6hcOGmhxKXuXZTWj//0XqIti/OfxkppBa0Z4lVidq1dHZi7PTKUXv
	YR9vbCVUL6oD94IvOVAus6b4JBeQRhPI1FLRu1fJums+AfyqpHsvgaGsx+mVMYwz
	8mIx1SM8iFf5P3FabjLxIFZs9bRcLiZbr5kgTR5xKo8DOiTe2eY3UhVLTYgR+dPy
	JkFaKIXVXDNc9RhCR5v1/FWRyAMCke0ILEeiUYfnkOtEMonmdqskJ2Ua9l5Ow2SP
	iCstSeAuJWboiUw8NzC4FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1741907750; x=1741994150; bh=y
	5JptQ7IJespS0csGlnT7zT9YikzzTRadtThgAd5SsU=; b=u/EsM+0WYo8j+ax3p
	L6R01fm6SnRK8dGZyx7v2nfAuIFhhDavixcQgquhV/HSej1Uu3hU2PQvfR5HWjXu
	QFD6UDJwoG7YNHCDV8Gi/kOTUS1MCPb2XSFnU3EIz+h0mrgWH0jG9FYz9MRgJMCa
	eXBV+QwKD9Io19rRT9IQFcq+EX/x2kNzpPCXiOzIxd++4ilRFDVn0iA4rdAeUYxG
	sU1hInPDRw31JNnLbTVpPYqPOF16v7ymqQ8MLjp61S7Sqwj+eM70+/FXUnixpQyN
	M4WAAWfSUp6aqJWUta2PNBe39a/0LF9WufLU2c0bXkaWnXUQRjSdiYiUn68qyEZr
	l8uaQ==
X-ME-Sender: <xms:JWfTZ5hguuPkQWQLBPrktpo8a4NpRHfTbLi4Kco3b-T9mdeIyjxMcw>
    <xme:JWfTZ-DMOY0pK2-dcUGDl4cwEcGvlJ_CDOHakweF2hy5xvouxU4mWJY8IW-QQw7zp
    0IEQnKaApCOmMzCgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdelvdegucetufdoteggodetrf
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
X-ME-Proxy: <xmx:JWfTZ5HTjSUekwWhdmsp0l2WCnKYQMy0tY9nm1TEfvvck37gjE2J7Q>
    <xmx:JWfTZ-TGBnZ5jdXuVaXdOt49FwSm8SdbY4dhwdwd--lzzB0fh1u2-A>
    <xmx:JWfTZ2xLB6YtiwAx1FKep82xeE1DT0WEp08kDIE-i-sWm0gSPSEXzQ>
    <xmx:JWfTZ07BVO8lmptJQ7rRlgPPR6XPix1qpRE3NIxbwB_rJAG9Kylfgw>
    <xmx:JmfTZ7pKsuJWWIpe7de40EK2m6D4nP_jLiTDPx6y9TUBBTxn0y0x1Gws>
Feedback-ID: i6f514245:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CD79CBA006F; Thu, 13 Mar 2025 19:15:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 13 Mar 2025 19:14:57 -0400
From: "Patrick Hemmer" <phemmer+lvm@stormcloud9.net>
To: "Zdenek Kabelac" <zdenek.kabelac@gmail.com>, linux-lvm@lists.linux.dev
Message-Id: <a6386aa0-4eba-4a29-b737-aa93aa2232ff@app.fastmail.com>
In-Reply-To: <c75b67e6-fff1-4a06-8abb-e0501bb039c3@gmail.com>
References: <0eb680b5-ad45-45e6-bc17-de052aa583a1@app.fastmail.com>
 <c75b67e6-fff1-4a06-8abb-e0501bb039c3@gmail.com>
Subject: Re: Converting thin stripe volume to linear
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Mar 13, 2025, at 14:54, Zdenek Kabelac wrote:
> Dne 13. 03. 25 v 1:38 Patrick Hemmer napsal(a):
>> I've got a LVM thin stripe volume across 2 drives that I'm trying to migrate to a new larger single drive (getting rid of the old drives). Following various information on the subject, it seems the procedure here is to first convert from stripe to mirror, and then from mirror to linear. While attempting this, I seem to have hit an issue on the second part of that process, and am not having much luck resolving it.
>
> Hi
>
> Likely you can convert your nearly full thin-pool with a single thin volume to 
> a linear  LV by just taking  'dd' copy of  if=/dev/thin of=/dev/linear - using 
> direct io option (and this can be actually faster then raid mirroring).

I assume I need to copy both the tdata and tmeta volumes to their new linear counterparts. Did this, but now I assume I need to do something to get lvm to rescan the new linear thin volume to pick up the logical volumes that are now on it. And also stop LVM from picking them up off the old thin volume. I deactivated the old thin volume, but LVM is still recognizing up all the logical volumes inside it. I could completely delete the old thin volume, but I'd prefer to get the new volume online before doing that.

> If you are converting _tdata - you are basically using raid1 for _tdata - but 
> that is no help to convert anything to linear - _tdata holds 'chunks' and how 
> these chunks are 'mapped' to 'create' your thinLV looking like a 'linear block 
> device' is fully in control by a thin-pool target and the use of _tmeta content.
>
> While lvm2 could eventually add support doing a raid for thinLV - so you can 
> have your duplicate made while your device is online and in-use - currently 
> there is no such variant support - so you need to  'activate'  thinLV
> and without any use/mounting take a  'dd' copy.
>
>> 
>> Any idea how I get past this point? I could just build a completely new logical volume and manually copy the data, but there's around 40 logical volumes on this thin pool, many of which are snapshots, so would be much easier to just convert it if possible.
>
> Well once you go to thin-pool, there is no other route to go back to linear 
> other then 'manual copy' (and no one has even requested such feature).
>
> Regards
>
> Zdenek

--
Patrick
