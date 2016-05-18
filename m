Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4HNoDu7001759
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 17 May 2016 19:50:13 -0400
Received: from friday.buadh-brath.com (drochaid.buadh-brath.com
	[45.33.103.245])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D89FC049D7F
	for <linux-lvm@redhat.com>; Tue, 17 May 2016 23:50:12 +0000 (UTC)
Received: from 107-138-158-92.lightspeed.rlghnc.sbcglobal.net
	([107.138.158.92] helo=bdmcc-us.com)
	by friday.buadh-brath.com with esmtp (Exim 4.80)
	(envelope-from <bdmc@bdmcc-us.com>) id 1b2oUZ-0008Oi-PY
	for linux-lvm@redhat.com; Tue, 17 May 2016 23:33:35 +0000
Received: from localhost (mail.bdmcc-us.com [192.168.1.133])
	by bdmcc-us.com (Postfix) with ESMTP id 966CB1820FA
	for <linux-lvm@redhat.com>; Tue, 17 May 2016 20:22:35 -0400 (EDT)
Date: Tue, 17 May 2016 20:22:34 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
Message-ID: <20160518002234.GA13276@bdmcc-us.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Unable to find device with UUID XXX.
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

I have an issue that I hope that the group can save me from.

I have found the Thin discussions interesting, but I am still doing the
Thick thing.


OK, I had a drive that started to cause problems, would not boot without
fsck, etc., and decided to replace it using pvmove.

I made myself a CD with SystemRescueCD ( sp? ) and booted the system
with that.

I attached the new drive to the system before I booted.  It had no PVs
on it, but a set of partitions ( GPT table ) ready to be assigned.

( skipping a couple of steps )

I ran pvmove for about half of the PVs on the drive that was failing,
sending them to the new drive.  All seemed to be well.

THEN, the data cable on the old drive ( USB 3 ) was disturbed, and
pvmove stopped, complaining that it couldn't see the drive.  OK, I can
fix this.  I plugged the cable back in, but things didn't seem to be any
better.

I stopped the system, and rebooted.

I have rebooted several times, with not completely consistent results.

A couple of times it stopped when it said that it was loading the MD
drivers.

When I seem to have got the system booted properly, I do a pvs and it
complains about missing UUIDs.

I did a "pvscan -u" and thought that I was seeing the UUIDs in the
bottom part of the display, after it had complained about the missing
ones, but I think that I was just seeing what it wanted to see, not what
it was actually finding.

At this point, I seem to be dead in the water, and can't resume the
pvmove process.

Can you guide me back to the light, and help me finish what I started to
do, so that I can get this machine back to work?


Thank you,
Brian
