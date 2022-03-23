Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652E8C43217
	for <linux-lvm@archiver.kernel.org>; Thu, 24 Mar 2022 15:35:16 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-WB_Qnu-TNwa7bE06aDDRBQ-1; Thu, 24 Mar 2022 11:35:13 -0400
X-MC-Unique: WB_Qnu-TNwa7bE06aDDRBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90AF8805F50;
	Thu, 24 Mar 2022 15:35:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7818C41136E5;
	Thu, 24 Mar 2022 15:35:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B84A01940366;
	Thu, 24 Mar 2022 15:35:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6601F1949762
 for <linux-lvm@listman.corp.redhat.com>; Wed, 23 Mar 2022 07:51:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 429F5401E77; Wed, 23 Mar 2022 07:51:21 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DFCE40146E
 for <linux-lvm@redhat.com>; Wed, 23 Mar 2022 07:51:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25DAE3822200
 for <linux-lvm@redhat.com>; Wed, 23 Mar 2022 07:51:21 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-WO1nPgH2MKi-3jYDnN483w-1; Wed, 23 Mar 2022 03:51:19 -0400
X-MC-Unique: WO1nPgH2MKi-3jYDnN483w-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5EDD8210E9;
 Wed, 23 Mar 2022 07:51:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 23C9E13A85;
 Wed, 23 Mar 2022 07:51:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0w8QBnXROmKaDgAAMHmgww
 (envelope-from <mwilck@suse.com>); Wed, 23 Mar 2022 07:51:17 +0000
Message-ID: <89c9ea9d0a5e04071b5bfc00994332d6f9068438.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: "heming.zhao@suse.com" <heming.zhao@suse.com>, David Teigland
 <teigland@redhat.com>
Date: Wed, 23 Mar 2022 08:51:16 +0100
In-Reply-To: <a4df63ee-1381-de03-7490-bb1d51fa1e0e@suse.com>
References: <38c190ac39c244d9442670589b7bfeb4f800383e.camel@suse.com>
 <97c2e9f9-0959-c5ed-230a-9d4089577410@suse.com>
 <20220321164431.GA23151@redhat.com>
 <a4df63ee-1381-de03-7490-bb1d51fa1e0e@suse.com>
User-Agent: Evolution 3.42.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mailman-Approved-At: Thu, 24 Mar 2022 15:34:56 +0000
Subject: Re: [linux-lvm] LVM autoactivation and udev
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
Cc: Peter Rajnoha <prajnoha@redhat.com>,
 LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2022-03-23 at 15:33 +0800, heming.zhao@suse.com wrote:
> 
> I inclined to use the "--config" option to avoid booting warning.
> (or write additional codes for vgchange "monitor_ARG")
> 
> I have two reasons:
> 
> 1>
> Martin & I also found it is a difficult to find the best time to
> start lvm2-monitor.service
> So modification "After=" dependency will still failed with some
> cases.

Yes. The reason is that even after "sysinit.target" is reached, "udev
settle" for coldplug hasn't necessarily finished these days (as
systemd-udev-settle.service is deprecated, and often not activated any
more). Thus even if started after sysinit.target, lvm2-monitor.service
may encounter devices that haven't been fully processed by udev yet.

> 2>
> the lvm2-monitor.service helps to finish monitoring job for lvm_scan.
> So it's not necessary
> to ask this service to handle the VG/LV which starting after switch
> rootfs. (These VG/LV
> should be monitored by "pvscan --cache".)
> 
> So starting lvm2-monitor.service as early as possible is accepted.

Please forgive me if I am (out of ignorance about dmeventd) totally on
the wrong track here, but:

I still have my doubts. I can see that the warnings about missing udev
information have gone if we use  --config 'devices {
external_device_info_source="none" }'. But that doesn't mean much by
itself. vgchange will instead rely on native device detection, which,
as we know very well, will lead to wrong results more often than not,
in particular if multipath devices are present. IOW, it will probably
ask dmeventd to monitor SCSI devices that are path of multipath maps,
rather than the map devices themselves. I don't know dmeventd well
enough to judge whether that would be fatal, but past experience makes
me wary about it.

I suppose to test that we'd need to setup systems with root FS on
"monitored" LVM volumes (e.g. thin or mirror) on multipath (with recent
multipath releases, 0.8.8 or newer). I for one haven't tested this so
far.

What I would love to see wrt lvm2 monitoring is true event-based
activation - i.e. activate monitoring of devices one by one as they
actually appear in the system, in a manner that's consistent with udev.
Thus something similar to David's late approach with the "devices file"
for PV detection. That would avoid both the need to pass config options
and the need to figure out when to safely start the monitoring.

Regards,
Martin

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

