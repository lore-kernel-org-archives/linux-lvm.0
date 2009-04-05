Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n35DsDeF024496
	for <linux-lvm@redhat.com>; Sun, 5 Apr 2009 09:54:13 -0400
Received: from smtp178.iad.emailsrvr.com (smtp178.iad.emailsrvr.com
	[207.97.245.178])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n35DrtSJ007208
	for <linux-lvm@redhat.com>; Sun, 5 Apr 2009 09:53:55 -0400
Received: from relay7.relay.iad.mlsrvr.com (localhost [127.0.0.1])
	by relay7.relay.iad.mlsrvr.com (SMTP Server) with ESMTP id 61F4B1DA333
	for <linux-lvm@redhat.com>; Sun,  5 Apr 2009 09:53:55 -0400 (EDT)
Received: by relay7.relay.iad.mlsrvr.com (Authenticated sender:
	mfidelman-AT-traversetechnologies.com) with ESMTPSA id 41BBF1DA1E7
	for <linux-lvm@redhat.com>; Sun,  5 Apr 2009 09:53:55 -0400 (EDT)
Message-ID: <49D8B7F2.2030706@traversetechnologies.com>
Date: Sun, 05 Apr 2009 09:53:54 -0400
From: Miles Fidelman <mfidelman@traversetechnologies.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] rebuilding raided root volume
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi Folks,

I've been busily rebuilding from a crash, and running into a sticky 
problem - my root volume is an LVM2 LV, built on top of a LVM2 PV, which 
in turn is built on top of a raided array (md - RAID1 configuration).  
The machine has 4 SATA drives (2 channels, master/slave in each).

It was a funny crash - it first looked like a hardware failure 
corrupting two drives; turns out it was a single drive that failed in a 
way that it kept responding, but taking a VERY long time to do so (10s 
of seconds) - the system kept running, but everything slowed to a 
crawl.  Not sure why the failure wasn't detected but that's a story for 
another day.

With the drive removed, everything came back up, but all 4 RAID one 
devices had become degraded and did not automatically rebuild themselves 
- they were all effectively running as a single drive.

After inserting a spare drive and formatting it, I started doing hot 
adds (mdadm --add) and 3 of 4 arrays are now working properly

Which brings us to the fourth array... which supports my root volume, 
configuration is something like this:

before crash:
/
Logical Volume
Physical Volume
RAID1 array - 2 active, one spare

after crash and partial recovery:
/
Logical Volume
Physical Volume
RAID1 array - showing inactive, running on spare drive alone

On the other volumes, when I did a hot add (mdadm --add ...) the added 
drives started resyncing and now all is fine.  On this array, the new 
drives shows as "spare rebuilding" but it doesn't really seem to be 
doing anything.

So... my question becomes: if I can't figure out how to get md to 
rebuild the array "underneath" LVM, how do I unwind all of this, and 
rebuild things - without becoming unrunable without a root volume?

Thanks for any suggestions anyone can offer.

Miles Fidelman
