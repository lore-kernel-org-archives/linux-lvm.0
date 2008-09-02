Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m82BPSBA013361
	for <linux-lvm@redhat.com>; Tue, 2 Sep 2008 07:25:28 -0400
Received: from wr-out-0506.google.com (wr-out-0506.google.com [64.233.184.229])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m82BPIKe001579
	for <linux-lvm@redhat.com>; Tue, 2 Sep 2008 07:25:18 -0400
Received: by wr-out-0506.google.com with SMTP id c49so1823461wra.19
	for <linux-lvm@redhat.com>; Tue, 02 Sep 2008 04:25:17 -0700 (PDT)
Message-ID: <c8ce53500809020425r2673cc9fq4fff919595865f54@mail.gmail.com>
Date: Tue, 2 Sep 2008 12:25:17 +0100
From: "Michael Guyver" <michael.guyver@gmail.com>
In-Reply-To: <c8ce53500809020343y6236762age945a548c3eb8df4@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <c8ce53500809020343y6236762age945a548c3eb8df4@mail.gmail.com>
Subject: [linux-lvm] Re: Problems with LVM setup using former RAID-1 disks
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Further to the top post in this thread (my own) here's some further
debugging information which may assist.

# pvchange -v -t -d -u /dev/sda2
  Test mode: Metadata will NOT be updated.
    Using physical volume(s) on command line
  Found duplicate PV g7ZWtzNQcHx2PMQghP0NBHDXuYcaYqAt: using /dev/sdb2
not /dev/sda2
    Finding volume group VolGroup00 of physical volume /dev/sdb2
  Volume group containing /dev/sdb2 has active logical volumes
  0 physical volumes changed / 1 physical volume not changed
    Test mode: Wiping internal cache
    Wiping internal VG cache

It appears that even if there were a forced-mode, this command would
not operate on /dev/sda2 as specified, but rather on the /dev/sdb2
device. Is this the correct interpretation of these results? Would
changing the UUID on /dev/sda2 solve this particular problem anyway?

Best wishes,

Michael
