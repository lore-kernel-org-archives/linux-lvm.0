Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28B0C433F5
	for <linux-lvm@archiver.kernel.org>; Thu,  6 Jan 2022 19:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641497023;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yJ7Ywpj6RcYNLWR0IGXm12/cFhh+smNjjEk2ULXs/pw=;
	b=VzLt4rOzlGyMc6jCyUoXP9XKFm3knLfglmv0nzoM6bQD9jLjfRqtGMZd5b51hc88lKpuM3
	IMBsS0b1bs2AMlw8zH6/ByqnHNa6C7v54cABg2PxAi+WJ8h04itRIqyht29S6ZgJ/9BsUK
	TW6HJF3O+BrYz51+wznBlAMiBKXM6Mg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-TAj62FPjOk-rwr8LwLRhqA-1; Thu, 06 Jan 2022 14:23:42 -0500
X-MC-Unique: TAj62FPjOk-rwr8LwLRhqA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE64580BCA8;
	Thu,  6 Jan 2022 19:23:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA7A25BE04;
	Thu,  6 Jan 2022 19:23:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1580F4BB7C;
	Thu,  6 Jan 2022 19:23:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 206JNHTI018299 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 6 Jan 2022 14:23:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 91FAE5BE04; Thu,  6 Jan 2022 19:23:17 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21C495D6D7;
	Thu,  6 Jan 2022 19:23:03 +0000 (UTC)
Date: Thu, 6 Jan 2022 13:23:02 -0600
From: David Teigland <teigland@redhat.com>
To: linux-lvm@harrier.ch
Message-ID: <20220106192301.GA29444@redhat.com>
References: <71905.121122603225900568@us-mta-659.us.mimecast.lan>
MIME-Version: 1.0
In-Reply-To: <71905.121122603225900568@us-mta-659.us.mimecast.lan>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-lvm@redhat.com
Cc: linux-lvm@redhat.com
Subject: Re: [linux-lvm] LVM: Metadata on ... has wrong VG name
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Dec 26, 2021 at 03:23:02AM -0500, linux-lvm@harrier.ch wrote:
> > metadata is fine (please create a bz, or send the output of pvs -vvvvv so
> > we can fix it.)  
> 
> Enclosed below

Thanks, I've pushed this fix to improve the handling of duplicate VGIDs.
https://sourceware.org/git/?p=lvm2.git;a=commit;h=bd2baeaaa67da3885df9f06700565dc201c82861
Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

