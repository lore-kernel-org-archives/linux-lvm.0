Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD761519B0
	for <linux-lvm@lists.linux.dev>; Fri, 14 Mar 2025 11:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741951855; cv=none; b=NPeEsop9HWLtaqd5knP14ZOoXwWvM6QdsN7PoGEEaNpQ3OfHniVb9eRCQRQrIodxOe2zdEHiLrSeLx2rPrmNnUXLMzRDAg/p7X0emzKuQBwJuvm2UShrtNew2tjLOCpKua+6PlHvr2BlZ09bwi+KN/JJ6WqNZY3A1BCsWEzHYfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741951855; c=relaxed/simple;
	bh=AxqgSeE4wud4xd1vygwfX9cWVpJ77iDS3o3YzJTR414=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=cDnDYQm1uC+JFc+my6jtpMdQTomV5JKvx1N36lvKEFEX7hYCzNpxF5lJBTzHmNt8dseFGMeMSsnZFir8GWZqxTDMfXKVtRuNlJEZ1P52GAvGoDuGo1svarGq4QV6pXeHI2n71Tb6ja4xJL/YLeF47S8ZDovFExUWwwKzkehk0bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stormcloud9.net; spf=pass smtp.mailfrom=stormcloud9.net; dkim=pass (2048-bit key) header.d=stormcloud9.net header.i=@stormcloud9.net header.b=q6tgQTNZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nQQq5NWt; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stormcloud9.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stormcloud9.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stormcloud9.net header.i=@stormcloud9.net header.b="q6tgQTNZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nQQq5NWt"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0A1D611401F4
	for <linux-lvm@lists.linux.dev>; Fri, 14 Mar 2025 07:30:52 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Fri, 14 Mar 2025 07:30:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stormcloud9.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1741951852;
	 x=1742038252; bh=AF0L0XVdUYR3pNAcKjWSHrjFQqCMO5fcnb3gNJeCYWc=; b=
	q6tgQTNZ6EvE20AaZoX0uvwIXuuTDq6rIsleGkxI3Tj3K1a1jiCfyQiOwWcpBt1t
	6pzAjfQJqiK9HovNBlRDw6hKyqksQP82qd4/Y8KadNHag7cl8Y/jxMit4IV9lj/O
	iVynon1FTgaSD6Wh1D3ATZeBUFl5vkVKVX7qfB+q4jqdfQL/f/6lVB+JDcyFJk0A
	MlCvzXwFeFHPOJwDgysego4xZcK+x4avbkNbOX6y+8GvB45QUCu1huOCuVQTcww/
	+sggvIdGjS7j2nKeSDyasGP8mQKYSHiimOZ6sxRHaXLToNZgm1YJY9+WJr8JFGMz
	NPU2h5v6SDmEVhaO2PzI2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1741951852; x=1742038252; bh=A
	F0L0XVdUYR3pNAcKjWSHrjFQqCMO5fcnb3gNJeCYWc=; b=nQQq5NWtTBhMQ+bIf
	aWtcvdQLw2dlAKiPosCwpeaGHAQ+wUd7+22L8vNGD3iw63TThEm6TDrjZfCaZTMg
	pcync+nNIMyKUBNig6Xicz2gTcPLeAcxl/4oPq+elKQL1E5noqnGRzcK9nG+6Yrt
	+a9bbaUsy8zpNzIQTYn0gTmVMyxb80pkcRk3kv9+CNcCCdDyEI+/CqNEpKVKG5wz
	QQ42oloIp9BkzVFDUzrXsUje+786lSx1CBGrZOu0tK7ZWEkHzlMxrKYUBFZtaSG6
	4oJNlXAfoVVsHazEoDTAwwSrSbElzkQNYBLR/um/I6wZOtpPZ6lE3ZG6XG1RtLAa
	1PdiA==
X-ME-Sender: <xms:axPUZxSTeoWDpw7f1BEzd_qzh3Iqn6N3Ib-aNXcE9wwmBQPfx2PMKQ>
    <xme:axPUZ6yzuiucnZCMoGxfxC93aiD6saq1J4150cJBwZvzetv31JpvRCd1uXec9AfZ3
    BUqxgsY7q0hKwm_2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufedtjeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefogg
    ffhffvkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfrfgrthhrihgtkhcujfgv
    mhhmvghrfdcuoehphhgvmhhmvghrsehsthhorhhmtghlohhuugelrdhnvghtqeenucggtf
    frrghtthgvrhhnpefhvddvgeehiedtgfetfeduffdtheeiueelgedttdelheevveekkeei
    gfefjeduleenucffohhmrghinheprhgvughhrghtrdgtohhmnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphhhvghmmhgvrhesshhtohhrmhgt
    lhhouhguledrnhgvthdpnhgspghrtghpthhtohepuddpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtoheplhhinhhugidqlhhvmheslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:axPUZ21g2x2p26MEMbN873KQH18k7vANLQfNGMvbPYOJqepW4wTK4Q>
    <xmx:axPUZ5BoaX7H3arJMKClhGQV_a2a2S65OMLNEcMb-iuE3uCPmaLhNw>
    <xmx:axPUZ6ip1geMGBK1O_z37iLsKd4fydGZW3vo5pvxJ5Po_4IJk0WjxA>
    <xmx:axPUZ9rImcrgEVqjEd5uCBy1CBiVjp-mOuLO8pDzpqZWI_CcgRA25A>
    <xmx:bBPUZyI-OeXg3NnErhcHonki3A25vziXJufI10s9hxXjerRyLG9nUpY9>
Feedback-ID: i6fb94245:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B9EF6BA006F; Fri, 14 Mar 2025 07:30:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 14 Mar 2025 07:30:31 -0400
From: "Patrick Hemmer" <phemmer@stormcloud9.net>
To: linux-lvm@lists.linux.dev
Message-Id: <b9204dfda693b86684f15cbe1a4e5eae83047702.camel@stormcloud9.net>
In-Reply-To: <7a5b8bb3-d413-4804-9a50-7f2874a93dfd@gmail.com>
References: <0eb680b5-ad45-45e6-bc17-de052aa583a1@app.fastmail.com>
 <c75b67e6-fff1-4a06-8abb-e0501bb039c3@gmail.com>
 <a6386aa0-4eba-4a29-b737-aa93aa2232ff@app.fastmail.com>
 <c6889d49-e07b-4452-bcb9-f800087b9e90@gmail.com>
 <9cc24dd9-9589-42fc-85e0-620996523cc8@app.fastmail.com>
 <7a5b8bb3-d413-4804-9a50-7f2874a93dfd@gmail.com>
Subject: Re: Converting thin stripe volume to linear
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

(note, this is a re-send due to accidentally removing the mailing list from the recipient list)

On Thu, Mar 13, 2025, at 20:27, Zdenek Kabelac wrote:
> Dne 14. 03. 25 v 1:17 Patrick Hemmer napsal(a):
>> 
>> On Thu, Mar 13, 2025, at 20:05, Zdenek Kabelac wrote:
>>> Dne 14. 03. 25 v 0:14 Patrick Hemmer napsal(a):
>>>> On Thu, Mar 13, 2025, at 14:54, Zdenek Kabelac wrote:
>>>>> Dne 13. 03. 25 v 1:38 Patrick Hemmer napsal(a):
>>>>>> I've got a LVM thin stripe volume across 2 drives that I'm trying to migrate to a new larger single drive (getting rid of the old drives). Following various information on the subject, it seems the procedure here is to first convert from stripe to mirror, and then from mirror to linear. While attempting this, I seem to have hit an issue on the second part of that process, and am not having much luck resolving it.
>>>>>
>>>>> Hi
>>>>>
>>>>> Likely you can convert your nearly full thin-pool with a single thin volume to
>>>>> a linear  LV by just taking  'dd' copy of  if=/dev/thin of=/dev/linear - using
>>>>> direct io option (and this can be actually faster then raid mirroring).
>>>>
>>>> I assume I need to copy both the tdata and tmeta volumes to their new linear counterparts. Did this, but now I assume I need to do something to get lvm to rescan the new linear thin volume to pick up the logical volumes that are now on it. And also stop LVM from picking them up off the old thin volume. I deactivated the old thin volume, but LVM is still recognizing up all the logical volumes inside it. I could completely delete the old thin volume, but I'd prefer to get the new volume online before doing that.
>>>>
>>>
>>> Hi
>>>
>>> Thin volume is using thin pool that is using data & metadata.
>>>
>>> Thus thin-pool can remain active even when thin LV is already deactivated,
>>> depends on the use case - and you can obviously deactivate also your thin-pool.
>>>
>>> In your case you need to 'forget' copying thin_tdata or thin_tmeta or even
>>> thin-pool ssd/thin itself.
>>> Your 'lvs -a'  you've shown unfortunately  lists *ONLY* thin-pool  (ssd/thin)
>>> but not a single thin LV  (with letter 'V' in attributes and using 'ssd/thin'
>>> as Poll volume)
>>>
>> Yes, I mentioned a couple times in the first email that there are many volumes which sit on top of the thin volume, but which I omitted. And that I did not want to copy them manually, because there's a lot of them, and many of them are snapshots. So to recreate the snapshots, I'd have to copy the oldest snapshot to the new thin volume, snapshot it, copy the next oldest, etc down the line. That would be a very time consuming and painful process. Hence why it's not under consideration.
>
>
> Then you are using somewhat  confusing terminology.
>
> If you want to convert  thin  to linear - it means you no longer want it would 
> a thin volume.

No, that's not how it works. "thin" and "linear" aren't exclusive, and aren't even related. "thin" vs "thick" is the method of allocation and has nothing to do with disk layout, or the distribution of extents on the devices, which is what "linear" vs "striped" refers to.

This can be demonstrated in the following output:
# lvs -o+lv_layout,stripes -a
  LV                                     VG   Attr       LSize   Pool Origin                        Data%  Meta%  Move Log Cpy%Sync Convert Layout      #Str
  thin                                   ssd  twi-aotz-- 930.59g                                    92.40  98.76                            thin,pool      1
  [thin_tdata]                           ssd  Twi-ao---- 930.59g                                                                            striped        2
  [thin_tmeta]                           ssd  ewi-ao---- 236.00m                                                                            linear         1

^ Note how the thin_tdata is striped.

Now here's another thin volume I just created:
# lvs -o+lv_layout,stripes -a
  LV                                     VG   Attr       LSize    Pool Origin                        Data%  Meta%  Move Log Cpy%Sync Convert Layout      #Str
  test                                   ssd  twi-a-tz--    1.00g                                    0.00   10.94                            thin,pool      1
  [test_tdata]                           ssd  Twi-ao----    1.00g                                                                            linear         1
  [test_tmeta]                           ssd  ewi-ao----    4.00m                                                                            linear         1
                                            
^ Note how test_tdata is linear.

> For this you need to copy 'dd'  thins you want to convert - and obviously if 
> you had 300G thinLV + 300G snapshot thinLV -  you need  600G to store them in 
> linear volumes.
>
> If you want to something different you will need to desribe things differently.

I'm describing exactly what I want. To convert a thin striped volume to linear.

> Buf if you do not want to use thin-pool with your new storage - then use 'dd' 
> copy
>
> If you want to however just 'migrage' thin-pool to a new PV  - then you can 
> simply  'vgextend'  new drive to your existing VG.
> Then  pvmove  /dev/old  /dev/new

No, this does not work because of the striping. You cannot move extents from two different physical drives onto a single physical drive without first disabling the striping. To disable the striping, you have to convert to linear. If you try to migrate the extents without disabling striping, LVM refuses to do so because it violates the policy (the logical volume is no longer "striped"):
# pvmove /dev/sdb /dev/sda
  Insufficient suitable allocatable extents for logical volume : 119116 more required
  Unable to allocate mirror extents for ssd/pvmove0.
  Failed to convert pvmove LV to mirrored.

And no, it's not complaining because sda doesn't have enough space. It's complaining because of suitable *allocatable* extents. It can't allocate them on that drive because doing so violates the striping policy.

RedHat has documentation on this subject, and which is the documentation I was following. https://access.redhat.com/solutions/368783

> lvm2 will figure out how to do a mirroring.
> Once this all is finished you simply 'vgreduce' your old PV from this VG.
>
> Regards
>
> Zdenek

--
Patrick

