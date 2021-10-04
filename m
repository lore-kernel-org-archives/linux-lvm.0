Return-Path: <SRS0=CtEK=OZ=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1819FC433EF
	for <linux-lvm@archiver.kernel.org>; Tue,  5 Oct 2021 05:26:40 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87D6B61373
	for <linux-lvm@archiver.kernel.org>; Tue,  5 Oct 2021 05:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87D6B61373
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-QJCmEUs4MdWhz3bqPl8LkQ-1; Tue, 05 Oct 2021 01:26:36 -0400
X-MC-Unique: QJCmEUs4MdWhz3bqPl8LkQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF5701080865;
	Tue,  5 Oct 2021 05:26:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB9CE19711;
	Tue,  5 Oct 2021 05:26:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 91C4E1800B9C;
	Tue,  5 Oct 2021 05:26:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 194DUuMX009862 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 4 Oct 2021 09:30:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AA53E111CA11; Mon,  4 Oct 2021 13:30:56 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A61D9111CA0F
	for <linux-lvm@redhat.com>; Mon,  4 Oct 2021 13:30:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D3B710AF960
	for <linux-lvm@redhat.com>; Mon,  4 Oct 2021 13:30:56 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
	[209.85.166.172]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-426-09IYKbRvPVWkg8YN9XL8jg-1; Mon, 04 Oct 2021 09:30:54 -0400
X-MC-Unique: 09IYKbRvPVWkg8YN9XL8jg-1
Received: by mail-il1-f172.google.com with SMTP id t15so15777832ilj.1
	for <linux-lvm@redhat.com>; Mon, 04 Oct 2021 06:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=B4y6VSGE9ktF1QNS5aN3IKvxgRQtpV50XeoheTLVs5I=;
	b=oZHiZeEnPi/IaSHOvC6uYj8Z9OPh/ApN732lK4IZLYK/InpTAqfZxMqSw+faxqD9Lz
	kV4wKV/MxXO4H0kWWGRtzueN+m5qVUiBUSDHZCz2xl6gRjlhxrsuF13ov88ZxTvxV6a2
	9bV0kAgHUyz3jBjhUWK+NCTMzzW6FtMX0C5KNXOt/BvGKiL4en/WOKQEctJhzpKq/MQU
	eFE27B8Xa0xlTxue9rKaEE2jP1q343Qxr5wW3xaGswNj/I/bWJjoTfJHHlQckL8YvLYm
	NtxPmAGgzMg0pyZtzlcaeEpv8FzCQPy6I9QXZwrheAxYSHW4OtXl0x+BOAtc1ZJPQsZJ
	4hpw==
X-Gm-Message-State: AOAM5310SrxR4IYUvgJQIfYzzAc9K2f5Fyh+4EpZruBVDLQcFLoj8RIg
	60HnB0RUchpxgMsu+W1ByKSC1otwvw5rRnSg4Zcs3Weqr/o=
X-Google-Smtp-Source: ABdhPJykfsMXxEQePM2RwP4R1bDAp/dJhM7ppSzkLf8G9EVjoXY9rJbhYWEgfoN68fRUjEMiy/j3xvv1jsfiCbPyzTg=
X-Received: by 2002:a05:6e02:144f:: with SMTP id
	p15mr9460373ilo.287.1633354254104; 
	Mon, 04 Oct 2021 06:30:54 -0700 (PDT)
MIME-Version: 1.0
From: Krzysztof Chojnowski <frirajder@gmail.com>
Date: Mon, 4 Oct 2021 15:30:43 +0200
Message-ID: <CAPWGHt1MCzPbEHrF-5SRDavHqOfhMSqhkfAUQDMYT=HJ7TRfuQ@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Tue, 05 Oct 2021 01:25:57 -0400
Subject: [linux-lvm] LVM cachepool inconsistency after power event
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello all,

I'm experimenting with lvmcache, trying to use NVMe disk to speed up
access to rotational disks. I was using the cachepool in a writeback
mode when a power failure occurred, this left the cache in a
inconsistent state. So far I managed to activate the underlying _corig
LV and copy the data from there, but I'm wondering if it's still
possible to repair such cache and if not how do I remove failed LVs to
reclaim the disk space.

This is the relevant portion of the lvs:
  tpg1-wdata                    vg0 Cwi---C--- 500,00g
[wdata_cachepool_cpool] [tpg1-wdata_corig]
  [tpg1-wdata_corig]            vg0 owi---C--- 500,00g
  [wdata_cachepool_cpool]       vg0 Cwi---C---  50,00g
  [wdata_cachepool_cpool_cdata] vg0 Cwi-------  50,00g
  [wdata_cachepool_cpool_cmeta] vg0 ewi-------  40,00m

Trying to activate the tpg1-wdata LV results in an error:
sudo lvchange -ay -v vg0/tpg1-wdata
  Activating logical volume vg0/tpg1-wdata.
  activation/volume_list configuration setting not defined: Checking
only host tags for vg0/tpg1-wdata.
  Creating vg0-wdata_cachepool_cpool_cdata
  Loading table for vg0-wdata_cachepool_cpool_cdata (253:17).
  Resuming vg0-wdata_cachepool_cpool_cdata (253:17).
  Creating vg0-wdata_cachepool_cpool_cmeta
  Loading table for vg0-wdata_cachepool_cpool_cmeta (253:18).
  Resuming vg0-wdata_cachepool_cpool_cmeta (253:18).
  Creating vg0-tpg1--wdata_corig
  Loading table for vg0-tpg1--wdata_corig (253:19).
  Resuming vg0-tpg1--wdata_corig (253:19).
  Executing: /usr/sbin/cache_check -q
/dev/mapper/vg0-wdata_cachepool_cpool_cmeta
  /usr/sbin/cache_check failed: 1
  Piping: /usr/sbin/cache_check -V
  Found version of /usr/sbin/cache_check 0.9.0 is better then requested 0.7.0.
  Check of pool vg0/wdata_cachepool_cpool failed (status:1). Manual
repair required!
  Removing vg0-tpg1--wdata_corig (253:19)
  Removing vg0-wdata_cachepool_cpool_cmeta (253:18)
  Removing vg0-wdata_cachepool_cpool_cdata (253:17)

I tried repairing the volume, but no change:
sudo lvconvert --repair -v vg0/tpg1-wdata
  activation/volume_list configuration setting not defined: Checking
only host tags for vg0/lvol6_pmspare.
  Creating vg0-lvol6_pmspare
  Loading table for vg0-lvol6_pmspare (253:17).
  Resuming vg0-lvol6_pmspare (253:17).
  activation/volume_list configuration setting not defined: Checking
only host tags for vg0/wdata_cachepool_cpool_cmeta.
  Creating vg0-wdata_cachepool_cpool_cmeta
  Loading table for vg0-wdata_cachepool_cpool_cmeta (253:18).
  Resuming vg0-wdata_cachepool_cpool_cmeta (253:18).
  Executing: /usr/sbin/cache_repair  -i
/dev/mapper/vg0-wdata_cachepool_cpool_cmeta -o
/dev/mapper/vg0-lvol6_pmspare
  Removing vg0-wdata_cachepool_cpool_cmeta (253:18)
  Removing vg0-lvol6_pmspare (253:17)
  Preparing pool metadata spare volume for Volume group vg0.
  Archiving volume group "vg0" metadata (seqno 51).
  Creating logical volume lvol7
  Creating volume group backup "/etc/lvm/backup/vg0" (seqno 52).
  Activating logical volume vg0/lvol7.
  activation/volume_list configuration setting not defined: Checking
only host tags for vg0/lvol7.
  Creating vg0-lvol7
  Loading table for vg0-lvol7 (253:17).
  Resuming vg0-lvol7 (253:17).
  Initializing 40,00 MiB of logical volume vg0/lvol7 with value 0.
  Temporary logical volume "lvol7" created.
  Removing vg0-lvol7 (253:17)
  Renaming lvol7 as pool metadata spare volume lvol7_pmspare.
  WARNING: If everything works, remove vg0/tpg1-wdata_meta1 volume.
  WARNING: Use pvmove command to move vg0/wdata_cachepool_cpool_cmeta
on the best fitting PV.

Trying to remove the cache volume also fails:
sudo lvremove -ff vg0/tpg1-wdata
  Check of pool vg0/wdata_cachepool_cpool failed (status:1). Manual
repair required!
  Failed to activate vg0/tpg1-wdata to flush cache.

Any help in resolving this is appreciated!
Thanks,

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

