Return-Path: <SRS0=xM+Q=LB=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC03C47082
	for <linux-lvm@archiver.kernel.org>; Mon,  7 Jun 2021 16:43:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD20C6054E
	for <linux-lvm@archiver.kernel.org>; Mon,  7 Jun 2021 16:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD20C6054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623084225;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XVrB+ZiBXKyrWN/VPMLRjK69OzrB8oOWsnq8M8v0MmU=;
	b=RHl2Kd28Dhbbjtqv4dPKCFh8cfv9n2F30ndUTpVnZ5lOJsmiy9siE5NV5C+SzoohkHRjF5
	ymbSzQQxwBLbsmKfvaRE1pyD4SwXs+YkH1k9UUk3iTDPF8TZfCDaJgLadvmb1fAPT76l1W
	NvpJtmTaJu4hnMjTWGiL0G9uOsWQSKc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-2Ca5aNBbPGiDylKiYWDtpg-1; Mon, 07 Jun 2021 12:43:44 -0400
X-MC-Unique: 2Ca5aNBbPGiDylKiYWDtpg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 045868049CE;
	Mon,  7 Jun 2021 16:43:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E06985D6D3;
	Mon,  7 Jun 2021 16:43:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D7EB1801265;
	Mon,  7 Jun 2021 16:43:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 157Ge8nm019775 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 7 Jun 2021 12:40:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F11DB5D769; Mon,  7 Jun 2021 16:40:07 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23EAA5D6D5;
	Mon,  7 Jun 2021 16:40:03 +0000 (UTC)
Date: Mon, 7 Jun 2021 11:40:01 -0500
From: David Teigland <teigland@redhat.com>
To: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <20210607164001.GA2325@redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
MIME-Version: 1.0
In-Reply-To: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-lvm@redhat.com
Cc: Martin Wilck <martin.wilck@suse.com>,
	LVM general discussion and development <linux-lvm@redhat.com>,
	Zdenek Kabelac <zkabelac@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi Heming,

Thanks for the analysis and tying things together for us so clearly, and I
like the ideas you've outlined.

On Sun, Jun 06, 2021 at 02:15:23PM +0800, heming.zhao@suse.com wrote:
> I send this mail for a well known performance issue:
>  when system is attached huge numbers of devices. (ie. 1000+ disks),
>  the lvm2-pvscan@.service costs too much time and systemd is very easy to
>  time out, and enter emergency shell in the end.
> 
> This performance topic had been discussed in there some times, and the issue was
> lasting for many years. From the lvm2 latest code, this issue still can't be fix
> completely. The latest code add new function _pvscan_aa_quick(), which makes the
> booting time largely reduce but still can's fix this issue utterly.
> 
> In my test env, x86 qemu-kvm machine, 6vcpu, 22GB mem, 1015 pv/vg/lv, comparing
> with/without _pvscan_aa_quick() code, booting time reduce from "9min 51s" to
> "2min 6s". But after switching to direct activation, the booting time is 8.7s
> (for longest lvm2 services: lvm2-activation-early.service).

Interesting, it's good to see the "quick" optimization is so effective.
Another optimization that should be helping in many cases is the
"vgs_online" file which will prevent concurrent pvscans from all
attempting to autoactivate a VG.

> The hot spot of event activation is dev_cache_scan, which time complexity is
> O(n^2). And at the same time, systemd-udev worker will generate/run
> lvm2-pvscan@.service on all detecting disks. So the overall is O(n^3).
> 
> ```
> dev_cache_scan //order: O(n^2)
>  + _insert_dirs //O(n)
>  | if obtain_device_list_from_udev() true
>  |   _insert_udev_dir //O(n)
>  |
>  + dev_cache_index_devs //O(n)
> 
> There are 'n' lvm2-pvscan@.service running: O(n)
> Overall: O(n) * O(n^2) => O(n^3)
> ```

I knew the dev_cache_scan was inefficient, but didn't realize it was
having such a negative impact, especially since it isn't reading devices.
Some details I'm interested to look at more closely (and perhaps you
already have some answers here):

1. Does obtain_device_list_from_udev=0 improve things?  I recently noticed
that 0 appeared to be faster (anecdotally), and proposed we change the
default to 0 (also because I'm biased toward avoiding udev whenever
possible.)

2. We should probably move or improve the "index_devs" step; it's not the
main job of dev_cache_scan and I suspect this could be done more
efficiently, or avoided in many cases.

3. pvscan --cache is supposed to be scalable because it only (usually)
reads the single device that is passed to it, until activation is needed,
at which point all devices are read to perform a proper VG activation.
However, pvscan does not attempt to reduce dev_cache_scan since I didn't
know it was a problem.  It probably makes sense to avoid a full
dev_cache_scan when pvscan is only processing one device (e.g.
setup_device() rather than setup_devices().)

> Question/topic:
> Could we find out a final solution to have a good performance & scale well under
> event-based activation?

First, you might not have seen my recently added udev rule for
autoactivation, I apologize it's been sitting in the "dev-next" branch
since we've not figured out a good a branching strategy for this change.
We just began getting some feedback on this change last week:

https://sourceware.org/git/?p=lvm2.git;a=blob;f=udev/69-dm-lvm.rules.in;h=03c8fbbd6870bbd925c123d66b40ac135b295574;hb=refs/heads/dev-next

There's a similar change I'm working on for dracut:
https://github.com/dracutdevs/dracut/pull/1506

Each device uevent still triggers a pvscan --cache, reading just the one
device, but when a VG is complete, the udev rule runs systemd-run vgchange
-aay VG.  Since it's not changing dev_cache_scan usage, the issues you're
describing will still need to be looked at.

> Maybe two solutions (Martin & I discussed):
> 
> 1. During boot phase, lvm2 automatically swithes to direct activation mode
> ("event_activation = 0"). After booted, switch back to the event activation mode.
> 
> Booting phase is a speical stage. *During boot*, we could "pretend" that direct
> activation (event_activation=0) is set, and rely on lvm2-activation-*.service
> for PV detection. Once lvm2-activation-net.service has finished, we could
> "switch on" event activation.
> 
> More precisely: pvscan --cache would look at some file under /run,
> e.g. /run/lvm2/boot-finished, and quit immediately if the file doesn't exist
> (as if event_activation=0 was set). In lvm2-activation-net.service, we would add
> something like:
> 
> ```
> ExecStartPost=/bin/touch /run/lvm2/boot-finished
> ```
> 
> ... so that, from this point in time onward, "pvscan --cache" would _not_ quit
> immediately any more, but run normally (assuming that the global
> event_activation setting is 1). This way we'd get the benefit of using the
> static activation services during boot (good performance) while still being able
> to react to udev events after booting has finished.
> 
> This idea would be worked out with very few code changes.
> The result would be a huge step forward on booting time.

This sounds appealing to me, I've always found it somewhat dubious how we
pretend each device is newly attached, and process it individually, even
if all devices are already present.  We should be taking advantage of the
common case when many or most devices are already present, which is what
you're doing here.  Async/event-based processing has it's place, but it's
surely not always the best answer.  I will think some more about the
details of how this might work, it seems promising.

> 2. change lvm2-pvscan@.service running mode from parallel to serival.
> 
> This idea looks a little weird, it goes the opposite trend of today's
> programming technologies: parallel programming on multi-cores.
> 
> idea:
> the action of lvm2 scaning "/dev" is hard to change, the outside parallel
> lvm2-pvscan@.service could change from parallel to serial.
>
> For example, a running pvscan instance could set a "running" flag in tmpfs (ie.
> /run/lvm/) indicating that no other pvscan process should be called in parallel.
> If another pvscan is invoked and sees "running", it would create a "pending"
> flag, and quit. Any other pvscan process seeing the "pending" flag would
> just quit. If the first instance sees the "pending" flag, it would
> atomically remove "pending" and restart itself, in order to catch any device
> that might have appeared since the previous sysfs scan.
> In most condition, devices had been found by once pvscan scanning,
> then next time of pvscan scanning should work with order O(n), because the
> target device had been inserted internal cache tree already. and on overall,
> there is only a single pvscan process would be running at any given time.
> 
> We could create a list of pending to-be-scanned devices then (might be directory
> entries in some tmpfs directory). On exit, pvscan could check this dir and
> restart if it's non-empty.

The present design is based on pvscan --cache reading only the one device
that has been attached, and I think that's good.  I'd expect that also
lends itself to running pvscans in parallel, since they are all reading
different devices.  If it's just dev_cache_scan that needs optimizing, I
expect there are better ways to do that than adding serialization.  This
is also related to the number of udev workers as mentioned in the next
email.  So I think we need to narrow down the problem a little more before
we know if serializing is going to be the right answer, or where/how to do
it.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

