Return-Path: <SRS0=MvFQ=PW=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76209C433EF
	for <linux-lvm@archiver.kernel.org>; Wed,  3 Nov 2021 17:45:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0338760F58
	for <linux-lvm@archiver.kernel.org>; Wed,  3 Nov 2021 17:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0338760F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=colorremedies.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-DqJZT3K2M3-WUlnmDllSBw-1; Wed, 03 Nov 2021 13:45:34 -0400
X-MC-Unique: DqJZT3K2M3-WUlnmDllSBw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33472A0BCC;
	Wed,  3 Nov 2021 17:45:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACB511002391;
	Wed,  3 Nov 2021 17:45:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E37261800B9E;
	Wed,  3 Nov 2021 17:45:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A3Hiwq2024348 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 3 Nov 2021 13:44:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 514F651E5; Wed,  3 Nov 2021 17:44:58 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4ACC351E1
	for <linux-lvm@redhat.com>; Wed,  3 Nov 2021 17:44:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 961D8187506A
	for <linux-lvm@redhat.com>; Wed,  3 Nov 2021 17:44:52 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
	[209.85.219.181]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-586-xujEJEv3MQO1R5X-nh4aZw-1; Wed, 03 Nov 2021 13:44:50 -0400
X-MC-Unique: xujEJEv3MQO1R5X-nh4aZw-1
Received: by mail-yb1-f181.google.com with SMTP id s3so8222739ybs.9
	for <linux-lvm@redhat.com>; Wed, 03 Nov 2021 10:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=+qXNABB+MoyjLBcjEtEZ/VeYUOmtl3/F/dAjfYJVr7M=;
	b=oA0CsOT7L+BiL5e1514nRFcaqHB2CVBL8EiiFQr6EI+CPOulQhTbzy5XSUK5YiUyfJ
	HqJTAGL3ifRj7G/4GkbbZBLeYgcT1Cjz4h3FfNNsslj21VmbYVdhbFFOktq+xfVokjdU
	RuXOhuHu2spE57xQRIr/G01kASI0TlDYZc/5XVJYLqN3c3IUSrBT5TkfcBFB+Oc69EWd
	0Psjni0rfRIIfoiKFCsWIwFG7v9HUwf0hBtLQ7hL+UsSzvOvpxBx3y9AoIlOqqLcBfuC
	3BaHfU7xsarVvG+jUq9jAnVNiQkLxagstg3kOMQKdUHDneLZ3QC43z9HFGjv5ufZ6Zut
	imkg==
X-Gm-Message-State: AOAM532p17CSDbQsyBjvpWSHXYGlb1jx4Jm0uNA240bNJctZywu6hlo2
	ERyFBWp5BZAhV/76GrXddbEIiUlwdlEdNGa6vGpRN/MRaDtBkh4OkNM=
X-Google-Smtp-Source: ABdhPJwtsoV/SQbiMI+iq49wKVArgBHhm3YjrPjWXLhOA8MNsxR17r6yD0dNBrf9NuQRPscjFewM6FRbuG/5j7QX488=
X-Received: by 2002:a25:f620:: with SMTP id t32mr23669441ybd.437.1635961489838;
	Wed, 03 Nov 2021 10:44:49 -0700 (PDT)
MIME-Version: 1.0
From: Chris Murphy <lists@colorremedies.com>
Date: Wed, 3 Nov 2021 13:44:33 -0400
Message-ID: <CAJCQCtRCEtGmsVQt0ug4c6PxGXkwhHjtrppNPSxa0StYs08mQA@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-lvm@redhat.com
Subject: [linux-lvm] logical volume usage type code,
	equivalent to GPT partition type GUID
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I'm wondering to what degree the current LVM metadata format(s) can
support additional or even arbitrary metadata.

The UEFI spec defines the GPT, and GPT defines a "partition type GUID"
for each partition to define it's usage/purpose, in rather open ended
fashion. I'm wondering about an equivalent for this with LVM, whether
it's useful and how difficult it would be to implement. This is all
very hypothetical right now, so a high level discussion is preferred.

The starting point is the Discoverable Partitions Spec:
http://systemd.io/DISCOVERABLE_PARTITIONS/

Where GPT partition type codes are used to discover file systems, and
their intended use without having to explicitly place them into
/etc/fstab for startup time discovery and mounting. But LVM doesn't
have an equivalent for exposing such a capability, because it implies
many volumes within the larger pool and also the pool might comprise
many devices.

The same problem exists for Btrfs subvolumes, and ZFS datasets.

What might be possible and what is definitely not possible, is what
I'm interested in understanding for now.

Thanks,

-- 
Chris Murphy

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

