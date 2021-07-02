Return-Path: <SRS0=Fuv7=L2=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98524C07E95
	for <linux-lvm@archiver.kernel.org>; Fri,  2 Jul 2021 22:02:46 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AEF461405
	for <linux-lvm@archiver.kernel.org>; Fri,  2 Jul 2021 22:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AEF461405
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625263365;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=d5c3tVkUEKfQI1kmJhge6xLR1qPPi1TY4nMUi/8QoVo=;
	b=Ilapr8xcGL9dCzGrFxjaG3f1Amo8VAnqn0psmcvSnbmVtdysvm7PxEplIH4IUnbezZ4A5k
	k2Wni36ETPzI0S4j56IDqfQXRd8QFfTq4EM4dzpBe5LMK1Vn+9xc0TDaniTqBI+m/IXgVl
	X0V70fYA/EVNc8EXE2oe4Hg527uEQdE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-6Dx1KlQKMX2r9KyYGr4JoA-1; Fri, 02 Jul 2021 18:02:43 -0400
X-MC-Unique: 6Dx1KlQKMX2r9KyYGr4JoA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C34C362FB;
	Fri,  2 Jul 2021 22:02:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD0D92C957;
	Fri,  2 Jul 2021 22:02:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE9191809C9A;
	Fri,  2 Jul 2021 22:02:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 162M2P92008361 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 2 Jul 2021 18:02:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 76F5160862; Fri,  2 Jul 2021 22:02:25 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B7CE60853;
	Fri,  2 Jul 2021 22:02:21 +0000 (UTC)
Date: Fri, 2 Jul 2021 17:02:19 -0500
From: David Teigland <teigland@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20210702220219.GB15057@redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<20210702210903.GA15057@redhat.com>
	<831e213cc0c54476d053ab230df29a4cb386d784.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <831e213cc0c54476d053ab230df29a4cb386d784.camel@suse.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-lvm@redhat.com
Cc: "zkabelac@redhat.com" <zkabelac@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	Heming Zhao <heming.zhao@suse.com>
Subject: Re: [linux-lvm] Discussion: performance issue on event activation
	mode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 02, 2021 at 09:22:03PM +0000, Martin Wilck wrote:
> On Fr, 2021-07-02 at 16:09 -0500, David Teigland wrote:
> > On Sun, Jun 06, 2021 at 02:15:23PM +0800, heming.zhao@suse.com=A0wrote:
> > > dev_cache_scan //order: O(n^2)
> > > =A0+ _insert_dirs //O(n)
> > > =A0| if obtain_device_list_from_udev() true
> > > =A0|=A0=A0 _insert_udev_dir //O(n)
> > > =A0|
> > > =A0+ dev_cache_index_devs //O(n)
> >=20
> > I've been running some experiments and trying some patches to improve
> > this.=A0 By setting obtain_device_list_from_udev=3D0, and using the
> > attached
> > patch to disable dev_cache_index_devs, the pvscan is much better.
> >=20
> > systemctl status lvm2-pvscan appears to show that the pvscan command
> > itself runs for only 2-4 seconds, while the service as a whole takes
> > around 15 seconds.=A0 See the 16 sec gap below from the end of pvscan
> > to the systemd Started message.=A0 If that's accurate, the remaining
> > delay
> > would lie outside lvm.
> >=20
> > Jul 02 15:27:57 localhost.localdomain systemd[1]: Starting LVM event
> > activation on device 253:1710...
> > Jul 02 15:28:00 localhost.localdomain lvm[65620]:=A0=A0 pvscan[65620] P=
V
> > /dev/mapper/mpathalz online, VG 1ed02c7d-0019-43c4-91b5-f220f3521ba9
> > is complete.
> > Jul 02 15:28:00 localhost.localdomain lvm[65620]:=A0=A0 pvscan[65620] V=
G
> > 1ed02c7d-0019-43c4-91b5-f220f3521ba9 run autoactivation.
> > Jul 02 15:28:00 localhost.localdomain lvm[65620]:=A0=A0 1 logical
> > volume(s) in volume group "1ed02c7d-0019-43c4-91b5-f220f3521ba9" now
> > active
>=20
> Printing this message is really the last thing that pvscan does?

I've not seen anything measurable after that message.  However, digging
through the command init/exit paths I did find libudev setup/destroy calls
that can also be skipped when the command is not accessing libudev info.
A quick check seemed to show some further improvement from dropping those.
(That will be part of the larger patch isolating libudev usage.)

I'm still seeing significant delay between the apparent command exit and
the systemd "Started" message, but this will require a little more work to
prove.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

