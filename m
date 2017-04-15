Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6F061803B
	for <linux-lvm@redhat.com>; Sat, 15 Apr 2017 08:27:51 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 82BD251EE6
	for <linux-lvm@redhat.com>; Sat, 15 Apr 2017 08:27:48 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.signet.nl (Postfix) with ESMTP id BFE8540F377F
	for <linux-lvm@redhat.com>; Sat, 15 Apr 2017 10:27:46 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 15 Apr 2017 10:27:46 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <3e09a763ff22db4c39ae376760f5cd73@xenhideout.nl>
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
Message-ID: <2171c32fdcf8a4322845f4848c295b2c@xenhideout.nl>
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

Xen schreef op 14-04-2017 19:36:

> I'm sorry, I was trying to discover how to use journalctl to check for
> the message and it is just incredibly painful.

So this is how you find out the messages of a certain program by 
journalctl:

journalctl SYSLOG_IDENTIFIER=lvm

So user friendly ;-).

Then you need to mimick the behaviour of logtail and write your own 
program for it.

You can save the cursor in journalctl so as to do that.

journalctl SYSLOG_IDENTIFIER=lvm --show-cursor

and then use it with --cursor or --after-cursor, but I have no clue what 
the difference is.

I created a script to be run as a cron job that will email root in a 
pretty nice message.

http://www.xenhideout.nl/scripts/snapshot-check.sh.txt

I only made it for regular snapshot messages currently though, I have 
not yet seen fit to test the messages that 
libdevmapper-event-lvm2thin.so produces.

But this is the format you can expect:


Snapshot linux/root-snap has been unmounted from /srv/root.

Log message:

Apr 14 21:11:01 perfection lvm[463]: Unmounting invalid snapshot 
linux-root--snap from /srv/root.

Earlier messages:

Apr 14 19:25:31 perfection lvm[463]: Snapshot linux-root--snap is now 
81% full.
Apr 14 19:25:41 perfection lvm[463]: Snapshot linux-root--snap is now 
86% full.
Apr 14 21:10:51 perfection lvm[463]: Snapshot linux-root--snap is now 
93% full.
Apr 14 21:11:01 perfection lvm[463]: Snapshot linux-root--snap is now 
97% full.


I haven't yet fully tested everything but it saves the cursor in 
/run/lvm/lastlog ;-), and will not produce output when there is nothing 
new. It will not produce any output when run as a cron job and it will 
produce status messages when run interactively.

It has options like:
   -c : clear the cursor
   -u : update the cursor and nothing else
   -d : dry-run
   --help

There is not yet an option to send the email to stdout but if you botch 
up the script or emailing fails it will put the email to stderr so cron 
will pick it up.

I guess the next option is to not send an email or to send it to stdout 
instead (also picked up by cron normally).

In any case I assume current LVM already has ways of running scripts, 
but that depends on dmeventd....

So you could have different actions in the script as well and have it 
run other scripts.

Currently the action is simply to email...

Once I have tested thin fillup I will put that in too :p.

Regards.
