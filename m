Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA2EEB64D9
	for <linux-lvm@archiver.kernel.org>; Mon, 10 Jul 2023 07:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688972759;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vI+NyKa2pHFtVgPr9hw6hdEsDAxCsKw/ggJrRNQnl/k=;
	b=LHLWJ2HyV6HFTsiyzR23/pXXaB1wr2isCRcX4ihfyf7hTTtktxQkHn+lMRDxrTmfwgy0Iu
	bDF1mfexzN8SyO4Sz0y8oADVUXAXCIGvSRC7zVvUAjt1/PH775PjeQTWFz0hzTlOekSHG0
	AmPpEG77fGxSdODRHVTylimV2AywTxY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-qEB9B3_2MMiTHauRJz-wNQ-1; Mon, 10 Jul 2023 03:05:55 -0400
X-MC-Unique: qEB9B3_2MMiTHauRJz-wNQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE57F8910F0;
	Mon, 10 Jul 2023 07:05:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 72B57492B01;
	Mon, 10 Jul 2023 07:05:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2EAF119465A8;
	Mon, 10 Jul 2023 07:05:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3CA671946586
 for <linux-lvm@listman.corp.redhat.com>; Mon, 10 Jul 2023 07:05:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 82059492B02; Mon, 10 Jul 2023 07:05:41 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A216492B01
 for <linux-lvm@redhat.com>; Mon, 10 Jul 2023 07:05:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5ECD71C47661
 for <linux-lvm@redhat.com>; Mon, 10 Jul 2023 07:05:41 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com
 [45.249.212.255]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-jLz7dORoMUS5CVNuBmbgdQ-1; Mon, 10 Jul 2023 03:05:38 -0400
X-MC-Unique: jLz7dORoMUS5CVNuBmbgdQ-1
Received: from dggpemm500014.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4QzvgJ0gNNz1FDmV
 for <linux-lvm@redhat.com>; Mon, 10 Jul 2023 14:46:52 +0800 (CST)
Received: from [10.174.178.78] (10.174.178.78) by
 dggpemm500014.china.huawei.com (7.185.36.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 10 Jul 2023 14:47:23 +0800
Message-ID: <23f736c2-a264-f366-e217-6cbec424f9ed@huawei.com>
Date: Mon, 10 Jul 2023 14:47:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
To: <linux-lvm@redhat.com>
From: "wangzhiqiang (Q)" <wangzhiqiang95@huawei.com>
X-Originating-IP: [10.174.178.78]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500014.china.huawei.com (7.185.36.153)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [linux-lvm] The logical volume cannot be activated
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
Cc: linfeilong@huawei.com, lixiaokeng@huawei.com, louhongxiang@huawei.com,
 wuguanghao3@huawei.com
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dear all

I have a environment that disk online after switch root, link in /dev/disk/by-id is not generated when 69-dm-lvm.rules is executed,
but i set link to filter in lvm.conf, so that pvscan failed to scan physical volumes and set environment variable LVM_VG_NAME_COMPLETE,
finally, the logical volume is not activated.

69-dm-lvm.rules
IMPORT{program}="(LVM_EXEC)/lvm pvscan --cache --listvg --checkcomplete --vgonline --autoactivation event --udevoutput --journal=output $env{DEVNAME}"
ENV{LVM_VG_NAME_COMPLETE}=="?*", RUN+="(SYSTEMDRUN) --no-block --property DefaultDependencies=no --unit lvm-activate-$env{LVM_VG_NAME_COMPLETE} (LVM_EXEC)/lvm vgchange -aay --autoactivation event $env{LVM_VG_NAME_COMPLETE}"

There are any ways to activate logical volume in this scenario?

Looking forward to your reply, Thanks!

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

