Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2QD3C2x018043
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2012 09:03:12 -0400
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe005.messaging.microsoft.com [216.32.181.185])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2QD33dK003655
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2012 09:03:06 -0400
Received: from mail85-ch1 (localhost [127.0.0.1])	by mail85-ch1-R.bigfish.com
	(Postfix) with ESMTP id 28721802A0	for <linux-lvm@redhat.com>;
	Mon, 26 Mar 2012 13:02:51 +0000 (UTC)
Received: from CH1EHSMHS021.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.238])	by mail85-ch1.bigfish.com (Postfix) with ESMTP id
	9A7943C02AA
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2012 13:02:49 +0000 (UTC)
From: James Candelaria <jc@whiptailtech.com>
Date: Mon, 26 Mar 2012 13:02:58 +0000
Message-ID: <33016A114D6EF84EB47C507EA7AFCC5703FC8D@SN2PRD0802MB113.namprd08.prod.outlook.com>
References: <4F6ECF9B.40907@nuclearwinter.com>
In-Reply-To: <4F6ECF9B.40907@nuclearwinter.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM commands extremely slow during raid check/resync
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Larkin,

This is likely due to the way the scheduler and MD driver are interacting.  The MD driver has likely filled the queue of the devices pretty deep with read requests, then when you attempt to run a LVM command such as lvcreate your request gets inserted.  You must "wait-in-line" for this command (likely only a few sectors worth of IO) to get its turn on the media.  The MD driver realizes that there is another request to the media and slows itself briefly, but since there is no further IO after the LVM command it then goes back to its job of resyncing your array in earnest.

James


-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Larkin Lowrey
Sent: Sunday, March 25, 2012 3:56 AM
To: linux-lvm@redhat.com
Subject: [linux-lvm] LVM commands extremely slow during raid check/resync

I've been suffering from an extreme slowdown of the various lvm commands
during high I/O load ever since updating from Fedora 15 to 16.

I notice this particularly Sunday AMs when Fedora kicks of a raid-check.
What is normally near instantaneous, commands like lvs and lvcreate
--snapshot take minutes to complete (literally). This causes my backup
jobs to timeout and fail.

While all this is going on, the various filesystems are reasonably
responsive (considering the raid-check is running) and I can read/write
to files without problems. It seems that this slow-down is unique to lvm.

I have three raid 5 arrays of 8, 6, and 6 drives. The root fs sits
entirely within the 8 disk array as does the spare area used for snapshots.

Interestingly, perhaps, if I can coax a backup into running, the lvs
command, for example, will complete in just 15-30 seconds instead of
120-180s. It would seem that the random I/O of the backup is able to
break things up enough for the lvm commands to squeeze in.

I'm at a loss for what to do about this or what data to scan for clues.
Any suggestions?

kernel 3.2.10-3.fc16.x86_64

lvm> version
  LVM version:     2.02.86(2) (2011-07-08)
  Library version: 1.02.65 (2011-07-08)
  Driver version:  4.22.0

--Larkin

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
