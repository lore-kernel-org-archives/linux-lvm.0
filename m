Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F74C76196
	for <linux-lvm@archiver.kernel.org>; Tue, 11 Apr 2023 09:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681205004;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RZURt33cId0q74f/h4b4lIrcQnqM8LioDoZ8HqdcwwU=;
	b=TXZkBYsGh8I3XOSQwa/E8UO7Dkk+WdYR+TlGvRHT3wVRKslv1Dv8cFCRKxR6wbs3diw2lE
	LJuoMih6Y93Z/r2vM7gz8X5wJjgy411AcUmsr1OOxjk0L07QnYpsygkzOc8ZSHEdEHmUeD
	n2R+cnEoM/UA7+kwtEVvvEn90KO4iDI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-W0QzyyhKPU2ejaH13q_kBw-1; Tue, 11 Apr 2023 05:23:23 -0400
X-MC-Unique: W0QzyyhKPU2ejaH13q_kBw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEC64811E7C;
	Tue, 11 Apr 2023 09:23:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9F89714171BF;
	Tue, 11 Apr 2023 09:23:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D53DC1946A48;
	Tue, 11 Apr 2023 09:23:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 26AB71946586
 for <linux-lvm@listman.corp.redhat.com>; Tue, 11 Apr 2023 09:23:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DDAE02166B31; Tue, 11 Apr 2023 09:23:13 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D630C2166B30
 for <linux-lvm@redhat.com>; Tue, 11 Apr 2023 09:23:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBF4088FC76
 for <linux-lvm@redhat.com>; Tue, 11 Apr 2023 09:23:13 +0000 (UTC)
Received: from plutone.assyoma.it (cloud.assyoma.it [212.237.56.195]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-614-kVahdgmwMbqItp1t9Sxkmw-1; Tue,
 11 Apr 2023 05:23:11 -0400
X-MC-Unique: kVahdgmwMbqItp1t9Sxkmw-1
Received: from webmail.assyoma.it (localhost [IPv6:::1])
 by plutone.assyoma.it (Postfix) with ESMTPA id 360EAE063142;
 Tue, 11 Apr 2023 11:15:33 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 11 Apr 2023 11:15:33 +0200
From: Gionatan Danti <g.danti@assyoma.it>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <CACD9L=A9i6QFzXtnQh6e3=gD9u6cy3VJAtCEaf1WsoCU_eE3kQ@mail.gmail.com>
References: <CACD9L=A9i6QFzXtnQh6e3=gD9u6cy3VJAtCEaf1WsoCU_eE3kQ@mail.gmail.com>
Message-ID: <03be4a57a1ef162918fc906c76682db5@assyoma.it>
X-Sender: g.danti@assyoma.it
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
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
Cc: Arvid Picciani <aep@exys.org>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: assyoma.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Il 2023-04-09 14:21 Arvid Picciani ha scritto:
> Hi,
> 
> doing some performance tests i noticed that lvmraid + integrity +
> thinpool outperforms zfs z1 by 5x while offering the same features.
> (snapshots, integrity)
> 
> Is this somehow unsafe or how come it is so unpopular?
> 
> lvcreate --type raid1 --mirrors 1 --size '100M' loop --name loopmeta
> --raidintegritymode journal
> lvcreate --type raid1 --mirrors 1 --size '700M' loop --name loopdata
> --raidintegritymode journal
> lvconvert --type thin-pool --poolmetadata loop/loopmeta loop/loop

I benchmarked this setup quite heavily some years ago (when RHEL 8 was 
shiny new), using integritysetup because lvm integration was not 
available.

Be aware that in journal mode all random writes are sequentially 
accumulated in the journal and are later destaged. If using HDDs this 
last part can block your array for extended time. For example, using 
fio, I noticed 50k random writes for 2s followed by 30s where random 
iops was 0 (zero). Bitmap mode (rather than journal) was better 
speed-wise, but be sure to understand the tradeoff.

Other notes regarding ZFS:
- ZRAID1 is the equivalent of RAID5 and has lower performance than 
mirrors;
- recordsize plays an important role, but can affect benchmark results 
in a non-intuitive manner;
- ZFS is heavily dependent on ARC - don't try to outsmart it with 
syntethical tests, rather benchmark it your real workload.

Regards.

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

