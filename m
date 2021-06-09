Return-Path: <SRS0=616c=LD=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C84BEC48BCD
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Jun 2021 19:00:14 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B7DF61364
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Jun 2021 19:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B7DF61364
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623265213;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fRoP++MzHKKoGSCWFAbm+gkRNVULQFEuv7K2Mnqd8k8=;
	b=CyvY4YKb0JdMZjX8BykwNHWNZyT2Uzkj6IrVnvnXGYHLBkxtGP0m4OzAiGzcNTaCKmMyk6
	oQWwCF16lczTp/i6D+9S7yaAOahxxX3R3QvweTFkDZb0sMmK8REzga1Ucavc18rWYVtvql
	DjxII4RL6uumHEu5Ko7qBWG9JSEfCek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-XOubhnhLN3qBEtk2U--Pzg-1; Wed, 09 Jun 2021 15:00:08 -0400
X-MC-Unique: XOubhnhLN3qBEtk2U--Pzg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D9FF5077D;
	Wed,  9 Jun 2021 19:00:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10FF7629C0;
	Wed,  9 Jun 2021 18:59:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0BAE11809C80;
	Wed,  9 Jun 2021 18:59:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 159IxZtV004562 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 9 Jun 2021 14:59:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2488D5D735; Wed,  9 Jun 2021 18:59:35 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A1A65D6AD;
	Wed,  9 Jun 2021 18:59:31 +0000 (UTC)
Date: Wed, 9 Jun 2021 13:59:30 -0500
From: David Teigland <teigland@redhat.com>
To: Heming Zhao <heming.zhao@suse.com>
Message-ID: <20210609185929.GB8576@redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
	<dd395e820a4cf9b5e807e8de1e456786eebd2044.camel@suse.com>
	<20210607213003.GA8181@redhat.com>
	<0b83d419-8569-2ba0-5f5b-2c3df4e2eb21@suse.com>
	<d349b4b1-194a-7ed5-d5e3-d06785b3664c@suse.com>
	<DB7PR04MB466643E4216F9F89A2B2EF1F97369@DB7PR04MB4666.eurprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DB7PR04MB466643E4216F9F89A2B2EF1F97369@DB7PR04MB4666.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-lvm@redhat.com
Cc: "zkabelac@redhat.com" <zkabelac@redhat.com>,
	"rogerheflin@gmail.com" <rogerheflin@gmail.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	Martin Wilck <martin.wilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 09, 2021 at 05:37:47AM +0000, Heming Zhao wrote:
> This mail I will mention another issue about lvm2-pvscan@.service.
> both event activation and direct activation have same issue:
> the shutdown take much time.
>=20
> the code logic in=A0pvscan_cache_cmd() only takes effect on activation jo=
b:
> ```
> =A0 =A0 if (do_activate &&
> =A0 =A0 =A0 =A0 !find_config_tree_bool(cmd, global_event_activation_CFG, =
NULL)) {
> =A0 =A0 =A0 =A0 log_verbose("Ignoring pvscan --cache -aay because event_a=
ctivation is disabled.");
> =A0 =A0 =A0 =A0 return ECMD_PROCESSED;
> =A0 =A0 }
> ```

Good point, event_activation=3D0 should also apply to pvscan on device
removal.

> and I have a question about the script  lvm2-pvscan@.service:
> why there also does a scan job when stopping? could we remove/modify this=
 line?
>   ```
>   ExecStop=3D@SBINDIR@/lvm pvscan --cache %i
>   ```

This removes the /run/lvm/pvs_online/ file for the device.  If the PVs for
the VG are all removed, and then they are all reattached, pvscan will
autoactivate the VG again.  This reactivation isn't a core capability, or
one that we've explicitly mentioned or supported, but it's there.  I can
imagine that reactivation may be undesirable in many cases, and it's
certainly reasonable to remove the ExecStop as needed.  Some time ago I
suggested that we stop doing repeated autoactivation entirely, which would
let us remove the ExecStop.  But we don't know the extent to which users
depend on this behavior, so we haven't considered it further.  Perhaps
pvscan could detect system shutdown and exit directly without doing
anything?

For the future, the new udev rule I mentioned in an earlier message no
longer does this and removes the lvm2-pvscan service.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

