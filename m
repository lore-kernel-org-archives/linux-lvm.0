Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6C0C77B6F
	for <linux-lvm@archiver.kernel.org>; Tue, 11 Apr 2023 13:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681218928;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hRVS4P8A/ANGeik2wa7cu1yosm0OIe0eFjqtsHvPwlM=;
	b=JwIsty2FcWrnD4ZG77/cTYxokQ3u+qYBLn4PiOj4jw2HeGIjE7Tx7qHT+MG3ahfxdnCorL
	3MUmczzZUBiwOBxmf3HBNonmPuMaltCdSEn/+03wannjj/qL9/mnM06EAkbhPHxucyf65c
	IT0IvL793Sl+s/u68to5X32XQMXyZhs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-W3IFmr5ePyGJOttQyKHdbQ-1; Tue, 11 Apr 2023 09:15:24 -0400
X-MC-Unique: W3IFmr5ePyGJOttQyKHdbQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C6963C10230;
	Tue, 11 Apr 2023 13:15:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DECC440C83A9;
	Tue, 11 Apr 2023 13:15:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9EEAC19465BC;
	Tue, 11 Apr 2023 13:15:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CFDDF1946586
 for <linux-lvm@listman.corp.redhat.com>; Tue, 11 Apr 2023 13:15:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BB44A2166B32; Tue, 11 Apr 2023 13:15:16 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 825E22166B30;
 Tue, 11 Apr 2023 13:15:16 +0000 (UTC)
Date: Tue, 11 Apr 2023 08:15:16 -0500
From: David Teigland <teigland@redhat.com>
To: Arvid Picciani <aep@exys.org>
Message-ID: <20230411131516.GA27598@redhat.com>
References: <CACD9L=A9i6QFzXtnQh6e3=gD9u6cy3VJAtCEaf1WsoCU_eE3kQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACD9L=A9i6QFzXtnQh6e3=gD9u6cy3VJAtCEaf1WsoCU_eE3kQ@mail.gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [linux-lvm] is lvmraid 1 thinpool with integrity safe?
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
Cc: linux-lvm@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Apr 09, 2023 at 02:21:50PM +0200, Arvid Picciani wrote:
> Hi,
> 
> doing some performance tests i noticed that lvmraid + integrity + thinpool
> outperforms zfs z1 by 5x while offering the same features. (snapshots,
> integrity)
> 
> Is this somehow unsafe or how come it is so unpopular?
> 
> lvcreate --type raid1 --mirrors 1 --size '100M' loop --name loopmeta
> --raidintegritymode journal
> lvcreate --type raid1 --mirrors 1 --size '700M' loop --name loopdata
> --raidintegritymode journal

Hi, that command does not actually enable integrity.  You need to include
the option "--raidintegrity y".  (lvcreate should perhaps warn you about
setting raidintegritymode when you've not enabled integrity.)

> lvconvert --type thin-pool --poolmetadata loop/loopmeta loop/loop

We do not currently permit raid+integrity to be used for a thin pool.  It
should be enabled in a coming release.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

