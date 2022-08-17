Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3980DC25B08
	for <linux-lvm@archiver.kernel.org>; Wed, 17 Aug 2022 18:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660759276;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SVtc2j8TDe073jb/2CJ/NXrlJAn8q9vvs4PxL/EfImk=;
	b=PyWzv61bsiRhxYinp+oMMyUN67Ashdks2DdG4e47Zeb9lGdC+csX9TTuImfCZcndNg7iPl
	gWgOe13VN2L1NvDTtqW5Y/D4SX+cqQQeZjrRuuitje2rHZpoECef8XEBlFHPBA+dIea3AK
	QSWQ4EAiE3laVmb0WIaP01Snno8wy00=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-hvKY8LGlMLmAkrSKzhAMaA-1; Wed, 17 Aug 2022 14:01:12 -0400
X-MC-Unique: hvKY8LGlMLmAkrSKzhAMaA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0A8280231E;
	Wed, 17 Aug 2022 18:01:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A7112166B26;
	Wed, 17 Aug 2022 18:01:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3B0F9194E00B;
	Wed, 17 Aug 2022 18:01:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 73CBB193F6F6
 for <linux-lvm@listman.corp.redhat.com>; Wed, 17 Aug 2022 17:45:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4B038400E122; Wed, 17 Aug 2022 17:45:03 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 475A74010D29
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 17:45:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D839101A586
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 17:45:03 +0000 (UTC)
Received: from plutone.assyoma.it
 (host195-56-237-212.serverdedicati.aruba.it [212.237.56.195]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-401-GaxjEzKqOOWWXaq6dAnYUw-1; Wed,
 17 Aug 2022 13:44:59 -0400
X-MC-Unique: GaxjEzKqOOWWXaq6dAnYUw-1
Received: from webmail.assyoma.it (localhost [IPv6:::1])
 by plutone.assyoma.it (Postfix) with ESMTPA id E9ACE1D656FA;
 Wed, 17 Aug 2022 19:35:32 +0200 (CEST)
MIME-Version: 1.0
Date: Wed, 17 Aug 2022 19:35:32 +0200
From: Gionatan Danti <g.danti@assyoma.it>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <6be41a4e-9764-03ba-7231-911c733ffecd@gmail.com>
References: <20220816092820.6xbab36dcmxq5hfm@c73>
 <be332c6b-4b65-6462-c570-ee6d0e81b985@gmail.com>
 <20220816100802.yy3xqvynil4pcspb@c73>
 <204c332e-2a30-b17a-ecc1-58025454eb00@gmail.com>
 <20220817020225.gf6ooxobdf5xhpxe@c73>
 <6fa27852-e898-659f-76a5-52f50f0de898@gmail.com>
 <20220817084343.33la7o6fdh5txul4@c73>
 <27cd8fd6-1058-fe18-dab6-847d41bf894d@gmail.com>
 <20220817104732.jhu3ug6ahep3rnpq@c73>
 <b36cd2879a9ccaf25d0bb0389291e331adcc68c6.camel@suse.com>
 <727dcd28-99a2-739b-debd-a921e477e0d3@gmail.com>
 <4e0551e18a28ff602fae6e419dc746145e5962d3.camel@suse.com>
 <6be41a4e-9764-03ba-7231-911c733ffecd@gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <6a1d353d97a6dcdb658affe54b04c1be@assyoma.it>
X-Sender: g.danti@assyoma.it
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [linux-lvm] lvmpolld causes high cpu load issue
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
Cc: Heming Zhao <heming.zhao@suse.com>, teigland@redhat.com,
 Martin Wilck <martin.wilck@suse.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Il 2022-08-17 17:26 Zdenek Kabelac ha scritto:
>> I like the general idea of the udev watch. It is the magic that causes
>> newly created partitions to magically appear in the system, which is

Would disabling the watch rule be a reasonable approach in this case? If 
the user want to scan a new device, it only needs to issue partprobe or 
kpartx, or am I missing something?

> There is on going  'SID' project - that might push the logic somewhat
> further, but existing 'device' support logic as is today is
> unfortunate 'trace' of how the design should not have been made - and
> since all 'original' programmers left the project long time ago - it's
> non-trivial to push things forward.

Well, this is not good news. Just for my education, it is possibile to 
run a modern linux distro without udev at all? I still remember when the 
new cool thing for device autodiscovery was devfs (with some distro - 
like gentoo - taking the alternative approach to simply tarrig & 
untarring much of the entire /dev/ files to prepopulate the major+minor 
number...)

> We just hope the SID will make some progress (although probably small
> one at the beginning).

Any info on the project?
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

