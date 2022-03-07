Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DEFC433F5
	for <linux-lvm@archiver.kernel.org>; Mon,  7 Mar 2022 14:49:59 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-DFKBhg70OMygLfQRm8KtAQ-1; Mon, 07 Mar 2022 09:49:57 -0500
X-MC-Unique: DFKBhg70OMygLfQRm8KtAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77626381748B;
	Mon,  7 Mar 2022 14:49:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9382F40CFD06;
	Mon,  7 Mar 2022 14:49:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2112819305A0;
	Mon,  7 Mar 2022 14:49:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B92501931BE9
 for <linux-lvm@listman.corp.redhat.com>; Mon,  7 Mar 2022 14:49:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4A1F91402404; Mon,  7 Mar 2022 14:49:49 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 453F71402401
 for <linux-lvm@redhat.com>; Mon,  7 Mar 2022 14:49:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 037F13817480
 for <linux-lvm@redhat.com>; Mon,  7 Mar 2022 14:49:49 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-WvhQ0jXeMCOU6kLJC8CZCg-1; Mon, 07 Mar 2022 09:49:47 -0500
X-MC-Unique: WvhQ0jXeMCOU6kLJC8CZCg-1
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id C92245C0385
 for <linux-lvm@redhat.com>; Mon,  7 Mar 2022 09:49:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 07 Mar 2022 09:49:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=pz3JNPVIR9vCXdIOe
 9FDvW9hfCPFwVK8RIvTNphgRsA=; b=lpgGkm7qX2xtYrCluj+SqCk/Ps5PFVoOb
 zoxc3oKLj1j0Qu4esnggKKGAiUKR0sSuFb3ESSTlaRSfgW0zUUHWyPH5oBhsnUw7
 Ki5kBNWQjgNc07A88a4yhas/gv67ZNX+fZNU0a7rpBusqZQHUSd5gjkWSLFHby2X
 b/HlwjNuyD1ZdwhgwuNZ8vjVg57L+F84kL5V6gVHfibIazunyxzWD+cILK1tY+SK
 3O8SlL/JdCPUjFpX+vtsBLpCYvV4gbOCPl3zePwDPpNGWxIOxv2j/lzYfXipZ7oa
 98hFEVXEu/OET/EOrIVkqGBTnpj5k4p21P9/W+q/VPuq6wOHV4i2A==
X-ME-Sender: <xms:ihsmYqsYzBw-bfMaD5-biphiDsuAEvNAm_LVT-FezC9_Zkst-LMQvQ>
 <xme:ihsmYvc-qvD2z0YbepSqZ55Xn-mZFI7JXMwqGMzAYWqyDc038gETJ-ElokNUGFDs-
 gwHq4bQfpQBsHQ>
X-ME-Received: <xmr:ihsmYlwRI6LMcNixodOq2trlzT3pgYmByEKp7agT5NQe5D0mjBdineTTXDtPPANfj9b12A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddugedgieekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuvfhfhfgjtgesghdtre
 ertdefjeenucfhrhhomhepffgvmhhiucforghrihgvucfqsggvnhhouhhruceouggvmhhi
 sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnh
 epueekfeehffefteehfffffedtieegvdelteffhedvkeeuhfefudetteeftedvlefhnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhise
 hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:ihsmYlN4OphRsgGghQ55RhqrEKcULG2ZJmwkyjFEsgWMaP_MtAnP7Q>
 <xmx:ihsmYq-Rx3vI-5QRcdOOS3jDhTFd9nRSmvCxI2WS5g7tc4Cocl7eGA>
 <xmx:ihsmYtXdFpHfd8O_3DCWyFoCWG7HL5qls2w_8nYPBoexuaYHtMRp4g>
 <xmx:ihsmYtLNqMuw80yMKqb_j8Q-Gah7FWsjbnsw1QeYcMXG_2M8FhBwrg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-lvm@redhat.com>; Mon, 7 Mar 2022 09:49:46 -0500 (EST)
Message-ID: <7bec2261-3eb7-af4b-2841-9d32357d39c9@invisiblethingslab.com>
Date: Mon, 7 Mar 2022 09:49:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: linux-lvm@redhat.com
References: <DM6PR19MB2490CE0E86DFA205D3DE99ABF5089@DM6PR19MB2490.namprd19.prod.outlook.com>
 <c022824d9de289ac813ac8d3dfa2b85c@assyoma.it>
From: Demi Marie Obenour <demi@invisiblethingslab.com>
In-Reply-To: <c022824d9de289ac813ac8d3dfa2b85c@assyoma.it>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [linux-lvm] Need inputs: Performance issues with LVM snapshots
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-lvm/>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=subscribe>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
Content-Type: multipart/mixed; boundary="===============7535192096299582614=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7535192096299582614==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CSkTyNX0TnEwGp1Gn6japE9f"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CSkTyNX0TnEwGp1Gn6japE9f
Content-Type: multipart/mixed; boundary="------------dvXrKF3Pnf9PplfOca3RXBW3";
 protected-headers="v1"
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: linux-lvm@redhat.com
Message-ID: <7bec2261-3eb7-af4b-2841-9d32357d39c9@invisiblethingslab.com>
Subject: Re: [linux-lvm] Need inputs: Performance issues with LVM snapshots
References: <DM6PR19MB2490CE0E86DFA205D3DE99ABF5089@DM6PR19MB2490.namprd19.prod.outlook.com>
 <c022824d9de289ac813ac8d3dfa2b85c@assyoma.it>
In-Reply-To: <c022824d9de289ac813ac8d3dfa2b85c@assyoma.it>

--------------dvXrKF3Pnf9PplfOca3RXBW3
Content-Type: multipart/mixed; boundary="------------Bhy2RqUU7K7p3ojueaz970Qc"

--------------Bhy2RqUU7K7p3ojueaz970Qc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 3/7/22 09:44, Gionatan Danti wrote:
> Il 2022-03-07 12:09 Gaikwad, Hemant ha scritto:
>> Hi,
>>
>> We have been looking at LVM as an option for long term backup using
>> the LVM snapshots. After looking at the various forums and also
>> looking at a few LVM defects, realized that LVM could be a very good
>> option for short term backup, but might result in performance issues
>> if the snapshots are retained for a long time. Also read we should
>> restrict the number of snapshots. We are thinking of keeping it to 3,
>> but do you think that could also be a performance bottleneck. A few
>> forum posts also suggest memory issues with using LVM snapshots. Can
>> you please help with some data on that too. Thanks in advance for
>> making our decision easier. Thanks
>>
>> Regards,
>=20
> Classical, non-thin LVM snapshots are only meant to be short-lived (jus=
t=20
> enough to take a backup), and the performance penalty you talk about=20
> does apply.
> Thin LVM snapshots, on the other side, command a much lower performance=
=20
> penalty and can be long-lived (ie: think about a rolling snapshot=20
> system).
> So if you need multiple, long-lived snapshots, I strongly suggest you t=
o=20
> check lvmthin.
> Regards.

Also worth noting that there is a minimum time to perform an LVM
operation of any type, a bit over 0.2 seconds on my machine.  If you
need to create snapshots exceedingly quickly, then LVM itself will be a
bottleneck.  Virtually all applications will not run into this problem,
however.  The only ones I can think of that will are container or VM
managers that need to spin up a lot of containers or VMs, as Qubes
OS does.  The time I mentioned is the time needed to run the entire LVM
command; the time I/O is suspended for is far, *far* shorter.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab
--------------Bhy2RqUU7K7p3ojueaz970Qc
Content-Type: application/pgp-keys; name="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dx+Ro
-----END PGP PUBLIC KEY BLOCK-----

--------------Bhy2RqUU7K7p3ojueaz970Qc--

--------------dvXrKF3Pnf9PplfOca3RXBW3--

--------------CSkTyNX0TnEwGp1Gn6japE9f
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmImG4kACgkQsoi1X/+c
IsEn9A//QNA7LhL/JXowwupxREzp97DdfUmhK4b8AGpuj2Ryy/QYAU+Rk1zXYfcv
zTk4GO/g6NruiNhUwLgX6l5l2BbGIoysasC68YfdnI+CUp9X0VLtzfuyZZiXmqqO
2SkT78SDUiITeVRoaqs6NHNKuyvkrXdVnD55QErjVi10UTGwnEgXLQLrJD82kLdL
Gjh24K50yT3i4qEOt8UJ4G3NaLEa9NcKi2u+aoo9ElBacvAQE+nGoVQOwoRvxRZp
+83xcBaVsBlD7XzuqIUwiBQ1ZjksaJvXhEUydfi964qMlQGwo24I095/2pnUfO92
/+Hv9zfxn3OqWu+27RqBVeD4zQwJhyUCsCf/AWZ+QlLeLhlzx62nB47f8Wf40A/h
uDlvSFxISW4koL6BmwfXmpgz1VxQYIRCJb42SWA2uYy5/fav59ShW5JlVo/Pn7M4
VcteOE5/Ew1vUC6Jn5niK4rJHYAvfm6D4e3bdsytj7rJRV8ILmQQLgJZrAnPvMZs
Q6rAM5f6lYMMWM8nZ38l5jzn6DD4FJosrbYjHsAek81C8QjmMVAVx39vBZnEFWWg
8KhJk9LRKMDG8D/xfavSJlM6syy2aw4DLBUUBKd1Y37l1EV400bVc6nr0uOdp4RJ
Mz0lSHl6DM55d1nh+DsobDIiaXwgtGCcjUIsku9LDH0JuHkmAZY=
=e7hL
-----END PGP SIGNATURE-----

--------------CSkTyNX0TnEwGp1Gn6japE9f--


--===============7535192096299582614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============7535192096299582614==--

