Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i38IvPj30587
	for <linux-lvm@redhat.com>; Thu, 8 Apr 2004 14:57:25 -0400
Received: from email.careercast.com (email.careercast.com [216.39.101.233])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i38IvOMC008714
	for <linux-lvm@redhat.com>; Thu, 8 Apr 2004 14:57:24 -0400
Subject: Re: [linux-lvm] snapshots and reiserfs
From: Clint Byrum <cbyrum@spamaps.org>
In-Reply-To: <20040408181835.GA11818@earth.solarsys.private>
References: <20040408181835.GA11818@earth.solarsys.private>
Message-Id: <1081450647.3818.147.camel@arthur.cbd.careercast.com>
Mime-Version: 1.0
Date: Thu, 08 Apr 2004 11:57:27 -0700
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 2004-04-08 at 11:18, Mark M. Hoffman wrote:
> Hello:
> 
> Sometimes, but not always, I am unable to mount a snapshot.
> When it fails, I see the following lines in my logs...
> 
> kernel: reiserfs: checking transaction log (device 3a:06) ...
> kernel: clm-2076: device is readonly, unable to replay log
> kernel: Replay Failure, unable to mount
> kernel: reiserfs_read_super: unable to initialize journal space
> 
> I am using RedHat 9 with the following stock packages:
> 

I see the same thing on RedHat 8. I never looked at the kernel messages,
but I do occasionally get a backup failure because the snapshot won't
mount. I added a 3 second sleep between the lvcreate and the mounting in
our backup scripts, and that seems to have reduced the frequency, but I
still see it once a month or so.
