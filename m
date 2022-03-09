Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8A6C433EF
	for <linux-lvm@archiver.kernel.org>; Thu, 10 Mar 2022 07:46:06 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-cl7j_KZPNS2bTa1lb5KyAg-1; Thu, 10 Mar 2022 02:46:04 -0500
X-MC-Unique: cl7j_KZPNS2bTa1lb5KyAg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7286899EC1;
	Thu, 10 Mar 2022 07:46:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4904F141DED8;
	Thu, 10 Mar 2022 07:45:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 00B9D195357D;
	Thu, 10 Mar 2022 07:45:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7BD06194F4AE
 for <linux-lvm@listman.corp.redhat.com>; Wed,  9 Mar 2022 15:29:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 43415401E64; Wed,  9 Mar 2022 15:29:33 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F81D401E60
 for <linux-lvm@redhat.com>; Wed,  9 Mar 2022 15:29:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24002185A7A4
 for <linux-lvm@redhat.com>; Wed,  9 Mar 2022 15:29:33 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-kuOGZQSuMqu0hHzZ_WuvYw-1; Wed, 09 Mar 2022 10:29:30 -0500
X-MC-Unique: kuOGZQSuMqu0hHzZ_WuvYw-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CCE221F384;
 Wed,  9 Mar 2022 15:29:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8B2AD13D7A;
 Wed,  9 Mar 2022 15:29:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Y7oJINjHKGKcXgAAMHmgww
 (envelope-from <mwilck@suse.com>); Wed, 09 Mar 2022 15:29:28 +0000
Message-ID: <38c190ac39c244d9442670589b7bfeb4f800383e.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: David Teigland <teigland@redhat.com>, Peter Rajnoha <prajnoha@redhat.com>
Date: Wed, 09 Mar 2022 16:29:27 +0100
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
X-Mailman-Approved-At: Thu, 10 Mar 2022 07:45:56 +0000
Subject: [linux-lvm] LVM autoactivation and udev
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>,
 Heming Zhao <heming.zhao@suse.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David, hi Peter,

we have recently updated LVM2 on openSUSE Factory, and are using the
autoactivation feature now. We also use
'external_device_info_source="udev"' by default, because according to
our experience it is the only way to make LVM device detection work
reliably with multipath devices.

With these settings, we see lots of "Udev database has incomplete
information about device ..." messages:

> [   12.377563] apollon systemd-udevd[810]: sda5: Processing device (SEQNUM=2787, ACTION=add)
> [   12.412723] apollon systemd-udevd[810]: sda5: /usr/lib/udev/rules.d/69-dm-lvm.rules:82 Importing properties from results of '/usr/sbin/lvm pvscan --cache --listvg --checkcomplete --vgonline --autoactivation event --udevoutput --journal=output /dev/sda5'
> [   12.412767] apollon systemd-udevd[810]: sda5: Starting '/usr/sbin/lvm pvscan --cache --listvg --checkcomplete --vgonline --autoactivation event --udevoutput --journal=output /dev/sda5'
> [   12.413041] apollon systemd-udevd[810]: Successfully forked off '(spawn)' as PID 882.
> [   12.419458] apollon lvm[882]: Udev database has incomplete information about device /dev/sda5.

This is no surprise, because 69-dm-lvm.rules contains

IMPORT{program}="/usr/sbin/lvm pvscan --cache --listvg --checkcomplete --vgonline --autoactivation event --udevoutput --journal=output $env{DEVNAME}"
ENV{LVM_VG_NAME_COMPLETE}=="?*", RUN+="/usr/bin/systemd-run --no-block --property DefaultDependencies=no --unit lvm-activate-$env{LVM_VG_NAME_COMPLETE} (LVM_EXEC)/lvm vgchange -aay --autoactivation event $env{LVM_VG_NAME_COMPLETE}"

These rules are executed by udev while it is processing an "add" event
for a PV. At that time, the udev data base doesn't contain an entry for
this PV yet, because the entry is added only after the uevent is fully
processed.

Shouldn't "pvscan" be run in a RUN+= statement instead? Obviously if we
do this, the lvm-activate-$VG unit must be started in some other way
(e.g. by calling systemd-run directly from pvscan).

In the cases we have observed so far, the VGs were assembled correctly
despite these warnings. We aren't certain if this was by luck only. In
any case, the messages irritate users.

Or are we getting this completely wrong, and the new autoactivation
feature should not be used with external_device_info_source="udev" at
all? If that's the case, how is multipath component detection supposed
to work?

Regards,
Martin

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

