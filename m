Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2P7uD7R032697
	for <linux-lvm@redhat.com>; Sun, 25 Mar 2012 03:56:14 -0400
Received: from titan.nuclearwinter.com (titan.nuclearwinter.com
	[209.40.204.131])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2P7uCtT002232
	for <linux-lvm@redhat.com>; Sun, 25 Mar 2012 03:56:13 -0400
Received: from [10.0.0.100] (c-98-199-76-189.hsd1.tx.comcast.net
	[98.199.76.189]) (authenticated bits=0)
	by titan.nuclearwinter.com (8.14.1/8.14.1) with ESMTP id q2P7uBjv011236
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 25 Mar 2012 02:56:12 -0500
Message-ID: <4F6ECF9B.40907@nuclearwinter.com>
Date: Sun, 25 Mar 2012 02:56:11 -0500
From: Larkin Lowrey <llowrey@nuclearwinter.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM commands extremely slow during raid check/resync
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
