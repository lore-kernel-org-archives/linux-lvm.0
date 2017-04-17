Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C19CF7EBD6
	for <linux-lvm@redhat.com>; Mon, 17 Apr 2017 12:33:41 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B04AD83F3E
	for <linux-lvm@redhat.com>; Mon, 17 Apr 2017 12:33:37 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.signet.nl (Postfix) with ESMTP id EBFD6404C63A
	for <linux-lvm@redhat.com>; Mon, 17 Apr 2017 14:33:35 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 17 Apr 2017 14:33:35 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <2171c32fdcf8a4322845f4848c295b2c@xenhideout.nl>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
	<58E7992A.4030000@tlinx.org>
	<dc7ab70743a92705e6be6fefab2d29d0@assyoma.it>
	<ece5d455-87e7-5d7c-18a4-a51355f28307@gathman.org>
	<062fccc39afe128ef5950634309a01ea@assyoma.it>
	<783965ccb392bea2faded10436cdaf39@xenhideout.nl>
	<0658b33a7d4e5494de71231b7343a514@assyoma.it>
	<88a2badd9b77546407bba31778c00699@xenhideout.nl>
	<341979ccda1b2ee7cb5242006f1b03c8@assyoma.it>
	<3e09a763ff22db4c39ae376760f5cd73@xenhideout.nl>
	<2171c32fdcf8a4322845f4848c295b2c@xenhideout.nl>
Message-ID: <546bfa4b63c8cdae33aa186dba9c1031@xenhideout.nl>
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

Xen schreef op 15-04-2017 10:27:

> I created a script to be run as a cron job that will email root in a
> pretty nice message.
> 
> http://www.xenhideout.nl/scripts/snapshot-check.sh.txt

Just was so happy. I guess I can still improve the email, but:


Snapshot linux/root-snap has been unmounted from /srv/root because it 
filled up to a 100%.

Log message:

Apr 17 14:08:38 perfection lvm[463]: Unmounting invalid snapshot 
linux-root--snap from /srv/root.

Earlier messages:

Apr 17 14:08:21 perfection lvm[463]: Snapshot linux-root--snap is now 
96% full.
Apr 17 14:08:01 perfection lvm[463]: Snapshot linux-root--snap is now 
91% full.
Apr 17 14:07:51 perfection lvm[463]: Snapshot linux-root--snap is now 
86% full.
Apr 17 14:07:31 perfection lvm[463]: Snapshot linux-root--snap is now 
81% full.
-------------------------------------------------------------------------------
Apr 14 21:11:01 perfection lvm[463]: Snapshot linux-root--snap is now 
97% full.
Apr 14 21:10:51 perfection lvm[463]: Snapshot linux-root--snap is now 
93% full.
Apr 14 19:25:41 perfection lvm[463]: Snapshot linux-root--snap is now 
86% full.
Apr 14 19:25:31 perfection lvm[463]: Snapshot linux-root--snap is now 
81% full.


I was just upgrading packages hence the snapshot filled up quickly.


System works well. I don't get instant reports but if something happens 
within the space of 5 minutes it is too late anyway.

Only downside is that thin messages get repeated whenever snapshots are 
(re)created. So lvmetad will output new message for me at every 0:00. So 
if thin is > 80%, every day (for me) there is a new message for no 
reason in that sense.
