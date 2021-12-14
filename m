Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109EFC433EF
	for <linux-lvm@archiver.kernel.org>; Tue, 14 Dec 2021 16:56:08 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-wr7FJMkjO1m-Lk0YcRSl_A-1; Tue, 14 Dec 2021 11:56:06 -0500
X-MC-Unique: wr7FJMkjO1m-Lk0YcRSl_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02BF3760C1;
	Tue, 14 Dec 2021 16:56:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 184DA92307;
	Tue, 14 Dec 2021 16:55:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D19321809CB8;
	Tue, 14 Dec 2021 16:55:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BEGtjg9021387 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 14 Dec 2021 11:55:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D2078C017DA; Tue, 14 Dec 2021 16:55:45 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC2E0C23DC3
	for <linux-lvm@redhat.com>; Tue, 14 Dec 2021 16:55:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2E57811E78
	for <linux-lvm@redhat.com>; Tue, 14 Dec 2021 16:55:45 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-656-SgNnhBXgNKeO7PPiiyQ5zA-1; Tue, 14 Dec 2021 11:55:44 -0500
X-MC-Unique: SgNnhBXgNKeO7PPiiyQ5zA-1
Received: by mail-lj1-f171.google.com with SMTP id k23so29297949lje.1;
	Tue, 14 Dec 2021 08:55:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vkDKWnx7RJDDMLZ9e2fXP99jgLjOXfybr6vlC0FP/uk=;
	b=OsS6tqd75ugb8q6+SGD0uCQqhONa49al8hyA03qLOrK0PTSTguP32Dws6xJOY+v4FZ
	S7mSoOdba7yQ3bldKumoqV9QsoMww37VYBeaRY6NPu8H/7ZW/KPbF/8XjZZ/6JRp8x6a
	oXWaUXiSrk0UjLuXda6m/ulDjobMkTxyjBQ3XrC0Zomv6F1+4xiLq374eN2AZ0xpPjPt
	VSxHjJwqh0WjPubArOSnH3RgDCgusF1L+IqXhmDIce5461w60IPmZ+3pXX0/4+1Lqz8r
	iELEL7/KIbomcDXnB55WeQO72iJy1MsGDotMWv14/tPvryC7cQ+bRZDjsgVaH+4DPiVH
	djJA==
X-Gm-Message-State: AOAM533Kzvn1KZgRv5JhMrlf9w0TAWNV5wBchKmcmy/x8v1IX9sjwtiK
	n2IK0kQbI5hlds3rRt1KeHcSS6jrHvahjfAGo30LHCqOUQ8=
X-Google-Smtp-Source: ABdhPJzofKXSGQLWrFGlJQONk7sWmWStzs9+XXY8KIwQixEr2zhTJpEWBlyqAwDyhv4sDhxean/pIaf1BElt7CNRmes=
X-Received: by 2002:a2e:b541:: with SMTP id a1mr5960874ljn.289.1639500942234; 
	Tue, 14 Dec 2021 08:55:42 -0800 (PST)
MIME-Version: 1.0
References: <CAGnHSEkb59u8LLWks03q=hh3rxcNJQqNLNkjBqc33-Osq=ZZMQ@mail.gmail.com>
	<20211214153440.GA12773@redhat.com>
In-Reply-To: <20211214153440.GA12773@redhat.com>
From: Tom Yan <tom.ty89@gmail.com>
Date: Wed, 15 Dec 2021 00:55:31 +0800
Message-ID: <CAGnHSEmTXbs2VoiHYFy4q+QJmg-PMbQq71ag-f7ot48P+Mj0QQ@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] Reason to use -r when systemd-run vgchange -aay
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 14 Dec 2021 at 23:35, David Teigland <teigland@redhat.com> wrote:
>
> On Tue, Dec 14, 2021 at 01:45:57PM +0800, Tom Yan wrote:
> > Hi David,
> >
> > I notice that in the "new" 69-dm-lvm.rules, vgchange -aay is run with
> > systemd-run, which is not a problem.
> >
> > However, the fact that the --remain-after-exit (i.e. -r) switch is
> > used is, because the service is not stopped when e.g. one deactivates
> > a VG with vgchange -an, which will prevent the VG from being
> > auto-activated again if e.g. the PV is removed and inserted again.
> >
> > I'm not sure if that was a desired behaviour / one of the intended
> > purposes. Regardless, I'm not exactly seeing the sense of that either.
> >
> > Besides, I don't suppose it would work very well for multi-PV VGs
> > anyway. I mean, most likely similar errors (albeit probably harmless)
> > would be spammed because of the repeated attempt to *create* a
> > transient unit of the same name. (Repeated systemd-run is NOT the same
> > as repeated systemctl start; it's also the reason that triggering
> > `systemctl stop` with remove event is not a perfect idea either, since
> > transient unit created would be gone once it is stopped, so repeated
> > systemctl stop will cause more errors to be spammed; Yet we need the
> > unit to be gone when it is stopped for the current approach, even if
> > it's possible to prevent it from going away.)
> >
> > So are there any reasons that we actually need -r? If so, I think we
> > need to deal with them with another approach (maybe unit template?).
>
> I added -r to make it easier to see the status/output of the transient
> service.  The problem of rerunning the same transient service crossed my
> mind at one point, but I never went back to check that.  With your
> confirmation, it sounds like -r should be removed.  I want to check if
> we can see everything we need to without -r.  I think that service
> templates only work with device names, where we need a VG name.

Yeah without `-r` the services will not be listed in `systemctl`, but
apparently their "deactivation" will still be logged.

Regardless, FYI, the following works too (there might still be room
for improvement though):

$ git diff /{usr/lib,etc}/udev/rules.d/69-dm-lvm.rules
diff --git a/usr/lib/udev/rules.d/69-dm-lvm.rules
b/etc/udev/rules.d/69-dm-lvm.rules
index 1a6b450..abf5396 100644
--- a/usr/lib/udev/rules.d/69-dm-lvm.rules
+++ b/etc/udev/rules.d/69-dm-lvm.rules
@@ -13,6 +13,7 @@ ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}=="1", GOTO="lvm_end"
 # Only process devices already marked as a PV - this requires blkid
to be called before.
 ENV{ID_FS_TYPE}!="LVM2_member", GOTO="lvm_end"
 ENV{DM_MULTIPATH_DEVICE_PATH}=="1", GOTO="lvm_end"
+ACTION=="remove", ENV{LVM_VG_NAME_COMPLETE}=="?*",
RUN+="/usr/bin/systemctl stop lvm-activate@$env{LVM_VG_NAME_COMPLETE}"
 ACTION=="remove", GOTO="lvm_end"

 # Create /dev/disk/by-id/lvm-pv-uuid-<PV_UUID> symlink for each PV
@@ -80,7 +81,7 @@ ENV{SYSTEMD_READY}="1"
 # it's better suited to appearing in the journal.

 IMPORT{program}="/usr/bin/lvm pvscan --cache --listvg --checkcomplete
--vgonline --udevoutput --journal=output $env{DEVNAME}"
-ENV{LVM_VG_NAME_COMPLETE}=="?*", RUN+="/usr/bin/systemd-run -r
--no-block --property DefaultDependencies=no --unit
lvm-activate-$env{LVM_VG_NAME_COMPLETE} /usr/bin/lvm vgchange -aay
--nohints $env{LVM_VG_NAME_COMPLETE}"
+ENV{LVM_VG_NAME_COMPLETE}=="?*", RUN+="/usr/bin/systemctl start
lvm-activate@$env{LVM_VG_NAME_COMPLETE}"
 GOTO="lvm_end"

 LABEL="lvm_end"

$ cat /etc/systemd/system/lvm-activate\@.service
[Unit]
DefaultDependencies=no

[Service]
RemainAfterExit=yes
ExecStart=/usr/bin/lvm vgchange -aay --nohints %i

>
> The behavior of repeated VG autoactivation is not entirely well defined,
> but we've made some attempt to maintain the status quo.  We may add an
> lvm.conf setting at some point to control that behavior if issues appear.
>
> > I also saw this PR on github. I'm not sure if what it stated makes any
> > sense though: https://github.com/lvmteam/lvm2/pull/37
>
> I'm not sure about that, those generated services don't get much attention
> and we've begun asking around to see if they could be removed.
>
> Dave
>

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

