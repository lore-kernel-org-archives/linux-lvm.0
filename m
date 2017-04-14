Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAB851749F
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2017 16:09:01 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D11FAC0467CF
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2017 16:08:59 +0000 (UTC)
Received: from elissa.gathman.org (h.elissa.gathman.org
	[IPv6:fc37:2c50:7583:e01a:8c69:8f50:8dcf:a076])
	(authenticated bits=0)
	by mail.gathman.org (8.14.4/8.14.4) with ESMTP id v3EG6jQT026351
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2017 12:06:45 -0400
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
	<58E7992A.4030000@tlinx.org>
	<dc7ab70743a92705e6be6fefab2d29d0@assyoma.it>
	<ece5d455-87e7-5d7c-18a4-a51355f28307@gathman.org>
	<062fccc39afe128ef5950634309a01ea@assyoma.it>
	<783965ccb392bea2faded10436cdaf39@xenhideout.nl>
	<0658b33a7d4e5494de71231b7343a514@assyoma.it>
From: Stuart Gathman <stuart@gathman.org>
Message-ID: <f499d2a7-65f2-b66c-8753-7c6c0bc6757f@gathman.org>
Date: Fri, 14 Apr 2017 12:08:58 -0400
MIME-Version: 1.0
In-Reply-To: <0658b33a7d4e5494de71231b7343a514@assyoma.it>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On 04/14/2017 11:53 AM, Gionatan Danti wrote:
>
> Yeah, I understand that. In that sentence, I was speaking about
> classic LVM snapshot.
>
> The dilemma is:
> - classic LVM snapshots have low performance (but adequate for backup
> purpose) and, if growing too much, snapshot activation can be
> problematic (especially on boot);
> - thin-snapshots have much better performance but does not always fail
> gracefully (ie: pool full).
>
> For nightly backups, what you would pick between the two? 
You've summarized it nicely.  I currently stick with classic snapshots
for nightly backups with smallish CoW (so in case backup somehow fails
to remove the snapshot, production performance doesn't suffer).

The failure model for classic snapshots is that if the CoW fills, the
snapshot is invalid (both read and write return IOerror), but otherwise
the system keeps humming along smoothly (with no more performance
penalty on the source volume). 

Before putting production volumes in a thinpool, the failure model needs
to be sane.  However much the admin is enjoined to never let the pool be
empty - it *will* happen.  Having the entire pool freeze in readonly
mode (without crashing the kernel) would be an acceptable failure mode. 
A more complex failure mode would be to have the other volumes in the
pool keep operating until they need a new extent - at which point they
too freeze.

With a readonly frozen pool, even in the case where metadata is also
full (so you can't add new extents), you can still add new storage and
copy logical volumes to a new pool (with more generous metadata and
chunk sizes).

It is not LVMs problem if the system crashes because a filesystem can't
handle a volume suddenly going readonly.  All filesystems used in a
thinpool should be able to handle that situation.
