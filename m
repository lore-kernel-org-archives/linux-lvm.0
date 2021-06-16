Return-Path: <SRS0=KZoJ=LK=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8639FC48BE5
	for <linux-lvm@archiver.kernel.org>; Wed, 16 Jun 2021 16:38:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 019656135C
	for <linux-lvm@archiver.kernel.org>; Wed, 16 Jun 2021 16:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 019656135C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623861518;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eQhkyFovhRSZ+NUdVuZQ4rP4TtZ2CzFjJiZciKXcX9o=;
	b=GZ98QhJTRY2Vt8sut6w27wgtMmm75FSaLvk3LGLgTmatNrAfrB0W2pVwxTlILPE9/DOHWm
	MEwB3CUDusPVgDOqbXYhXGCsBIz38srEN2PtsDOyxCp4QqtvrBNmEMWu228HRiMdUThSYW
	ihOTVd+9JwltDMn5dmz/rskyreTRGS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-j5D1zqveOc-IJmQ7QCR25w-1; Wed, 16 Jun 2021 12:38:36 -0400
X-MC-Unique: j5D1zqveOc-IJmQ7QCR25w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1D4C8797D3;
	Wed, 16 Jun 2021 16:38:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39F395C1C5;
	Wed, 16 Jun 2021 16:38:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9864E4A717;
	Wed, 16 Jun 2021 16:38:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15GGcMUT024617 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 16 Jun 2021 12:38:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 171D760622; Wed, 16 Jun 2021 16:38:22 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A54560C03;
	Wed, 16 Jun 2021 16:38:18 +0000 (UTC)
Date: Wed, 16 Jun 2021 11:38:16 -0500
From: David Teigland <teigland@redhat.com>
To: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <20210616163816.GA5811@redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
	<dd395e820a4cf9b5e807e8de1e456786eebd2044.camel@suse.com>
	<20210607213003.GA8181@redhat.com>
	<1760ea9715bc7a16d4efe10dd95105d663a07228.camel@suse.com>
	<20210608153937.GA21355@redhat.com>
	<20210615170354.GA357@redhat.com>
	<ce60635c-320a-be17-4c9e-a6c6b1afdeba@suse.com>
MIME-Version: 1.0
In-Reply-To: <ce60635c-320a-be17-4c9e-a6c6b1afdeba@suse.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 15GGcMUT024617
X-loop: linux-lvm@redhat.com
Cc: "rogerheflin@gmail.com" <rogerheflin@gmail.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	Martin Wilck <martin.wilck@suse.com>, prajnoha@redhat.com,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 17, 2021 at 12:18:47AM +0800, heming.zhao@suse.com wrote:
> I don't know if I missed something, the result didn't show any progress.
> the result of "devices/obtain_device_list_from_udev=0" even got regression: from 23.3 => 39.8
> 
> the lvm2 version with dev-dct-device-info-1 branch code
> ```
> sle15sp2-base40g:~ # lvm version
>   LVM version:     2.03.13(2)-git (2021-05-07)
>   Library version: 1.02.179-git (2021-05-07)
>   Driver version:  4.40.0
>   Configuration:   ./configure --host=x86_64-suse-linux-gnu --build=x86_64-suse-linux-gnu --program-prefix= --disable-dependency-tracking --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --sysconfdir=/etc --datadir=/usr/share --includedir=/usr/include --libdir=/usr/lib64 --libexecdir=/usr/lib --localstatedir=/var --sharedstatedir=/var/lib --mandir=/usr/share/man --infodir=/usr/share/info --disable-dependency-tracking --enable-dmeventd --enable-cmdlib --enable-udev_rules --enable-udev_sync --with-udev-prefix=/usr/ --enable-selinux --enable-pkgconfig --with-usrlibdir=/usr/lib64 --with-usrsbindir=/usr/sbin --with-default-dm-run-dir=/run --with-tmpfilesdir=/usr/lib/tmpfiles.d --with-thin=internal --with-device-gid=6 --with-device-mode=0640 --with-device-uid=0 --with-dmeventd-path=/usr/sbin/dmeventd --with-thin-check=/usr/sbin/thin_check --with-thin-dump=/usr/sbin/thin_dump --with-thin-repair=/usr/sbin/thin_repair --enable-blkid_wiping --enable-lvmpolld --enable-re
 altime --with-cache=internal --with-default-locking-dir=/run/lock/lvm --with-default-pid-dir=/run --with-default-run-dir=/run/lvm --enable-fsadm --disable-silent-rules --enable-write_install --with-vdo=none
> ```
> 
> Installation with cmd: make install && dracut -f --add "lvm"
> 
> top 10 blame services
> ```
> external_device_info_source = "none"
> obtain_device_list_from_udev = 1
> event_activation = 1
> udev_sync = 1

Thanks for running that again.  From your previous testing, my conclusion
was that libudev caused the slowdown.  So, the patch is supposed to avoid
all libudev calls by default, and rely only on lvm's native device type
detection.  The default settings to avoid libudev, are:

  obtain_device_list_from_udev = 0
  external_device_info_source = "none"

I'm not sure which of your test results match those settings, but if those
results are not improved, then we should look further to see if the
slowdown is caused by something other than libudev calls.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

