Return-Path: <SRS0=xM+Q=LB=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5A0C4743F
	for <linux-lvm@archiver.kernel.org>; Mon,  7 Jun 2021 06:44:49 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2F8B611ED
	for <linux-lvm@archiver.kernel.org>; Mon,  7 Jun 2021 06:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2F8B611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-xEp_WwryNl6PADDYOHkQFQ-1; Mon, 07 Jun 2021 02:44:37 -0400
X-MC-Unique: xEp_WwryNl6PADDYOHkQFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01A53800C60;
	Mon,  7 Jun 2021 06:44:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B193F5272D;
	Mon,  7 Jun 2021 06:44:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4C39F4ED79;
	Mon,  7 Jun 2021 06:44:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 156GZl8c013932 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 6 Jun 2021 12:35:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 13BEE216FD39; Sun,  6 Jun 2021 16:35:47 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D9B5216FD38
	for <linux-lvm@redhat.com>; Sun,  6 Jun 2021 16:35:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D065800B28
	for <linux-lvm@redhat.com>; Sun,  6 Jun 2021 16:35:43 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
	[209.85.222.179]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-236-amIK4g9lPHmWbFEJtq8yZA-1; Sun, 06 Jun 2021 12:35:41 -0400
X-MC-Unique: amIK4g9lPHmWbFEJtq8yZA-1
Received: by mail-qk1-f179.google.com with SMTP id j189so14488526qkf.2;
	Sun, 06 Jun 2021 09:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=O5Kf1bsPpGBLwmz3LeHRiouCLF0j25RZaXEHgxT4APU=;
	b=gMlUMEIq7enXU+krauP6mtI8Z0X5q0S15myUL9k4LmeDfFGvuSzCYJHbKejh5SsUHR
	Wkg+GCvW6nCcuXHyolExJQPxoUC+uajPQJVHjmo8Umdx1FG870Sx+RmyIalZpAnJDFnz
	AaSVgvIvW1QcqDIvOYkVQFcekcOeb+SYQov0cTib+joXK8ljPo318Mphu1vePlVTCQg1
	Nz0kVfljYmChNGWtQnihR/8wq8vesgqNUYIATBfRFAbNxES9vx2F6ANHaFCncmYiKEYL
	5SdMwxRef00XI4nwnypQeOTKHFoDLGblWtbss5Z2XPD/jMNIMbV/hyDpBPqRYaP9wrEk
	gu7A==
X-Gm-Message-State: AOAM532YVYoSUvCIPO1GGToQ7aHwDNgVpHvQOI72+pc7pSv6eRNxOY8t
	V4hrSNgvM2h9aV9hn+reUBG/MLbVk53tvHmU4VfWS3O+5lcIHA==
X-Google-Smtp-Source: ABdhPJzJA+PXHLhlwJBq400x/9qO38TUsf+0SzqKPIGT+mcghu3jJ7Beg65nsC9em+teB1VHIc8c4GCrFir4DAG3+30=
X-Received: by 2002:a05:620a:15d0:: with SMTP id
	o16mr5293224qkm.236.1622997339973; 
	Sun, 06 Jun 2021 09:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
In-Reply-To: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Sun, 6 Jun 2021 11:35:28 -0500
Message-ID: <CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
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
X-Mailman-Approved-At: Mon, 07 Jun 2021 02:44:09 -0400
Cc: Martin Wilck <martin.wilck@suse.com>, David Teigland <teigland@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============5387544700708904976=="

--===============5387544700708904976==
Content-Type: multipart/alternative; boundary="000000000000ebabf605c41b834e"

--000000000000ebabf605c41b834e
Content-Type: text/plain; charset="UTF-8"

This might be a simpler way to control the number of threads at the same
time.

On large machines (cpu wise, memory wise and disk wise).   I have only seen
lvm timeout when udev_children is set to default.   The default seems to be
set wrong, and the default seemed to be tuned for a case where a large
number of the disks on the machine were going to be timing out (or
otherwise really really slow), so to support this case a huge number of
threads was required..    I found that with it set to default on a close to
100 core machine that udev got about 87 minutes of time during the boot up
(about 2 minutes).  Changing the number of children to =4 resulted in udev
getting around 2-3 minutes in the same window, and actually resulted in a
much faster boot up and a much more reliable boot up (no timeouts).   We
experienced these timeouts on a number of the larger machines (70 cores or
more) before we debugged and determined what was going on.   It would
appear that the udev threads on the giant machines with a lot of disk are
overwhelming each other in some sort of tight (either process creating
system time or some other resource constraint) loop and causing contention
and doing very little useful work.

Just an observation, this may have nothing to do with what you have going
on, but what you are describing sounds very close to what I debugged.   We
were doing "ps axuwwS | grep -i udev" just after boot up to determine how
much cpu time udev was getting during boot up, and determined that as we
lowered the children the time got less, and the boot up got faster and
stopped timing out.  And since udev was getting 90 minutes in an elapsed
time of around 120 seconds, it had to be using a significant number of
threads during boot up.  I believe these same udev threads call the pvscans.

Below is one case, but I know there are several other similar cases for
other distributions.    Note the number of default workers = 8 +
number_of_cpus * 64 which is going to be a disaster as it will result in
one thread per disk/lun being started at the same time or the
max_number_of_workers.  Either of which will result in a high degree of
non-productive useless system contention on a machine with a significant
number of luns.
https://www.suse.com/support/kb/doc/?id=000019156

On Sun, Jun 6, 2021 at 1:16 AM heming.zhao@suse.com <heming.zhao@suse.com>
wrote:

> Hello David & Zdenek,
>
> I send this mail for a well known performance issue:
>   when system is attached huge numbers of devices. (ie. 1000+ disks),
>   the lvm2-pvscan@.service costs too much time and systemd is very easy to
>   time out, and enter emergency shell in the end.
>
> This performance topic had been discussed in there some times, and the
> issue was
> lasting for many years. From the lvm2 latest code, this issue still can't
> be fix
> completely. The latest code add new function _pvscan_aa_quick(), which
> makes the
> booting time largely reduce but still can's fix this issue utterly.
>
> In my test env, x86 qemu-kvm machine, 6vcpu, 22GB mem, 1015 pv/vg/lv,
> comparing
> with/without _pvscan_aa_quick() code, booting time reduce from "9min 51s"
> to
> "2min 6s". But after switching to direct activation, the booting time is
> 8.7s
> (for longest lvm2 services: lvm2-activation-early.service).
>
> The hot spot of event activation is dev_cache_scan, which time complexity
> is
> O(n^2). And at the same time, systemd-udev worker will generate/run
> lvm2-pvscan@.service on all detecting disks. So the overall is O(n^3).
>
> ```
> dev_cache_scan //order: O(n^2)
>   + _insert_dirs //O(n)
>   | if obtain_device_list_from_udev() true
>   |   _insert_udev_dir //O(n)
>   |
>   + dev_cache_index_devs //O(n)
>
> There are 'n' lvm2-pvscan@.service running: O(n)
> Overall: O(n) * O(n^2) => O(n^3)
> ```
>
> Question/topic:
> Could we find out a final solution to have a good performance & scale well
> under
> event-based activation?
>
> Maybe two solutions (Martin & I discussed):
>
> 1. During boot phase, lvm2 automatically swithes to direct activation mode
> ("event_activation = 0"). After booted, switch back to the event
> activation mode.
>
> Booting phase is a speical stage. *During boot*, we could "pretend" that
> direct
> activation (event_activation=0) is set, and rely on
> lvm2-activation-*.service
> for PV detection. Once lvm2-activation-net.service has finished, we could
> "switch on" event activation.
>
> More precisely: pvscan --cache would look at some file under /run,
> e.g. /run/lvm2/boot-finished, and quit immediately if the file doesn't
> exist
> (as if event_activation=0 was set). In lvm2-activation-net.service, we
> would add
> something like:
>
> ```
> ExecStartPost=/bin/touch /run/lvm2/boot-finished
> ```
>
> ... so that, from this point in time onward, "pvscan --cache" would _not_
> quit
> immediately any more, but run normally (assuming that the global
> event_activation setting is 1). This way we'd get the benefit of using the
> static activation services during boot (good performance) while still
> being able
> to react to udev events after booting has finished.
>
> This idea would be worked out with very few code changes.
> The result would be a huge step forward on booting time.
>
>
> 2. change lvm2-pvscan@.service running mode from parallel to serival.
>
> This idea looks a little weird, it goes the opposite trend of today's
> programming technologies: parallel programming on multi-cores.
>
> idea:
> the action of lvm2 scaning "/dev" is hard to change, the outside parallel
> lvm2-pvscan@.service could change from parallel to serial.
>
> For example, a running pvscan instance could set a "running" flag in tmpfs
> (ie.
> /run/lvm/) indicating that no other pvscan process should be called in
> parallel.
> If another pvscan is invoked and sees "running", it would create a
> "pending"
> flag, and quit. Any other pvscan process seeing the "pending" flag would
> just quit. If the first instance sees the "pending" flag, it would
> atomically remove "pending" and restart itself, in order to catch any
> device
> that might have appeared since the previous sysfs scan.
> In most condition, devices had been found by once pvscan scanning,
> then next time of pvscan scanning should work with order O(n), because the
> target device had been inserted internal cache tree already. and on
> overall,
> there is only a single pvscan process would be running at any given time.
>
> We could create a list of pending to-be-scanned devices then (might be
> directory
> entries in some tmpfs directory). On exit, pvscan could check this dir and
> restart if it's non-empty.
>
>
> Thanks
> Heming
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>

--000000000000ebabf605c41b834e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>This might be a sim=
pler way to control the number of threads at the same time.</div><div><br><=
/div><div>On large machines (cpu wise, memory wise and disk wise).=C2=A0=C2=
=A0 I have only seen lvm timeout when udev_children is set to default. =C2=
=A0 The default seems to be set wrong, and the default seemed to be tuned f=
or a case where a large number of the disks on the machine were going to be=
 timing out (or otherwise really really slow), so to support this case a hu=
ge number of threads was required..=C2=A0 =C2=A0 I found that with it set t=
o default on a close to 100 core machine that udev got about 87 minutes of =
time during the boot up (about 2 minutes).=C2=A0 Changing the number of chi=
ldren to =3D4 resulted in udev getting around 2-3 minutes in the same windo=
w, and actually resulted in a much faster boot up and a much more reliable =
boot up (no timeouts).=C2=A0=C2=A0 We experienced these timeouts on a numbe=
r of the larger machines (70 cores or more) before we debugged and determin=
ed what was going on.=C2=A0=C2=A0 It would appear that the udev threads on =
the giant machines with a lot of disk are overwhelming each other in some s=
ort of tight (either process creating system time or some other resource co=
nstraint) loop and causing contention and doing very little useful work.</d=
iv><div><br></div><div>Just an observation, this may have nothing to do wit=
h what you have going on, but what you are describing sounds very close to =
what I debugged.=C2=A0=C2=A0 We were doing &quot;ps axuwwS | grep -i udev&q=
uot; just after boot up to determine how much cpu time udev was getting dur=
ing boot up, and determined that as we lowered the children the time got le=
ss, and the boot up got faster and stopped timing out.=C2=A0 And since udev=
 was getting 90 minutes in an elapsed time of around 120 seconds, it had to=
 be using a significant number of threads during boot up.=C2=A0 I believe t=
hese same udev threads call the pvscans.<br></div><div><br></div><div>Below=
 is one case, but I know there are several other similar cases for other di=
stributions.=C2=A0=C2=A0=C2=A0 Note the number of default workers =3D 8 + n=
umber_of_cpus * 64 which is going to be a disaster as it will result in one=
 thread per disk/lun being started at the same time or the max_number_of_wo=
rkers.=C2=A0 Either of which will result in a high degree of non-productive=
 useless system contention on a machine with a significant number of luns.<=
br></div><div><a href=3D"https://www.suse.com/support/kb/doc/?id=3D00001915=
6">https://www.suse.com/support/kb/doc/?id=3D000019156</a></div></div></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Sun, Jun 6, 2021 at 1:16 AM <a href=3D"mailto:heming.zhao@suse.com">hem=
ing.zhao@suse.com</a> &lt;<a href=3D"mailto:heming.zhao@suse.com">heming.zh=
ao@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hello David &amp; Zdenek,<br>
<br>
I send this mail for a well known performance issue:<br>
=C2=A0 when system is attached huge numbers of devices. (ie. 1000+ disks),<=
br>
=C2=A0 the lvm2-pvscan@.service costs too much time and systemd is very eas=
y to<br>
=C2=A0 time out, and enter emergency shell in the end.<br>
<br>
This performance topic had been discussed in there some times, and the issu=
e was<br>
lasting for many years. From the lvm2 latest code, this issue still can&#39=
;t be fix<br>
completely. The latest code add new function _pvscan_aa_quick(), which make=
s the<br>
booting time largely reduce but still can&#39;s fix this issue utterly.<br>
<br>
In my test env, x86 qemu-kvm machine, 6vcpu, 22GB mem, 1015 pv/vg/lv, compa=
ring<br>
with/without _pvscan_aa_quick() code, booting time reduce from &quot;9min 5=
1s&quot; to<br>
&quot;2min 6s&quot;. But after switching to direct activation, the booting =
time is 8.7s<br>
(for longest lvm2 services: lvm2-activation-early.service).<br>
<br>
The hot spot of event activation is dev_cache_scan, which time complexity i=
s<br>
O(n^2). And at the same time, systemd-udev worker will generate/run<br>
lvm2-pvscan@.service on all detecting disks. So the overall is O(n^3).<br>
<br>
```<br>
dev_cache_scan //order: O(n^2)<br>
=C2=A0 + _insert_dirs //O(n)<br>
=C2=A0 | if obtain_device_list_from_udev() true<br>
=C2=A0 |=C2=A0 =C2=A0_insert_udev_dir //O(n)<br>
=C2=A0 |<br>
=C2=A0 + dev_cache_index_devs //O(n)<br>
<br>
There are &#39;n&#39; lvm2-pvscan@.service running: O(n)<br>
Overall: O(n) * O(n^2) =3D&gt; O(n^3)<br>
```<br>
<br>
Question/topic:<br>
Could we find out a final solution to have a good performance &amp; scale w=
ell under<br>
event-based activation?<br>
<br>
Maybe two solutions (Martin &amp; I discussed):<br>
<br>
1. During boot phase, lvm2 automatically swithes to direct activation mode<=
br>
(&quot;event_activation =3D 0&quot;). After booted, switch back to the even=
t activation mode.<br>
<br>
Booting phase is a speical stage. *During boot*, we could &quot;pretend&quo=
t; that direct<br>
activation (event_activation=3D0) is set, and rely on lvm2-activation-*.ser=
vice<br>
for PV detection. Once lvm2-activation-net.service has finished, we could<b=
r>
&quot;switch on&quot; event activation.<br>
<br>
More precisely: pvscan --cache would look at some file under /run,<br>
e.g. /run/lvm2/boot-finished, and quit immediately if the file doesn&#39;t =
exist<br>
(as if event_activation=3D0 was set). In lvm2-activation-net.service, we wo=
uld add<br>
something like:<br>
<br>
```<br>
ExecStartPost=3D/bin/touch /run/lvm2/boot-finished<br>
```<br>
<br>
... so that, from this point in time onward, &quot;pvscan --cache&quot; wou=
ld _not_ quit<br>
immediately any more, but run normally (assuming that the global<br>
event_activation setting is 1). This way we&#39;d get the benefit of using =
the<br>
static activation services during boot (good performance) while still being=
 able<br>
to react to udev events after booting has finished.<br>
<br>
This idea would be worked out with very few code changes.<br>
The result would be a huge step forward on booting time.<br>
<br>
<br>
2. change lvm2-pvscan@.service running mode from parallel to serival.<br>
<br>
This idea looks a little weird, it goes the opposite trend of today&#39;s<b=
r>
programming technologies: parallel programming on multi-cores.<br>
<br>
idea:<br>
the action of lvm2 scaning &quot;/dev&quot; is hard to change, the outside =
parallel<br>
lvm2-pvscan@.service could change from parallel to serial.<br>
<br>
For example, a running pvscan instance could set a &quot;running&quot; flag=
 in tmpfs (ie.<br>
/run/lvm/) indicating that no other pvscan process should be called in para=
llel.<br>
If another pvscan is invoked and sees &quot;running&quot;, it would create =
a &quot;pending&quot;<br>
flag, and quit. Any other pvscan process seeing the &quot;pending&quot; fla=
g would<br>
just quit. If the first instance sees the &quot;pending&quot; flag, it woul=
d<br>
atomically remove &quot;pending&quot; and restart itself, in order to catch=
 any device<br>
that might have appeared since the previous sysfs scan.<br>
In most condition, devices had been found by once pvscan scanning,<br>
then next time of pvscan scanning should work with order O(n), because the<=
br>
target device had been inserted internal cache tree already. and on overall=
,<br>
there is only a single pvscan process would be running at any given time.<b=
r>
<br>
We could create a list of pending to-be-scanned devices then (might be dire=
ctory<br>
entries in some tmpfs directory). On exit, pvscan could check this dir and<=
br>
restart if it&#39;s non-empty.<br>
<br>
<br>
Thanks<br>
Heming<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=3D"no=
referrer" target=3D"_blank">https://listman.redhat.com/mailman/listinfo/lin=
ux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
<br>
</blockquote></div>

--000000000000ebabf605c41b834e--

--===============5387544700708904976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============5387544700708904976==--

