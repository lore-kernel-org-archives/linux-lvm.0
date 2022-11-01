Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FBFC433FE
	for <linux-lvm@archiver.kernel.org>; Tue,  1 Nov 2022 14:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667313765;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AVO1uwKQRy5iaO3/H3i1gWufBdbpwUx6xAEh5hzIxR4=;
	b=b7PyaB5B1j3e3VTCezSm7ZPDo1ZE+xdck64XmpFjhQh1rNk3+cJ5NfMwNm+S/v2Bru82ML
	L3hUkXvurgoebUNOvAfQXtbCIgrqjMcovrNmSgHeCetYA6Gm4vAZPVNZaD/87MlSdFWPSP
	p76TjO5knmtV61J8jt26F5iLKhQy8RU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-sYsam7dGOpayUl5ZFOW3NA-1; Tue, 01 Nov 2022 10:42:42 -0400
X-MC-Unique: sYsam7dGOpayUl5ZFOW3NA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F02629ABA13;
	Tue,  1 Nov 2022 14:42:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 134CA4B3FC6;
	Tue,  1 Nov 2022 14:42:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B37E01946A42;
	Tue,  1 Nov 2022 14:42:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 14D081946594
 for <linux-lvm@listman.corp.redhat.com>; Tue,  1 Nov 2022 14:42:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B9643492B33; Tue,  1 Nov 2022 14:42:31 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E052492B18;
 Tue,  1 Nov 2022 14:42:31 +0000 (UTC)
Date: Tue, 1 Nov 2022 09:42:30 -0500
From: David Teigland <teigland@redhat.com>
To: Zhiyong Ye <yezhiyong@bytedance.com>
Message-ID: <20221101144230.GA11193@redhat.com>
References: <4b031c4d-b83a-cc92-fabf-cc9cefb4e491@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <4b031c4d-b83a-cc92-fabf-cc9cefb4e491@bytedance.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [linux-lvm] How to implement live migration of VMs in thinlv
 after using lvmlockd
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
Cc: damon.devops@gmail.com,
 LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 01, 2022 at 01:36:17PM +0800, Zhiyong Ye wrote:
> Hi all,
> 
> I want to implement live migration of VMs in the lvm + lvmlockd + sanlock
> environment. There are multiple hosts in the cluster using the same iscsi
> connection, and the VMs are running on this environment using thinlv
> volumes. But if want to live migrate the vm, it will be difficult since
> thinlv which from the same thin pool can only be exclusive active on one
> host.
> 
> I found a previous subject that discussed this issue:
> 
> https://lore.kernel.org/all/20180305165926.GA20527@redhat.com/

Hi, in that email I tried to point out that the real problem is not the
locking, but rather the inability of dm-thin to share a thin pool among
multiple hosts.  The locking restrictions just reflect that technical
limitation.

Dave
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

