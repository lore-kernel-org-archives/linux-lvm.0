Return-Path: <SRS0=98TD=LJ=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A61C48BE5
	for <linux-lvm@archiver.kernel.org>; Tue, 15 Jun 2021 17:04:28 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1BCD61879
	for <linux-lvm@archiver.kernel.org>; Tue, 15 Jun 2021 17:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1BCD61879
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623776666;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=i6aBv5tJj8Rcwr9UZZRx3qebYMsxACVWeOidZz0ONIY=;
	b=cJ1Ny30iaL2hcqDhUa0v5Ik7v2UwAhzLO5D2+nTJXbmhDPQM02/ZiSTBo/k1UG1/DruNgU
	V+C4A8BRJfk5cACnkrtthIFm4aazMnCgnmcOtngN3IizX5wRy1+SGBlbl7yw+Y55f7C2hT
	BK1VHmUSVDhtnu55UThOPciwZVO9bK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-JUCGXn-YPMCMKi5Eg66_YQ-1; Tue, 15 Jun 2021 13:04:25 -0400
X-MC-Unique: JUCGXn-YPMCMKi5Eg66_YQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D1B6801106;
	Tue, 15 Jun 2021 17:04:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C686B19C66;
	Tue, 15 Jun 2021 17:04:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E117D1809CAD;
	Tue, 15 Jun 2021 17:04:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15FH40Tn027782 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 15 Jun 2021 13:04:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 586AB5C22B; Tue, 15 Jun 2021 17:04:00 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D2375C1C2;
	Tue, 15 Jun 2021 17:03:56 +0000 (UTC)
Date: Tue, 15 Jun 2021 12:03:54 -0500
From: David Teigland <teigland@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20210615170354.GA357@redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
	<dd395e820a4cf9b5e807e8de1e456786eebd2044.camel@suse.com>
	<20210607213003.GA8181@redhat.com>
	<1760ea9715bc7a16d4efe10dd95105d663a07228.camel@suse.com>
	<20210608153937.GA21355@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210608153937.GA21355@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-lvm@redhat.com
Cc: "rogerheflin@gmail.com" <rogerheflin@gmail.com>, prajnoha@redhat.com,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	Heming Zhao <heming.zhao@suse.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 08, 2021 at 10:39:37AM -0500, David Teigland wrote:
> I think it would be an improvement to:
> 
> . Make obtain_device_list_from_udev only control how we get the device
>   list. Then we can easily default to 0 and readdir /dev if it's better.
> 
> . Use both native md/mpath detection *and* udev info when it's readily
>   available (don't wait for it), instead of limiting ourselves to one
>   source of info.  If either source indicates an md/mpath component,
>   then we consider it true.
> 
> The second point means we are free to change obtain_device_list_from_udev
> as we wish, without affecting md/mpath detection.  It may also improve
> md/mpath detection overall.

Here are the initial patches I'm testing (libmpathvalid not yet added)
https://sourceware.org/git/?p=lvm2.git;a=shortlog;h=refs/heads/dev-dct-device-info-1

devices: rework native and udev device info

. Make the obtain_device_list_from_udev setting
  affect only the choice of readdir /dev vs libudev
  for a device name listing.  The setting no longer
  controls if udev is used for device type checks.

. Change obtain_device_list_from_udev default to 0.
  A list of device names is obtained from readdir /dev
  by default, which is faster than libudev (especially
  with many devices.)

. Change external_device_info_source="none" behavior:
  remove libudev device info queries for "none", so
  libudev usage will be avoided entirely. "none"
  remains the default setting.

. Change external_device_info_source="udev" behavior:
  information from libudev is added to the native
  device info rather than replacing the native device
  info. This may be useful if there is some gap in
  the lvm native device info.

. Remove sleep/retry loop when attempting libudev
  queries for device info.  udev info will simply
  be skipped if it's not immediately available.
  Because udev info is supplementary to native
  info, it's not essential to get it.

filter-usable: remove udev dev size check

For the pv_min_size check, always use dev_get_size()
which is commonly used elsewhere, and don't bother
asking libudev for the device size when
external_device_info_source=udev.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

