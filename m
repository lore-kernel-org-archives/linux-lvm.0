Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 013D360BF1
	for <linux-lvm@redhat.com>; Sat, 15 Apr 2017 23:35:21 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0FE8B4E4C8
	for <linux-lvm@redhat.com>; Sat, 15 Apr 2017 23:35:18 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.signet.nl (Postfix) with ESMTP id 611374102F49
	for <linux-lvm@redhat.com>; Sun, 16 Apr 2017 01:35:16 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sun, 16 Apr 2017 01:35:16 +0200
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
Message-ID: <ba5da002d8326af85fb3ccd88b58f64b@xenhideout.nl>
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

> http://www.xenhideout.nl/scripts/snapshot-check.sh.txt

My script now does thin pool reporting, at least for the data volume 
that I could check (tpool).

:p.

It can create messages such as this :p.



Thin is currently at 80%.

Log messages:

Apr 16 00:00:12 perfection lvm[463]: Thin linux-thin-tpool is now 80% 
full.
Apr 15 18:10:42 perfection lvm[463]: Thin linux-thin-tpool is now 95% 
full.
Apr 15 18:10:22 perfection lvm[463]: Thin linux-thin-tpool is now 92% 
full.

Previous messages:

Apr 15 14:38:12 perfection lvm[463]: Thin linux-thin-tpool is now 85% 
full.
Apr 15 14:37:12 perfection lvm[463]: Thin linux-thin-tpool is now 80% 
full.


The cursor of journalctl was at the 85% mark; that is why an earlier 
invocation would have shown the last 2 messages, while in this sense in 
this invocation the above three would be displayed and found.

(I copied an older cursor file over the cursor location).

So it shows all new messages when there is something new to be shown and 
it uses the occasion to also remind you of older messages.

Still working on something better...

But this is already quite nice.

Basically it sends 3 types of emails:

- snapshot filling up
- snapshot filled up completely
- thin pool filling up

But it only responds to dmevent messages in syslog. Of course you could 
take the opportunity to give much more detailed information which is 
what I am working on but this does require invocations of lvs etc.
