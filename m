Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09568C25B08
	for <linux-lvm@archiver.kernel.org>; Wed, 17 Aug 2022 15:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660749663;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vOaGpnS/qDtizVI3fESxQrata/JI4zb0nkwpPKpqTVo=;
	b=AFbuSiKInNBS1f2xmcg01E0NNQbHn5YfjEmIMhZbjpLqEsRbs/VTnZVGnfI6T898eZo6Wr
	15MAsS3lLfjWKYqh+Dz1hh1xlDwwkVFKx0Ayen/J6gzQJp4/uh/N6DEr3ECYu7nZb1K7ru
	6mWWkNdTbi88MjJYpaeg4knIrmafg/I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-Iv8QuDh2Mpyt3jSOS6SKZg-1; Wed, 17 Aug 2022 11:20:18 -0400
X-MC-Unique: Iv8QuDh2Mpyt3jSOS6SKZg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2FB2280EA22;
	Wed, 17 Aug 2022 15:20:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C96B2403340;
	Wed, 17 Aug 2022 15:20:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7F757194E113;
	Wed, 17 Aug 2022 15:20:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7157A1946A40
 for <linux-lvm@listman.corp.redhat.com>; Wed, 17 Aug 2022 15:12:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 61193492CA5; Wed, 17 Aug 2022 15:12:00 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27CC0492C3B;
 Wed, 17 Aug 2022 15:12:00 +0000 (UTC)
Date: Wed, 17 Aug 2022 10:11:58 -0500
From: David Teigland <teigland@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20220817151158.GA27556@redhat.com>
References: <20220816100802.yy3xqvynil4pcspb@c73>
 <204c332e-2a30-b17a-ecc1-58025454eb00@gmail.com>
 <20220817020225.gf6ooxobdf5xhpxe@c73>
 <6fa27852-e898-659f-76a5-52f50f0de898@gmail.com>
 <20220817084343.33la7o6fdh5txul4@c73>
 <27cd8fd6-1058-fe18-dab6-847d41bf894d@gmail.com>
 <20220817104732.jhu3ug6ahep3rnpq@c73>
 <b36cd2879a9ccaf25d0bb0389291e331adcc68c6.camel@suse.com>
 <727dcd28-99a2-739b-debd-a921e477e0d3@gmail.com>
 <4e0551e18a28ff602fae6e419dc746145e5962d3.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <4e0551e18a28ff602fae6e419dc746145e5962d3.camel@suse.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
Cc: "zdenek.kabelac@gmail.com" <zdenek.kabelac@gmail.com>,
 "linux-lvm@redhat.com" <linux-lvm@redhat.com>,
 Heming Zhao <heming.zhao@suse.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 17, 2022 at 01:41:17PM +0000, Martin Wilck wrote:
> I like the general idea of the udev watch. It is the magic that causes
> newly created partitions to magically appear in the system, which is
> very convenient for users and wouldn't work otherwise. I can see that
> it might be inappropriate for LVM PVs. We can discuss changing the
> rules such that the watch is disabled for LVM devices (both PV and LV).
> I don't claim to overlook all possible side effects, but it might be
> worth a try. It would mean that newly created LVs, LV size changes etc.
> would not be visible in the system immediately. I suppose you could
> work around that in the LVM tools by triggering change events after
> operations like lvcreate.

I think it's worth looking into at least.  udev causes most of our major
problems, and causes things to fall apart everywhere at scale.


> Note: We were observing that watch events were triggered every 30s, for
> every PV, simultaneously.

Can you see what parts of the VG metadata are changing each time?  If it's
just metadata related to pvmove progress, then things are probably working
as designed, and we'd just be looking for optimizations (perhaps by some
code changes, or by reducing copies of metadata as suggested by Zdenek.)

Dave
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

