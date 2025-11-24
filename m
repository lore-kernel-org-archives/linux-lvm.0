Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E410248F7C
	for <linux-lvm@lists.linux.dev>; Mon, 24 Nov 2025 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763972760; cv=none; b=VCCY4TGFnbwGAmSi7os9KskiMcD0oF4uLY3ZEo3X9WMOl46UK6ACCUeaSGjYAv7C0iQYacPN2G4Hkk1ZowsC+glibNsU/mBGCFJjJ7eNtPfTZhc85E+dccGM1Z5ZXq4cwmeT9DH7ukJ6ae4xfxslxfY/1pVHhZXcRpwgW5p2C/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763972760; c=relaxed/simple;
	bh=zmweyytpMJc2hXdUweZalK+eH6siI2aZe8XaEcvl934=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V/rixEaXWzToOXeANihm4B3gg2CObKsOOkgS9Oys7nNSvu0Sb7aSieU/d7q8qjJIl31xJ6Zt7fT3vDUQsiRXSJGdz7qGyEwfvk26NgB8s/qwr0hvs9oELZtgRybTd8dXYZsSbBWgloSdj1fxWnGUHSyzN3trXs3dtNmE1B5c0Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dgreaves.com; spf=pass smtp.mailfrom=dgreaves.com; dkim=pass (2048-bit key) header.d=dgreaves.com header.i=@dgreaves.com header.b=YiGLf+I9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TeVxUmEa; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dgreaves.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dgreaves.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dgreaves.com header.i=@dgreaves.com header.b="YiGLf+I9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TeVxUmEa"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id A136CEC03B8;
	Mon, 24 Nov 2025 03:25:56 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 24 Nov 2025 03:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dgreaves.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1763972756;
	 x=1764059156; bh=scBEyHFYeN0fLouJhreL4dSh/p9eQu0EmeUHN3W52bo=; b=
	YiGLf+I9CqBK7LuuiVpnG94rvdQHoat50I3JdkDZkrTXA0hUtPKxypYfWeQTewG4
	tKaQlv1f7exnwfKFGJ9XfDelbRa2e5QQ0Tg77+JWSjWsNOzxkEi4PPZvmbIz46iI
	Noe1c4/kQ3BdcYEWim8Xkp/hRRL90yA3xUA8zQjm5u+TW8QaxrDhVMNdzjw4w+fA
	32c/50o2B4dU1QQ/mpYLOmX15AJXBRrAev5NrZ7vdbiY3vUdEgyL+fMGhQtpnR/r
	d/4joCL00LSGvTuXdpgAAWd2Kb5T2NBxHJZthkGge9gj1s4nGI8IrUVpsw6bWz3C
	5W25o5gJhtw8htoCjwCuxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763972756; x=
	1764059156; bh=scBEyHFYeN0fLouJhreL4dSh/p9eQu0EmeUHN3W52bo=; b=T
	eVxUmEakn0zARNru+klPkuWWWQ49ETcXIEMEsmK22tXqpAOsvwoWBWx6fRuGy06m
	rOMhz2Jx28U0xW8vDe2Y2BxSoYSkca5LT/lgbT57zp+xqmR+ndRePrl2PmNYRWxA
	uXNHpsPVUffgkCpVj6Efmdzj3iRdBjzOONgszwTkMYrN3eACz5ixamfJJMEZczqs
	1bUluy2hHF4FqOollIWBjxJrj1qloyUcuDG7hRNKVordDnIn16ktVUiH3CQcA51F
	DkbvMrLrwopjwx7E4yqWZr1raNkZRfD/IkbseM357PrLoL5JR2qcAiynCgB3ZORk
	eHMams+P29CAArm9vRyoQ==
X-ME-Sender: <xms:lBYkaZ-EB2cBAsGTYXlGWAj61blrK2Je71xnXXg4pPQAN6hW0eci2w>
    <xme:lBYkaVfVuKzCCGCpcT8clspgWST2S4CQTp0disNgTx-t-M_wstuEU61U1xj17cvV8
    NyScIb7Tr_m0DsVd9LlkweDIFFUWaJba7u3D2-Hg660KCk5WX43ew>
X-ME-Received: <xmr:lBYkaaF79CIpsIiTwpLWQ16cbad1AnD86uRQN4qevN1cO88GJ1o9iD5EQlCM1kAlkW-r>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfeekuddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeffrghvihgu
    ucfirhgvrghvvghsuceouggrvhhiugesughgrhgvrghvvghsrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffueefieehtdehhffhfeegiefgjedvtdefieelueellefhffdtvedtledt
    tdefueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gurghvihgusegughhrvggrvhgvshdrtghomhdpnhgspghrtghpthhtohepfedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepthgvihhglhgrnhgusehrvgguhhgrthdrtghomh
    dprhgtphhtthhopegsrhhirghnsehinhhtvghrlhhinhigrdgstgdrtggrpdhrtghpthht
    oheplhhinhhugidqlhhvmheslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:lBYkabfKKCoH7uIQ49ceeAYWmUXGC3mAflCvIxDFtMDSa8lBNh3euQ>
    <xmx:lBYkacHDBZp5gGjX-8re_Q3rvfErlVxeKYsUheVzf5xkRZ_-mJn7ug>
    <xmx:lBYkacV_bvnulD93biR-4hksZct7XGNwGpGJtM8GFnViuScqE7E9eg>
    <xmx:lBYkabJyXYiW7dalBlzO7lDpeVQ4LL0DvlLh_CM8ciE_ZZ8FdGEqeQ>
    <xmx:lBYkaW9oTbLQfLp9zK3rxRtu2YJPceUAmxSt6QV3ty4zF5scUbRinNmR>
Feedback-ID: icce842ab:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Nov 2025 03:25:55 -0500 (EST)
Received: from ash.dgreaves.com ([10.0.0.8])
	by elm.dgreaves.com with esmtp (Exim 4.96)
	(envelope-from <david@dgreaves.com>)
	id 1vNRtS-00GA2s-0M;
	Mon, 24 Nov 2025 08:25:54 +0000
Message-ID: <94be9a4d-557a-4bc6-b133-d275e043fabc@dgreaves.com>
Date: Mon, 24 Nov 2025 08:25:54 +0000
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pvmove thin volume doesn't move
Content-Language: en-GB
To: David Teigland <teigland@redhat.com>,
 "Brian J. Murrell" <brian@interlinx.bc.ca>
Cc: linux-lvm@lists.linux.dev
References: <be9db13beb543be237fa069e3c72e22e1df2446c.camel@interlinx.bc.ca>
 <aR3sBtSk4ADdB70T@redhat.com>
From: David Greaves <david@dgreaves.com>
In-Reply-To: <aR3sBtSk4ADdB70T@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/11/2025 16:10, David Teigland wrote:
> On Sun, Nov 16, 2025 at 08:27:30AM -0500, Brian J. Murrell wrote:
>> Hi.
>>
>> I've added a new (faster) disk to a VG and now want to move a thinly
>> provisioned LV to the new PV.  When I try it doesn't find any data to
>> move though:
>>
>> # pvmove -n /dev/rootvol_tmp/var /dev/sda7 /dev/sdc
>>    No data to move for rootvol_tmp.
> 
> Thanks for asking, one of the reasons we don't really have a plan for
> this, or other things, is that we just don't get users asking for much.

Just to chime in - I quietly read the docs and after some experimentation to 
confirm that this wasn't possible I, of course, reverted my approach to not use 
thin pools.

So please take this as another lonely user not actually thinking to come to the 
list and ask for this kind of functionality.

David

-- 
"Don't worry, you'll be fine; I saw it work in a cartoon once..."
