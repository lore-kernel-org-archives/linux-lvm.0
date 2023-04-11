Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D90C76196
	for <linux-lvm@archiver.kernel.org>; Tue, 11 Apr 2023 06:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681195479;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OBmekEj7BcBvOgQSbHVIhCOvV2kAHujHRcTg8WSaGWs=;
	b=foQuLiUTnYtRsuT9+6WnWTtvtASROh+3DOQZwrFETUa0wr88X4SDC0Dp5wZ44G26saNCwW
	8r6SipLqc3qd20qfO4jRVdoXaeMp64PL5O2iA/RhKgExBPzoc+qIFIMAS4T8qDwmEr84U0
	aErIU3yzQT0ru6u3595jpRCCtVEO4ok=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-Puqcq9zpNFOPg173rlAokQ-1; Tue, 11 Apr 2023 02:44:35 -0400
X-MC-Unique: Puqcq9zpNFOPg173rlAokQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09449100B376;
	Tue, 11 Apr 2023 06:44:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5BCF5C15BBA;
	Tue, 11 Apr 2023 06:44:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F2A7E1946A52;
	Tue, 11 Apr 2023 06:44:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 163391946586
 for <linux-lvm@listman.corp.redhat.com>; Tue, 11 Apr 2023 05:29:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E3CE5202701F; Tue, 11 Apr 2023 05:29:48 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBE7F202701E
 for <linux-lvm@redhat.com>; Tue, 11 Apr 2023 05:29:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDEAA8996E4
 for <linux-lvm@redhat.com>; Tue, 11 Apr 2023 05:29:48 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-Q3P9Mtk-NCm-4b2bVpfyTg-1; Tue, 11 Apr 2023 01:29:47 -0400
X-MC-Unique: Q3P9Mtk-NCm-4b2bVpfyTg-1
Received: by mail-pl1-f180.google.com with SMTP id 20so8604719plk.10
 for <linux-lvm@redhat.com>; Mon, 10 Apr 2023 22:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681190986; x=1683782986;
 h=content-transfer-encoding:subject:from:to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RxgHuiSSqpV7gdH7l7KNClUsWmmj0zDHre84ZjSk3c8=;
 b=wHXGBGEHdny6eq4Uo/GrNVNtqg9JhN/OArIxZfNJG3eihChb/gkcmY6GgOj+Maezzy
 MBdV95SuvGCQ3ek/vIJhaH/GIVPLD/NDkrM2k3SOmd595uBwI0eSg+hiYbdPoVSkPLwK
 s6HPK2Jf5/feB2MQyEo4HiwCEc45V/BGfE5Etkgdy2v5iVdC8picfcEnL8ydoVjoNNQZ
 dyj1LUO+oHcGFtwjQbGiuvTK3yqqtsAFwSbmjvYJecBFaTzujXp92O7rOL8jM+1DoHPa
 F4SjpXX9A78QKpq5SDtiE4dBpgVvlkdVKH6eZ2fgcWaDJM22aiuitcdSnA5LMYQKAN6I
 WSbQ==
X-Gm-Message-State: AAQBX9eu2iQu8KhcAABfeZQ19FtvaKTMerq+1m3EFH+i98DqwiHCaUGw
 Z0RXmnXHrNkkpmDvdwcj7ogaqcEO1O5R4VJ0uBM=
X-Google-Smtp-Source: AKy350Zv90S7u2wxRw7fHyUzc/f4jAe/BVIAoLooCdYN7Dr5wm6Id7ct7XPmGW0X9UihwTF3wQhZMw==
X-Received: by 2002:a17:903:2285:b0:1a5:2db2:2bb with SMTP id
 b5-20020a170903228500b001a52db202bbmr1801370plh.15.1681190985792; 
 Mon, 10 Apr 2023 22:29:45 -0700 (PDT)
Received: from [10.87.56.20] ([139.177.225.237])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170902e9cd00b001a04027e0e0sm3660371plk.258.2023.04.10.22.29.44
 for <linux-lvm@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 22:29:45 -0700 (PDT)
Message-ID: <ac0f39c8-932d-293a-b7aa-568532bda22a@bytedance.com>
Date: Tue, 11 Apr 2023 13:29:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
To: LVM general discussion and development <linux-lvm@redhat.com>
From: Zhiyong Ye <yezhiyong@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Tue, 11 Apr 2023 06:44:28 +0000
Subject: [linux-lvm] How to convert a single path to a multipath after using
 dm-multipath
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
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dear all,

Dm-multipath (multipath-tools in the user-space) provides powerful 
multipathing capabilities to aggregate multiple paths from the same 
storage backend into a single disk device. However, it is difficult to 
extend single paths into multipaths when LVM is already in use.

I used two physical machines to set up the POC environment for testing, 
with one physical machine acting as the storage iscsi multipath server, 
setting up the same LUN to have two paths to access. Another physical 
machine acts as the iscsi client, first using a single path (/dev/sda) 
and creating vg and lv on it. I then turn on the multipath function and 
merge the two paths into a new device (/dev/mapper/matha), and I get the 
following error when I execute the lvm command.

# pvs
WARNING: Not using device /dev/mapper/matha for PV 
HgL3xR-qTio-m75Q-nGAO-Un0U-8uHk-wHbH25.
WARNING: PV HgL3xR-qTio-m75Q-nGAO-Un0U-8uHk-wHbH25 prefers device 
/dev/sda because device is used by LV.
PV           VG                      Fmt  Attr PSize  PFree
/dev/sda     is-he57e6mr4wemb19kgf8i lvm2 a--  10.00t 9.98t


To be able to use the multipathing capability, I tried to convert the 
device from pv to matha using vgimportclone, but it failed since both 
sda and matha were pointing to the same iscsi storage backend.

May you please advise how one can convert the pv used by vg from sda to 
matha without affecting the current lv usage.

Regards

Zhiyong

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

