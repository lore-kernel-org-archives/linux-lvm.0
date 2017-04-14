Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C56B5DD71
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2017 17:36:37 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 10E3C6AAEC
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2017 17:36:35 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.signet.nl (Postfix) with ESMTP id 2751E40D25D3
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2017 19:36:33 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 14 Apr 2017 19:36:33 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <0658b33a7d4e5494de71231b7343a514@assyoma.it>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
	<58E7992A.4030000@tlinx.org>
	<dc7ab70743a92705e6be6fefab2d29d0@assyoma.it>
	<ece5d455-87e7-5d7c-18a4-a51355f28307@gathman.org>
	<062fccc39afe128ef5950634309a01ea@assyoma.it>
	<783965ccb392bea2faded10436cdaf39@xenhideout.nl>
	<0658b33a7d4e5494de71231b7343a514@assyoma.it>
Message-ID: <88a2badd9b77546407bba31778c00699@xenhideout.nl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Gionatan Danti schreef op 14-04-2017 17:53:
> Il 14-04-2017 17:23 Xen ha scritto:
>> A thin snapshot won't be dropped. It is allocated with the same size
>> as the origin volume and hence can never fill up.
>> 
>> Only the pool itself can fill up but unless you have some monitoring
>> software in place that can intervene in case of anomaly and kill the
>> snapshot, your system will or may simply freeze and not drop anything.
>> 
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
> Thanks.

Oh, I'm sorry, I couldn't understand your message in that way.

I have a not very busy hobby server of sorts creating a snapshot every 
day, mounting it and exporting it via NFS with some backup host that 
will pull from it if everything keeps working ;-).

When I created the thing I thought that 1GB snapshot space would be 
enough; there should not be many logs and everything worth something is 
sitting on other partitions; so this is only the root volume and the 
/var/log directory so to speak.

To my surprise regularly the update script emails me that when it 
removed the root snapshot, it was not mounted.

When I log on during the day the snapshot is already half filled. I do 
not know what causes this. I cannot find any logs or anything else that 
would warrant such behaviour. But the best part of it all, is that the 
system never suffers.

The thing is just dismounted apparently; I don't even know what causes 
it.

The other volumes are thin. I am just very afraid of the thing filling 
up due to some runaway process or an error on my part.

If I have a 30GB volume and a 30GB snapshot of that volume, and if this 
volume is nearly empty and something starts filling it up, it will do 
twice the writes to the thin pool. Any damage done is doubled.

The only thing that could save you (me) at this point is a process 
instantly responding to some 90% full message and hoping it'd be in 
time. Of course I don't have this monitoring in place; everything 
requires work.

This is someone having written a script for Nagios:

https://exchange.nagios.org/directory/Plugins/Operating-Systems/Linux/check_lvm/details

Then someone else did the same for NewRelic:

https://discuss.newrelic.com/t/lvm-thin-pool-monitoring/29295/17

My version of LVM indicates only the following:

     # snapshot_library is the library used when monitoring a snapshot 
device.
     #
     # "libdevmapper-event-lvm2snapshot.so" monitors the filling of
     # snapshots and emits a warning through syslog when the use of
     # the snapshot exceeds 80%. The warning is repeated when 85%, 90% 
and
     # 95% of the snapshot is filled.

     snapshot_library = "libdevmapper-event-lvm2snapshot.so"

     # thin_library is the library used when monitoring a thin device.
     #
     # "libdevmapper-event-lvm2thin.so" monitors the filling of
     # pool and emits a warning through syslog when the use of
     # the pool exceeds 80%. The warning is repeated when 85%, 90% and
     # 95% of the pool is filled.

     thin_library = "libdevmapper-event-lvm2thin.so"

I'm sorry, I was trying to discover how to use journalctl to check for 
the message and it is just incredibly painful.
