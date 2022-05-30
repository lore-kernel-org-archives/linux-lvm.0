Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225D9C433EF
	for <linux-lvm@archiver.kernel.org>; Mon, 30 May 2022 14:08:21 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-dsMhvisoPiW9zCoB3NAbEw-1; Mon, 30 May 2022 10:08:15 -0400
X-MC-Unique: dsMhvisoPiW9zCoB3NAbEw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCBAA185A794;
	Mon, 30 May 2022 14:08:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 44506C15E72;
	Mon, 30 May 2022 14:08:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CAE381947041;
	Mon, 30 May 2022 14:08:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D12B81947040
 for <linux-lvm@listman.corp.redhat.com>; Mon, 30 May 2022 14:08:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 94DB21410F37; Mon, 30 May 2022 14:08:05 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 903301410F36
 for <linux-lvm@redhat.com>; Mon, 30 May 2022 14:08:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC7501C01B42
 for <linux-lvm@redhat.com>; Mon, 30 May 2022 14:08:04 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-d7oGoyy_PeOEsJmsz6BLOA-1; Mon, 30 May 2022 10:08:03 -0400
X-MC-Unique: d7oGoyy_PeOEsJmsz6BLOA-1
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 1B3B45C0220
 for <linux-lvm@redhat.com>; Mon, 30 May 2022 10:08:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 30 May 2022 10:08:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1653919683; x=
 1654006083; bh=zYylzc/6KcwRPF3jHjHE8AeFekMVf3Zh9ja1AH821u0=; b=E
 MvqekqK/gPPz0lAvuQCNgzv4AoF3obUB606m+9UOQgS1ttm81F4fWV/Ghi7bZHFD
 hZ7aiHsH7x40G7EHplW4X/A+X2etHfAMGHFd4MhxjT5od4oYpN3TFVRPHDHHhLYa
 UeaKX/cGFA22KFSeCNYtwm1NPnxrwSh8MgjWka/pNIgDTl8jqsJ1rLV6U/XXCYc2
 i+pnrtn5LB342ZYLg6+UGKJImvros8DQr9z1xEt0beB8nsyOw6FQW0lDZFDhiw31
 eWvBRvqKXoo5cbUN79XmXxJcOiyDusNXhMLHoJr/2bmCiYqGnGrxDajz0L3DmWod
 f/jdYyf4q3k7hfzgy5oyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1653919683; x=1654006083; bh=zYylzc/6KcwRPF3jHjHE8AeFekMV
 f3Zh9ja1AH821u0=; b=vu1Od4J/4hyIpyWtYxcxzX4PXEncULSIjJgIb+XLZxGT
 v0L73kwouVY/QFZPJQ60gvJYmGCTltxYYDjoVMYBNg6oDUVFZ8rNK+DBqfz2j0nU
 SgmX535YNjq8dCZ0eqbaOGDwohR4YbZfj08Ruit9/LRFnNcNOp+6T8W5GRMyTOGA
 SpyTXnVFn3vxJ4j9qGIDYlMouBVC5TMHAXw9U6dpub55ZRZcU9bPLo3qrr5MV9WO
 UmFFG+/yMY2OSdATup4j8e+6QfAvTbnx4P4w9bH3mlX2Z+MK+1vregdiKT42uh33
 uvzWVw8qOl9DA+sYJqMt1UBZ3lHC8cnTpl6GOxhOVg==
X-ME-Sender: <xms:ws-UYnKMCFdPQTMbWfBmMUqyQp5wlUoVLIYxFrM3QbKTdUtmf1-78Q>
 <xme:ws-UYrJU4FkgPsXdXukD0uqAGBE7_96yzDGzeT0mPYYsmPHXbxyEiJQZpkh6e-kGb
 SUkkZ2ozT49L-w>
X-ME-Received: <xmr:ws-UYvtTFDjQUbx7yqDYFYeiavz1BJn3EY_9uS5NFCIaojZS3QpG90jXf53c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrkeeigdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtderre
 dttddvnecuhfhrohhmpeffvghmihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihes
 ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpe
 eigfeifedvgfejleefieefgfejvddvfeelgeelieefgeffhffgffeffffhueduheenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesih
 hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:ws-UYgawYn46Avj9bebAmFJPp8KrU178X_c63EtZCQadRcqK6QWHEw>
 <xmx:ws-UYuYa9i8uDnxJUUJKt8Rb_G2BiMpMfwKhxIwlPw2AO_CI87UzfA>
 <xmx:ws-UYkC04kjWZbfFqZpna5t6uDdKBej58FB9Gzsci3m-HAjzyAL0Jw>
 <xmx:w8-UYnlTHy4v7J1HCMUctnq4iQVjzpJMS0bDE7Xhk-4GmTHyvcgFuA>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-lvm@redhat.com>; Mon, 30 May 2022 10:08:02 -0400 (EDT)
Date: Mon, 30 May 2022 10:07:56 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <YpTPwJbsmG9Dr4X2@itl-email>
References: <4ea715cc-3a58-bb47-af41-f40e630f93f3@syseleven.de>
 <25234.19124.329350.465135@quad.stoffel.home>
 <e86ef2bc-84f5-188c-cde4-5848a1c95648@syseleven.de>
MIME-Version: 1.0
In-Reply-To: <e86ef2bc-84f5-188c-cde4-5848a1c95648@syseleven.de>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [linux-lvm] raid10 with missing redundancy,
 but health status claims it is ok.
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
Content-Type: multipart/mixed; boundary="===============2191155521296921569=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8


--===============2191155521296921569==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WAKevN8bogED1S4u"
Content-Disposition: inline


--WAKevN8bogED1S4u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Date: Mon, 30 May 2022 10:07:56 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] raid10 with missing redundancy, but health status
 claims it is ok.

On Mon, May 30, 2022 at 10:16:27AM +0200, Olaf Seibert wrote:
> First, John, thanks for your reply.
> 
> On 28.05.22 18:15, John Stoffel wrote:
> >>>>>> "Olaf" == Olaf Seibert <o.seibert@syseleven.de> writes:
> > 
> > I'm leaving for the rest of the weekend, but hopefully this will help you...
> > 
> > Olaf> Hi all, I'm new to this list. I hope somebody here can help me.
> > 
> > We will try!  But I would strongly urge that you take backups of all
> > your data NOW, before you do anything else.  Copy to another disk
> > which is seperate from this system just in case.
> 
> Unfortunately there are some complicating factors that I left out so far.
> The machine in question is a host for virtual machines run by customers.
> So we can't just even look at the data, never mind rsyncing it.
> (the name "nova" might have given that away; that is the name of the 
> OpenStack compute service)

Can you try to live-migrate the VMs off of this node?  If not, can you
announce a maintenance window and power off the VMs so you can take a
block-level backup?
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--WAKevN8bogED1S4u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmKUz8AACgkQsoi1X/+c
IsEQgw//XMkmku8SmVTksHl0EU0fkr6lUmX2rcO70d9pJ1wAJXtfZVNi98aN1cg+
tKoeyhWzbzT56CXtgPMMt3lHoD3CnLZaf0h0MuzddfSFne5BJukO8YEj1R3jIglG
lHtbsMO625g5GAEaDzuUeZvEjP4kOsKSVI4XnJLiaJmdwmlbTt/n1ULlMicq9ht4
YEWeijG6z7LAHWyofA0kezg6Qz4mg4hBQxvSlbQ5owwLMvwfVoaFOdWgO2Wcxnud
Apr1cZlAvicP3s8Vg1ui2Nn77gOngdWCanUMC7hjlPRKOGxkya/ZZ65JGQHwul/D
3JdSDAVC2/oFvHqbIfRdTnkVOlKhEPisgRqa59l9bE/24YA3vLkXRnMGQNw8EsV0
5K0EePu5a+mlEiT/DQtFmq0zGQGHP/ICiOmlTKKkgg0Nugb2K5u/C8obmjXjVOS4
VucBU6pes1I73/SIxrLg6Iocy0EZLI4CrBvR2tsLyGPqlMlrredjctTZHU3pG9ae
Y8ZwKrAh4W5gkOji8RShGw67I9oObRywMPx0Q0sDjJz+QLdkN/FYeKmGaI6IDzg4
koXWJ9BEZcgb76OpYQSt7GokXCnlWbZklu0HBPsoEpOO1nW7lqgcPz0Y37CHgqIS
T1SPTItYbeGTfJ2pJu7Om+km9Um2tfnN42vtUgNY8RbZ6vCh6qY=
=mstG
-----END PGP SIGNATURE-----

--WAKevN8bogED1S4u--


--===============2191155521296921569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============2191155521296921569==--

