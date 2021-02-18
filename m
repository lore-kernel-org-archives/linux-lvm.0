Return-Path: <SRS0=/SaV=HV=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F283C433DB
	for <linux-lvm@archiver.kernel.org>; Fri, 19 Feb 2021 08:18:20 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 886C560C3D
	for <linux-lvm@archiver.kernel.org>; Fri, 19 Feb 2021 08:18:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 886C560C3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-kVwLWZ49No6z4l8bSasZxA-1; Fri, 19 Feb 2021 03:18:16 -0500
X-MC-Unique: kVwLWZ49No6z4l8bSasZxA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5572803F4B;
	Fri, 19 Feb 2021 08:18:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9ACF6267C;
	Fri, 19 Feb 2021 08:18:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B01CA57DFA;
	Fri, 19 Feb 2021 08:17:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11IFJ93p003484 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 18 Feb 2021 10:19:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0A402209AD86; Thu, 18 Feb 2021 15:19:09 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 059D12018650
	for <linux-lvm@redhat.com>; Thu, 18 Feb 2021 15:19:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EB06100AF65
	for <linux-lvm@redhat.com>; Thu, 18 Feb 2021 15:19:06 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-25-J3L12T1aP3K3oGXkGKLkmw-1;
	Thu, 18 Feb 2021 10:19:04 -0500
X-MC-Unique: J3L12T1aP3K3oGXkGKLkmw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8FB8DAF69;
	Thu, 18 Feb 2021 15:19:02 +0000 (UTC)
Message-ID: <ea269d6255c4cd48bb60771aa7e4204e4f70db8a.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Christian Hesse <list@eworm.de>
Date: Thu, 18 Feb 2021 16:19:01 +0100
In-Reply-To: <20210217133826.u4gglfsowqfvxdff@spock.localdomain>
References: <20210211111623.34968-1-list@eworm.de>
	<f18dff7a-050a-d41d-c643-4616522ba4a0@suse.com>
	<ae893a3606dd32b07cab16bd538c132af555c956.camel@suse.com>
	<20210217130329.7de41147@leda>
	<20210217133826.u4gglfsowqfvxdff@spock.localdomain>
User-Agent: Evolution 3.38.2
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11IFJ93p003484
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Fri, 19 Feb 2021 03:17:49 -0500
Cc: Oleksandr Natalenko <oleksandr@redhat.com>, LVM,
	Heming Zhao <heming.zhao@suse.com>,
	development <linux-lvm@e1890.dsca.akamaiedge.net>
Subject: Re: [linux-lvm] [PATCH 1/1] pvscan: wait for udevd
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-02-17 at 14:38 +0100, Oleksandr Natalenko wrote:
> Hi.
>=20

Thanks for the logs!

> I'm not sure this issue is reproducible with any kind of LVM layout.
> What I have is thin-LVM-on-LUKS-on-LVM:

I saw MD in your other logs...?

More comments below.

> With regard to the journal, here it is (from the same machine in the
> Arch bugreport; matches the second layout above):
>=20
>=20
> [~]> LC_TIME=3DC sudo journalctl -b -10 -u lvm2-pvscan@\*
> -- Journal begins at Fri 2020-12-18 16:33:22 CET, ends at Wed 2021-
> 02-17 14:28:05 CET. --
> Feb 10 17:24:17 archlinux systemd[1]: Starting LVM event activation
> on device 9:0...
> Feb 10 17:24:17 archlinux lvm[463]:=A0=A0 pvscan[463] PV /dev/md0 online,
> VG base is complete.
> Feb 10 17:24:17 archlinux lvm[463]:=A0=A0 pvscan[463] VG base run
> autoactivation.
> Feb 10 17:24:17 archlinux lvm[463]:=A0=A0 2 logical volume(s) in volume
> group "base" now active
> Feb 10 17:24:17 archlinux systemd[1]: Finished LVM event activation
> on device 9:0.
> Feb 10 17:24:26 archlinux systemd[1]: Starting LVM event activation
> on device 253:2...
> Feb 10 17:24:26 archlinux lvm[643]:=A0=A0 pvscan[643] PV /dev/mapper/sys
> online, VG sys is complete.

All good up to here, but then...

> Feb 10 17:24:26 archlinux lvm[643]:=A0=A0 pvscan[643] VG sys run
> autoactivation.
> Feb 10 17:24:26 archlinux lvm[643]:=A0=A0 /usr/bin/dmeventd: stat failed:
> No such file or directory

What's going on here? pvscan trying to start dmeventd ? Why ? There's a
dedicated service for starting dmeventd (lvm2-monitor.service). I can
see that running dmeventd makes sense as you have thin pools, but I'm
at a loss why it has to be started at that early stage during boot
already.

This is a curious message, it looks as if pvscan was running from an
environment (initramfs??) where dmeventd wasn't available. The message
is repeated, and after that, pvscan appears to hang...


> Feb 10 17:24:26 archlinux lvm[643]:=A0=A0 /usr/bin/dmeventd: stat failed:
> No such file or directory
> Feb 10 17:24:26 archlinux lvm[643]:=A0=A0 WARNING: Failed to monitor
> sys/pool.
> Feb 10 17:24:26 archlinux systemd[1]: Stopping LVM event activation
> on device 9:0...

Here I suppose systemd is switching root, and trying to stop jobs,
including the pvscan job.


> Feb 10 17:24:26 archlinux lvm[720]:=A0=A0 pvscan[720] PV /dev/md0 online.
> Feb 10 17:24:26 archlinux lvm[643]:=A0=A0 /usr/bin/dmeventd: stat failed:
> No such file or directory
> Feb 10 17:24:26 archlinux lvm[643]:=A0=A0 WARNING: Failed to monitor
> sys/pool.
> Feb 10 17:24:56 spock systemd[1]: lvm2-pvscan@253:2.service: State
> 'stop-sigterm' timed out. Killing.
> Feb 10 17:24:56 spock systemd[1]: lvm2-pvscan@253:2.service: Killing
> process 643 (lvm) with signal SIGKILL.
> Feb 10 17:24:56 spock systemd[1]: lvm2-pvscan@253:2.service: Main
> process exited, code=3Dkilled, status=3D9/KILL
> Feb 10 17:24:56 spock systemd[1]: lvm2-pvscan@253:2.service: Failed
> with result 'timeout'.
> Feb 10 17:24:56 spock systemd[1]: Stopped LVM event activation on
> device 253:2.

So what's timing out here is the attempt to _stop_ pvscan. That's
curious. It looks like a problem in pvscan to me, not having reacted to
a TERM signal for 30s.

It's also worth noting that the parallel pvscan process for device 9:0
terminated correctly (didn't hang).

>=20
> [~]> LC_TIME=3DC sudo journalctl -b -10 --grep pvscan
> -- Journal begins at Fri 2020-12-18 16:33:22 CET, ends at Wed 2021-
> 02-17 14:31:27 CET. --
> Feb 10 17:24:17 archlinux systemd[1]: Created slice system-
> lvm2\x2dpvscan.slice.
> Feb 10 17:24:17 archlinux lvm[463]:=A0=A0 pvscan[463] PV /dev/md0 online,
> VG base is complete.
> Feb 10 17:24:17 archlinux lvm[463]:=A0=A0 pvscan[463] VG base run
> autoactivation.
> Feb 10 17:24:17 archlinux audit[1]: SERVICE_START pid=3D1 uid=3D0
> auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dlvm2-pvscan@9:0
> comm=3D"systemd" exe=3D"/init" hostname=3D? addr=3D? terminal=3D? res=3Ds=
uccess'
> Feb 10 17:24:17 archlinux kernel: audit: type=3D1130
> audit(1612974257.986:6): pid=3D1 uid=3D0 auid=3D4294967295 ses=3D42949672=
95=20
> msg=3D'unit=3Dlvm2-pvscan@9:0 comm=3D"systemd" exe=3D"/init" hostname=3D?
> addr=3D? terminal=3D? res=3Dsuccess'
> Feb 10 17:24:26 archlinux lvm[643]:=A0=A0 pvscan[643] PV /dev/mapper/sys
> online, VG sys is complete.
> Feb 10 17:24:26 archlinux lvm[643]:=A0=A0 pvscan[643] VG sys run
> autoactivation.
> Feb 10 17:24:26 archlinux lvm[720]:=A0=A0 pvscan[720] PV /dev/md0 online.
> Feb 10 17:24:27 spock systemd[1]: lvm2-pvscan@9:0.service: Control
> process exited, code=3Dkilled, status=3D15/TERM
> Feb 10 17:24:27 spock systemd[1]: lvm2-pvscan@9:0.service: Failed
> with result 'signal'.
> Feb 10 17:24:26 spock audit[1]: SERVICE_STOP pid=3D1 uid=3D0
> auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dlvm2-pvscan@9:0
> comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D?
> terminal=3D? res=3Dfailed'
> Feb 10 17:24:27 spock systemd[1]: Requested transaction contradicts
> existing jobs: Transaction for lvm2-pvscan@253:2.service/start is
> destructive (lvm2-pvscan@253:2.service has 'stop' job queued, but
> 'start' is included in transaction).

This one is curious, too. Apparently systemd is done switching root,
while the pvscan service from the initrd is still hanging, so the
"stop" job for it isn't finished. This looks like a problem in systemd
to me. It shouldn't have proceeded with switching root before
sucessfully terminating pvscan.


> Feb 10 17:24:27 spock systemd[1]: sys-devices-virtual-block-
> dm\x2d2.device: Failed to enqueue SYSTEMD_WANTS=3D job, ignoring:
> Transaction for lvm2-pvscan@253:2.service/start is destructive
> (lvm2-pvscan@253:2.service has 'stop' job queued, but 'start' is
> included in transaction).

So systemd doesn't enqueue another pvscan job for this device because=20
the old one isn't stopped yet. Looks fishy, again.

>=20
> FWIW, here's what it looks like now, after adding the "After=3D" fix:
> [~]> LC_TIME=3DC sudo journalctl -b -u lvm2-pvscan@\*
> -- Journal begins at Fri 2020-12-18 16:33:22 CET, ends at Wed 2021-
> 02-17 14:29:15 CET. --
> Feb 16 22:13:27 archlinux systemd[1]: Starting LVM event activation
> on device 9:0...
> Feb 16 22:13:27 archlinux lvm[495]:=A0=A0 pvscan[495] PV /dev/md0 online,
> VG base is complete.
> Feb 16 22:13:27 archlinux lvm[495]:=A0=A0 pvscan[495] VG base run
> autoactivation.
> Feb 16 22:13:27 archlinux lvm[495]:=A0=A0 2 logical volume(s) in volume
> group "base" now active
> Feb 16 22:13:28 archlinux systemd[1]: Finished LVM event activation
> on device 9:0.
> Feb 16 22:13:37 archlinux systemd[1]: Starting LVM event activation
> on device 253:2...
> Feb 16 22:13:37 archlinux lvm[665]:=A0=A0 pvscan[665] PV /dev/mapper/sys
> online, VG sys is complete.
> Feb 16 22:13:37 archlinux lvm[665]:=A0=A0 pvscan[665] VG sys run
> autoactivation.
> Feb 16 22:13:37 archlinux lvm[665]:=A0=A0 /usr/bin/dmeventd: stat failed:
> No such file or directory
> Feb 16 22:13:37 archlinux lvm[665]:=A0=A0 WARNING: Failed to monitor
> sys/pool.
> Feb 16 22:13:37 archlinux lvm[665]:=A0=A0 /usr/bin/dmeventd: stat failed:
> No such file or directory
> Feb 16 22:13:37 archlinux lvm[665]:=A0=A0 WARNING: Failed to monitor
> sys/pool.
> Feb 16 22:13:37 archlinux lvm[665]:=A0=A0 /usr/bin/dmeventd: stat failed:
> No such file or directory
> Feb 16 22:13:37 archlinux lvm[665]:=A0=A0 WARNING: Failed to monitor
> sys/pool.
> Feb 16 22:13:37 archlinux lvm[665]:=A0=A0 /usr/bin/dmeventd: stat failed:
> No such file or directory
> Feb 16 22:13:37 archlinux lvm[665]:=A0=A0 WARNING: Failed to monitor
> sys/pool.
> Feb 16 22:13:37 archlinux lvm[665]:=A0=A0 /usr/bin/dmeventd: stat failed:
> No such file or directory
> Feb 16 22:13:37 archlinux lvm[665]:=A0=A0 WARNING: Failed to monitor
> sys/pool.
> Feb 16 22:13:37 archlinux lvm[665]:=A0=A0 /usr/bin/dmeventd: stat failed:
> No such file or directory
> Feb 16 22:13:37 archlinux lvm[665]:=A0=A0 WARNING: Failed to monitor
> sys/pool.
> Feb 16 22:13:37 archlinux systemd[1]: Stopping LVM event activation
> on device 9:0...
> Feb 16 22:13:37 archlinux lvm[743]:=A0=A0 pvscan[743] PV /dev/md0 online.
> Feb 16 22:13:37 archlinux lvm[665]:=A0=A0 /usr/bin/dmeventd: stat failed:
> No such file or directory
> Feb 16 22:13:37 archlinux lvm[665]:=A0=A0 WARNING: Failed to monitor
> sys/pool.
> Feb 16 22:13:37 archlinux lvm[665]:=A0=A0 8 logical volume(s) in volume
> group "sys" now active
> Feb 16 22:13:37 archlinux systemd[1]: lvm2-pvscan@9:0.service:
> Succeeded.
> Feb 16 22:13:37 archlinux systemd[1]: Stopped LVM event activation on
> device 9:0.
> Feb 16 22:13:37 archlinux systemd[1]: lvm2-pvscan@253:2.service: Main
> process exited, code=3Dkilled, status=3D15/TERM
> Feb 16 22:13:37 archlinux systemd[1]: lvm2-pvscan@253:2.service:
> Failed with result 'signal'.
> Feb 16 22:13:37 archlinux systemd[1]: Stopped LVM event activation on
> device 253:2.

We have the same error messages about dmeventd as before. But unlike
before, pvscan was successfully terminated this time.

I think this is the explanation: with the "After=3D", systemd kills
pvscan first and then udevd. Wihtout the "After=3D", it may kill them
both at once, and that might have caused pvscan to hang and not
terminate cleanly. Apparently it was still waiting for some udev-
related action to complete.

Thanks
Martin



_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

