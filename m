Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74344C433EF
	for <linux-lvm@archiver.kernel.org>; Mon,  7 Mar 2022 14:44:42 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-N8UNhr4yOQSFZYL_IYJREw-1; Mon, 07 Mar 2022 09:44:38 -0500
X-MC-Unique: N8UNhr4yOQSFZYL_IYJREw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF141833959;
	Mon,  7 Mar 2022 14:44:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7EEC81410F3B;
	Mon,  7 Mar 2022 14:44:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2A3BC19305A0;
	Mon,  7 Mar 2022 14:44:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3C9851931BE9
 for <linux-lvm@listman.corp.redhat.com>; Mon,  7 Mar 2022 14:44:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 90323401472; Mon,  7 Mar 2022 14:44:32 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78589492C14
 for <linux-lvm@redhat.com>; Mon,  7 Mar 2022 14:44:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62B9A801E95
 for <linux-lvm@redhat.com>; Mon,  7 Mar 2022 14:44:32 +0000 (UTC)
Received: from plutone.assyoma.it
 (host195-56-237-212.serverdedicati.aruba.it [212.237.56.195]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-Kyor3yV4O9m9Sx2wmjQrSA-1; Mon, 07 Mar 2022 09:44:30 -0500
X-MC-Unique: Kyor3yV4O9m9Sx2wmjQrSA-1
Received: from webmail.assyoma.it (localhost [IPv6:::1])
 by plutone.assyoma.it (Postfix) with ESMTPA id BB656DCEF8EF;
 Mon,  7 Mar 2022 15:44:27 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 07 Mar 2022 15:44:27 +0100
From: Gionatan Danti <g.danti@assyoma.it>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <DM6PR19MB2490CE0E86DFA205D3DE99ABF5089@DM6PR19MB2490.namprd19.prod.outlook.com>
References: <DM6PR19MB2490CE0E86DFA205D3DE99ABF5089@DM6PR19MB2490.namprd19.prod.outlook.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <c022824d9de289ac813ac8d3dfa2b85c@assyoma.it>
X-Sender: g.danti@assyoma.it
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
Cc: "Gaikwad, Hemant" <H.Gaikwad@dell.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Il 2022-03-07 12:09 Gaikwad, Hemant ha scritto:
> Hi,
> 
> We have been looking at LVM as an option for long term backup using
> the LVM snapshots. After looking at the various forums and also
> looking at a few LVM defects, realized that LVM could be a very good
> option for short term backup, but might result in performance issues
> if the snapshots are retained for a long time. Also read we should
> restrict the number of snapshots. We are thinking of keeping it to 3,
> but do you think that could also be a performance bottleneck. A few
> forum posts also suggest memory issues with using LVM snapshots. Can
> you please help with some data on that too. Thanks in advance for
> making our decision easier. Thanks
> 
> Regards,

Classical, non-thin LVM snapshots are only meant to be short-lived (just 
enough to take a backup), and the performance penalty you talk about 
does apply.
Thin LVM snapshots, on the other side, command a much lower performance 
penalty and can be long-lived (ie: think about a rolling snapshot 
system).
So if you need multiple, long-lived snapshots, I strongly suggest you to 
check lvmthin.
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

