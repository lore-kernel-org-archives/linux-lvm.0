Return-Path: <SRS0=tbfx=PG=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43CC4C433EF
	for <linux-lvm@archiver.kernel.org>; Mon, 18 Oct 2021 21:57:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AF6A608FE
	for <linux-lvm@archiver.kernel.org>; Mon, 18 Oct 2021 21:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8AF6A608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-fBETS4NYOGyEuN7w_uuKDQ-1; Mon, 18 Oct 2021 17:57:05 -0400
X-MC-Unique: fBETS4NYOGyEuN7w_uuKDQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26A1218125C0;
	Mon, 18 Oct 2021 21:56:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 126A0100763D;
	Mon, 18 Oct 2021 21:56:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BDC001806D03;
	Mon, 18 Oct 2021 21:56:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19ILunrl004016 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 17:56:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4014C2166B26; Mon, 18 Oct 2021 21:56:49 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A3542166B25
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2021 21:56:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CFCB800B24
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2021 21:56:46 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-486-1K_9VH5tOvu4Q-fa4NxpLg-1;
	Mon, 18 Oct 2021 17:56:44 -0400
X-MC-Unique: 1K_9VH5tOvu4Q-fa4NxpLg-1
Received: from list by ciao.gmane.io with local (Exim 4.92)
	(envelope-from <gllg-linux-lvm@m.gmane-mx.org>) id 1mcaXg-0003nO-Hg
	for linux-lvm@redhat.com; Mon, 18 Oct 2021 23:51:36 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: linux-lvm@redhat.com
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Date: Mon, 18 Oct 2021 23:51:27 +0200
Message-ID: <2e100f5d-6eec-a61b-004d-87b9c100f442@gmail.com>
References: <d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<20210929213952.ws2qpmedaajs5wlx@alatyr-rpi.brq.redhat.com>
	<20210930155542.GB32174@redhat.com>
	<418b2bd497a3a4cd76840b3cceb1955ba7e9ba01.camel@suse.com>
	<20211018150418.GA3917@redhat.com>
Mime-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Firefox/91.0 Thunderbird/91.1.0
In-Reply-To: <20211018150418.GA3917@redhat.com>
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
Cc: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 18. 10. 21 v 17:04 David Teigland napsal(a):
> On Mon, Oct 18, 2021 at 06:24:49AM +0000, Martin Wilck wrote:
>> I'd like to second Peter here, "RUN" is in general less fragile than
>> "IMPORT{PROGRAM}". You should use IMPORT{PROGRAM}" if and only if
>>
>>   - the invoked program can work with incomplete udev state of a device
>>     (the progrem should not try to access the device via
>>     libudev, it should rather get properties either from sysfs or the
>>     uevent's environment variables)
>>   - you need the result or the output of the program in order to proceed
>>     with rules processing.
> 
> Those are both true in this case.  I can't say I like it either, but udev
> rules force hacky solutions on us.  I began trying to use RUN several
> months ago and I think I gave up trying to find a way to pass values from
> the RUN program back into the udev rule (possibly by writing values to a
> temp file and then doing IMPORT{file}).  The udev rule needs the name of
> the VG to activate, and that name comes from the pvscan.  For an even
> uglier form of this, see the equivalent I wrote for dracut:
> https://github.com/dracutdevs/dracut/pull/1567/files
> 
> The latest version of the hybrid service+event activation is here
> https://sourceware.org/git/?p=lvm2.git;a=shortlog;h=refs/heads/dev-dct-activation-switch-7
> 
> I've made it simple to edit lvm.conf to switch between:
> - activation from fixed services only
> - activation from events only
> - activation from fixes services first, then from events
> 
> There are sure to be tradeoffs, we know that many concurrent activations
> from events are slow, and fixed services which are more serialized could
> be delayed from slow devices.  I'm still undecided on the best default
> setting, i.e. which will work best for most people, and would welcome any
> thoughts or relevant experience.


I've some testing for these issues - we are trimming some 'easy' to fix issues 
away (so git HEAD should be now be actually already somewhat bit faster).

The more generic solution with auto activation should likely try to 'active' 
as much found complete VGs as it can at any given moment in time.

ATM lvm2 suffers when it's being running massively parallel - this has not 
been yet fully analyzed - but there is certainly much better throughput if 
there is limitted amount of 'parallel' executed lvm2 commands.

Our goal ATM is to accelerate 'pvscan'.

We could think if there is some easy mechanism how to 'accumulate' complete 
VGs and activate all of them in single 'vgchange' command - and run the next 
after the running one is finished - this currently gives reasonable good 
'throughput' and should work without 'exceptional' case of being fast only once.

Another point for thinking is 'limiting' set of PVs for this activation 
command - so we avoid  repetitive validations of the whole system  - for this 
should be usable option  --devices|--devicesfile - but needs some thinking how 
to use this in smart way with the 'collected' activation.



Regards

Zdenek


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

