Return-Path: <SRS0=CtEK=OZ=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332DAC433F5
	for <linux-lvm@archiver.kernel.org>; Tue,  5 Oct 2021 11:19:13 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C71D61409
	for <linux-lvm@archiver.kernel.org>; Tue,  5 Oct 2021 11:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C71D61409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-paeJQsbWPKqwqIY1usPqag-1; Tue, 05 Oct 2021 07:19:10 -0400
X-MC-Unique: paeJQsbWPKqwqIY1usPqag-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B1871006AA7;
	Tue,  5 Oct 2021 11:19:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 353485F4E8;
	Tue,  5 Oct 2021 11:19:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A5DCF4E58E;
	Tue,  5 Oct 2021 11:18:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 195BE9oe028417 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 5 Oct 2021 07:14:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 43108200B426; Tue,  5 Oct 2021 11:14:09 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CF70200D8E5
	for <linux-lvm@redhat.com>; Tue,  5 Oct 2021 11:14:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86C77100B8DC
	for <linux-lvm@redhat.com>; Tue,  5 Oct 2021 11:14:06 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
	[209.85.166.172]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-302-ToNNeyIiNF-k4ClgIPdiYg-1; Tue, 05 Oct 2021 07:14:04 -0400
X-MC-Unique: ToNNeyIiNF-k4ClgIPdiYg-1
Received: by mail-il1-f172.google.com with SMTP id y17so13152032ilb.9
	for <linux-lvm@redhat.com>; Tue, 05 Oct 2021 04:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=B4y6VSGE9ktF1QNS5aN3IKvxgRQtpV50XeoheTLVs5I=;
	b=tGWykPG8PjiC71xgiS+tW0VnzKvNw9uRwCsNpeVL3lUA/QBgGu7/KmlS2N51oQ+OZp
	Aw+Kcx+K3NTgRbyyAAlKCFveAdl1aXJui3r1cGMi8hPxpbRhoX0iXsidy2cN9V0QMgOB
	5aE0q9a0UE7EpmScVOFxjvRFKPxTDI+JfaWU0Cwm5qP9eggv2sPKFcEYeEs4qNZhJnTN
	bwD8EVTBnvFLQLCKvcAtIzoZLVFC3slCHJIpxz6KtkLQU0JlEDmWxqVT0x+KoZqxwAEW
	zHtflUhKoikKGV27Qzzrv9obutge/wt5pRCsOg3TBKVHNsrASwwasaochkrOX5I/BUhF
	PlLQ==
X-Gm-Message-State: AOAM531SVsT25zuQavVxVhxR26susgie5xJRBbkb4Po20qBnOgbS5IIT
	Sy6iZkauDRsquSnVfn2DRXGsaXEpX4oygZzyA6b6pklrEw4=
X-Google-Smtp-Source: ABdhPJzMxq+n5t0n2MKfLGsndO5ohxZ99iqYdMXjmnWLRGIr5Jxi7YqC4pUt0agMfLFVGNMpae63Umfv6zkq8oYQgVw=
X-Received: by 2002:a05:6e02:b4b:: with SMTP id
	f11mr2638296ilu.26.1633432443760; 
	Tue, 05 Oct 2021 04:14:03 -0700 (PDT)
MIME-Version: 1.0
From: Krzysztof Chojnowski <frirajder@gmail.com>
Date: Tue, 5 Oct 2021 13:13:52 +0200
Message-ID: <CAPWGHt2wXM84y9iv++P02HU=Q174m=iGP=MKkd7ei_kG=Y-24Q@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-lvm@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

