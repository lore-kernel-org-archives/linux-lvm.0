Return-Path: <SRS0=nNlY=FE=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89FAC64E7B
	for <linux-lvm@archiver.kernel.org>; Mon, 30 Nov 2020 22:25:08 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D22132073C
	for <linux-lvm@archiver.kernel.org>; Mon, 30 Nov 2020 22:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D22132073C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=stoffel.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-vXoP_3YRPxCKXAVy5iS74g-1; Mon, 30 Nov 2020 17:25:04 -0500
X-MC-Unique: vXoP_3YRPxCKXAVy5iS74g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC66894F0B;
	Mon, 30 Nov 2020 22:24:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 823685D6A8;
	Mon, 30 Nov 2020 22:24:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F9354A7C6;
	Mon, 30 Nov 2020 22:24:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AUMOerQ005650 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 30 Nov 2020 17:24:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BC8042166B2D; Mon, 30 Nov 2020 22:24:40 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B782D2166B2C
	for <linux-lvm@redhat.com>; Mon, 30 Nov 2020 22:24:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55E9D10580C2
	for <linux-lvm@redhat.com>; Mon, 30 Nov 2020 22:24:38 +0000 (UTC)
Received: from mail.stoffel.org (li1843-175.members.linode.com
	[172.104.24.175]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-67-cjz_SyNEMHq1lvgbIwYAug-1; Mon, 30 Nov 2020 17:24:34 -0500
X-MC-Unique: cjz_SyNEMHq1lvgbIwYAug-1
Received: from quad.stoffel.org (066-189-075-104.res.spectrum.com
	[66.189.75.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id 9571523B6B
	for <linux-lvm@redhat.com>; Mon, 30 Nov 2020 17:24:33 -0500 (EST)
Received: by quad.stoffel.org (Postfix, from userid 1000)
	id 2F704A69AC; Mon, 30 Nov 2020 17:24:33 -0500 (EST)
MIME-Version: 1.0
Message-ID: <24517.28961.127885.638522@quad.stoffel.home>
Date: Mon, 30 Nov 2020 17:24:33 -0500
From: "John Stoffel" <john@stoffel.org>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <CAMaziXtCk662ZfaG-crzrrKpi_efQqqOLbVCnSvLDsCOpLS0zw@mail.gmail.com>
References: <CAMaziXtCk662ZfaG-crzrrKpi_efQqqOLbVCnSvLDsCOpLS0zw@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AUMOerQ005650
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] System completely unstable after migrating to thin
	pools
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Sreyan> I have migrated to thin pools using partclone.

I suspect you're toast.  What are you trying to accomplish here
though?  Trying to stuff 10 pounds of data into a 5 pound bag?  *grin*

Or are you trying to have the ability to take snapshots of your system
to make rollbacks easier? =20

Sreyan> But now that I am using thin pools my system is completely unstable=
.

You need to post the output of your configuration in more detail, with
dmesg output, logs, lvs, pvs, vgs output, etc.=20

But really, you do have backups?

Sreyan> My swap is not activated :

Sreyan> swapon[1004]: swapon: /fedora.swap: read swap header failed
Sreyan> systemd[1]: fedora.swap.swap: Swap process exited, code=3Dexited, s=
tatus=3D255/EXCEPTION

Sreyan> systemd[1]: fedora.swap.swap: Failed with result 'exit-code'.
Sreyan> =A0Failed to activate swap /fedora.swap.
Sreyan> =A0Dependency failed for Swap.
Sreyan> =A0swap.target: Job swap.target/start failed with result 'dependenc=
y'.

Sreyan> My System logging service is not started:

Sreyan> rsyslog.service: Failed with result 'core-dump'.
Sreyan> =A0Failed to start System Logging Service.
Sreyan> =A0SERVICE_START pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295=
 subj=3Dsystem_u:system_r:init_t:s0 msg=3D
Sreyan> 'unit=3Drsyslog comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" h=
ostname=3D? addr=3D? terminal=3D? res=3D
Sreyan> failed'
Sreyan> =A0rsyslog.service: Scheduled restart job, restart counter is at 1.

Sreyan> And device mapper gives me weird messages during startup like:

Sreyan> =A0kernel: device-mapper: btree spine: node_check failed: csum 3318=
704195 !=3D wanted 3318554075
Sreyan> =A0kernel: device-mapper: block manager: btree_node validator check=
 failed for block 220
Sreyan> =A0kernel: device-mapper: btree spine: node_check failed: csum 3318=
704195 !=3D wanted 3318554075
Sreyan> =A0kernel: device-mapper: block manager: btree_node validator check=
 failed for block 220
Sreyan> =A0kernel: device-mapper: btree spine: node_check failed: csum 3318=
704195 !=3D wanted 3318554075
Sreyan> =A0kernel: device-mapper: block manager: btree_node validator check=
 failed for block 220
Sreyan> =A0kernel: device-mapper: btree spine: node_check failed: csum 3318=
704195 !=3D wanted 3318554075
Sreyan> =A0kernel: device-mapper: block manager: btree_node validator check=
 failed for block 220

Sreyan> Also some dracut module is missing:

Sreyan> dracut-initqueue[867]: /usr/sbin/thin_check: execvp failed: No such=
 file or directory
Sreyan> =A0dracut-initqueue[867]: WARNING: Check is skipped, please install=
 recommended missing binary /usr/
Sreyan> sbin/thin_check!

Sreyan> In short my system has gone to hell.

Sreyan> This all started when I did a fstrim like this:

Sreyan> sudo fstrim -v /

Sreyan> And it returned an input/output error.

Sreyan> My logical volumes were marked with two 'XX', I don't know what tha=
t means. After that I
Sreyan> restarted.

Sreyan> What can I do to get my system back to normal ?

Sreyan> Please help.

Sreyan> --
Sreyan> Regards,
Sreyan> Sreyan Chakravarty

Sreyan> _______________________________________________
Sreyan> linux-lvm mailing list
Sreyan> linux-lvm@redhat.com
Sreyan> https://www.redhat.com/mailman/listinfo/linux-lvm
Sreyan> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

