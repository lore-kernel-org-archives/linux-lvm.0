Return-Path: <SRS0=rHwH=MA=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B434C07E96
	for <linux-lvm@archiver.kernel.org>; Thu,  8 Jul 2021 10:11:46 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC5C661451
	for <linux-lvm@archiver.kernel.org>; Thu,  8 Jul 2021 10:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC5C661451
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-_n7HnTvPPxSefWS7hXMRRg-1; Thu, 08 Jul 2021 06:11:43 -0400
X-MC-Unique: _n7HnTvPPxSefWS7hXMRRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A016A362FF;
	Thu,  8 Jul 2021 10:11:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C715960854;
	Thu,  8 Jul 2021 10:11:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A7CAF4EA2A;
	Thu,  8 Jul 2021 10:11:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 168ABFll022862 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 8 Jul 2021 06:11:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E483A20148FA; Thu,  8 Jul 2021 10:11:14 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF9A921623AC
	for <linux-lvm@redhat.com>; Thu,  8 Jul 2021 10:11:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23D27805F49
	for <linux-lvm@redhat.com>; Thu,  8 Jul 2021 10:11:12 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
	[209.85.167.42]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-188-wjWRCnjYPMu2_crGbB_-Mg-1; Thu, 08 Jul 2021 06:11:09 -0400
X-MC-Unique: wjWRCnjYPMu2_crGbB_-Mg-1
Received: by mail-lf1-f42.google.com with SMTP id p16so13787144lfc.5;
	Thu, 08 Jul 2021 03:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5pwGrLpwRNYVcrNfnaezaEs1Ef3IsmUokkuVP+7S9rk=;
	b=dTPpResQCy84N28QrKAu38kjI76CiX5zAEUoWAfQ8JseXOaaw2TYjHE4JS9yF5YBpG
	mkeSoWGumI0TK0FRW5gCGfvUAut3fIlCEWJ9utj8tfXF+aM0UrkS+np9GS1WxbHCTpO+
	imG5I/HwVupNV8Syc1hB4fUyxmO4Vc0Xq0/kvTcnqq9+q99ymrP6PCTc2h7ZmQjghhUd
	h1IsEfPdiELXqVqqzKet/1YTJJWQLu3uPPTeC3fdjq2mR4gcSqxMIgWp/5I4YS+KeqrZ
	CJHk05RrVbwmcSylm0lVtC6Lxzbf8wd9hZGV0c8lydQgvCxKjpndX//XvpkWkQvS/RCp
	q8mA==
X-Gm-Message-State: AOAM531JfA5Gb3/kzgLLGJ8wTI761/pm7gRtQs1exoxCreeXazYyKTN5
	vpqrzfoFHWaM2ZN21CR9G3YYa/YJm626PI/tt/JxSE8t3CM=
X-Google-Smtp-Source: ABdhPJySXlmkk11Kh9qMYaSRxhXrBSHTBRpu1EMxKOgw31+yYLBfsTVvFc3ABCKVSHC5b52dXXxyLe22CDFDi4jPfaU=
X-Received: by 2002:a2e:a602:: with SMTP id v2mr24028314ljp.50.1625739067966; 
	Thu, 08 Jul 2021 03:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<20210702210903.GA15057@redhat.com>
	<831e213cc0c54476d053ab230df29a4cb386d784.camel@suse.com>
	<20210702220219.GB15057@redhat.com>
	<50b3e710-a6b7-2cc5-04fc-63525f0d720c@suse.com>
In-Reply-To: <50b3e710-a6b7-2cc5-04fc-63525f0d720c@suse.com>
From: Tom Yan <tom.ty89@gmail.com>
Date: Thu, 8 Jul 2021 18:10:56 +0800
Message-ID: <CAGnHSEnOUfYSs8UiOnTYFRG2Xv9EsF4fpyq+OspgUe-d-EkrXw@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-lvm@redhat.com
Cc: "zkabelac@redhat.com" <zkabelac@redhat.com>,
	David Teigland <teigland@redhat.com>, Martin Wilck <martin.wilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I wonder if using a shell wrapper to detect whether pvscan actually
exits way earlier than the unit does is a more accurate approach.

On Sat, 3 Jul 2021 at 19:50, heming.zhao@suse.com <heming.zhao@suse.com> wrote:
>
> On 7/3/21 6:02 AM, David Teigland wrote:
> > On Fri, Jul 02, 2021 at 09:22:03PM +0000, Martin Wilck wrote:
> >> On Fr, 2021-07-02 at 16:09 -0500, David Teigland wrote:
> >>> On Sun, Jun 06, 2021 at 02:15:23PM +0800, heming.zhao@suse.com wrote:
> >>>> dev_cache_scan //order: O(n^2)
> >>>>   + _insert_dirs //O(n)
> >>>>   | if obtain_device_list_from_udev() true
> >>>>   |   _insert_udev_dir //O(n)
> >>>>   |
> >>>>   + dev_cache_index_devs //O(n)
> >>>
> >>> I've been running some experiments and trying some patches to improve
> >>> this.  By setting obtain_device_list_from_udev=0, and using the
> >>> attached
> >>> patch to disable dev_cache_index_devs, the pvscan is much better.
> >>>
> >>> systemctl status lvm2-pvscan appears to show that the pvscan command
> >>> itself runs for only 2-4 seconds, while the service as a whole takes
> >>> around 15 seconds.  See the 16 sec gap below from the end of pvscan
> >>> to the systemd Started message.  If that's accurate, the remaining
> >>> delay
> >>> would lie outside lvm.
> >>>
> >>> Jul 02 15:27:57 localhost.localdomain systemd[1]: Starting LVM event
> >>> activation on device 253:1710...
> >>> Jul 02 15:28:00 localhost.localdomain lvm[65620]:   pvscan[65620] PV
> >>> /dev/mapper/mpathalz online, VG 1ed02c7d-0019-43c4-91b5-f220f3521ba9
> >>> is complete.
> >>> Jul 02 15:28:00 localhost.localdomain lvm[65620]:   pvscan[65620] VG
> >>> 1ed02c7d-0019-43c4-91b5-f220f3521ba9 run autoactivation.
> >>> Jul 02 15:28:00 localhost.localdomain lvm[65620]:   1 logical
> >>> volume(s) in volume group "1ed02c7d-0019-43c4-91b5-f220f3521ba9" now
> >>> active
> >>
> >> Printing this message is really the last thing that pvscan does?
> >
> > I've not seen anything measurable after that message.  However, digging
> > through the command init/exit paths I did find libudev setup/destroy calls
> > that can also be skipped when the command is not accessing libudev info.
> > A quick check seemed to show some further improvement from dropping those.
> > (That will be part of the larger patch isolating libudev usage.)
> >
> > I'm still seeing significant delay between the apparent command exit and
> > the systemd "Started" message, but this will require a little more work to
> > prove.
> >
>
> I applied the patch and got the very similar result.
>
>
> ```with patch
> # systemd-analyze blame
>           27.679s lvm2-pvscan@134:896.service
>           27.664s lvm2-pvscan@134:800.service
>           27.648s lvm2-pvscan@134:960.service
>           27.645s lvm2-pvscan@132:816.service
>           27.589s lvm2-pvscan@134:816.service
>           27.582s lvm2-pvscan@133:992.service
>           ... ...
>
> # systemctl status lvm2-pvscan@134:896.service
> ... ...
> Jul 03 19:43:02 sle15sp2-base40g systemd[1]: Starting LVM event activation on device 134:896...
> Jul 03 19:43:03 sle15sp2-base40g lvm[24817]:   pvscan[24817] PV /dev/sdalm online, VG vg_sdalm is complet>
> Jul 03 19:43:03 sle15sp2-base40g lvm[24817]:   pvscan[24817] VG vg_sdalm run autoactivation.
> Jul 03 19:43:03 sle15sp2-base40g lvm[24817]:   1 logical volume(s) in volume group "vg_sdalm" now active
> Jul 03 19:43:30 sle15sp2-base40g systemd[1]: Started LVM event activation on device 134:896.
> ```
>
> the 27.679s get from 19:43:30 minus 19:43:02.
>
> and 27s is 10s quick than the lvm without patch (by today's test result)
> ```without patch
> # systemd-analyze blame
>           37.650s lvm2-pvscan@133:992.service
>           37.650s lvm2-pvscan@133:1008.service
>           37.649s lvm2-pvscan@133:896.service
>           37.649s lvm2-pvscan@134:960.service
>           37.612s lvm2-pvscan@133:880.service
>           37.612s lvm2-pvscan@133:864.servic
>           ... ...
>
> # systemctl status lvm2-pvscan@133:992.service
> ... ...
> Jul 03 19:31:28 sle15sp2-base40g systemd[1]: Starting LVM event activation on device 133:992...
> Jul 03 19:31:30 sle15sp2-base40g lvm[24243]:   pvscan[24243] PV /dev/sdalc online, VG vg_sdalc is complet>
> Jul 03 19:31:30 sle15sp2-base40g lvm[24243]:   pvscan[24243] VG vg_sdalc run autoactivation.
> Jul 03 19:31:30 sle15sp2-base40g lvm[24243]:   1 logical volume(s) in volume group "vg_sdalc" now active
> Jul 03 19:32:05 sle15sp2-base40g systemd[1]: Started LVM event activation on device 133:992.
> ```
>
> I added log in lvm2 code, the time of log "1 logical volume(s) in volume
> group "vg_sdalm" now active" is the real pvscan finished time. Martin
> comment in previous mail is may right, systemd is may busy and delayed to
> detect/see the pvscan service completion.
>
> Thanks,
> heming
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

