Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB8GTUr07791
	for <linux-lvm@redhat.com>; Wed, 8 Dec 2004 11:29:30 -0500
Received: from exch-calgary.int.pason.com (hemlock.pason.com [208.38.1.1])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iB8GTRaQ013024
	for <linux-lvm@redhat.com>; Wed, 8 Dec 2004 11:29:29 -0500
Date: Wed, 8 Dec 2004 09:28:47 -0700
From: "Donald Murray, P.Eng." <donald.murray@pason.com>
Subject: Re: [linux-lvm] EXT3-fs: INFO: recovery required on readonly
	filesystem ?
Message-Id: <20041208092847.3b840145.donald.murray@pason.com>
In-Reply-To: <20041208153141.DD448173531@postfix3-1.free.fr>
References: <20041208153141.DD448173531@postfix3-1.free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

We were seeing entries like this in /var/log/messages in May of this year.
It was not LVM related: I used lsof to see which files were open in the
original logical volume. MySQL was keeping an inode for a rotated log
file; once I added 'mysqladmin flush-logs' to logrotated, the problem
went away.

You should use lsof to see which files are open on your logical volume.
Perhaps you are having a similar issue. 



On Wed, 8 Dec 2004 16:32:12 +0100
"EC" <wingman@waika9.com> wrote:

> Hi,
> 
> I'm trying to use the snapshots as indicated in the LVM HOWTO. I use LVM2.
> But I seem to get EXT to claim recovery each time I lvcreate the backup..
> Please understand I'm newbie to LVM..
> 
> My syslog gives something like : 
> 
> EXT3-fs: INFO: recovery required on readonly filesystem
> 
> ... kernel: EXT3-fs: INFO: recovery required on readonly filesystem.
> ... kernel: EXT3-fs: write access will be enabled during recovery.
> ... kernel: kjournald starting.  Commit interval 5 seconds
> ... kernel: EXT3-fs: recovery complete.
> ... kernel: EXT3-fs: mounted filesystem with ordered data mode.
> 
> I'm using : 
> 2.4.28 kernel , linux-2.4.26-rc1-devmapper-ioctl.patch, 1.00.18 device
> mapper , 2.00.25 LVM2. 
> 
> I saw some messages about this in may 2004 but cannot understand if I'm
> supposed to apply other patches or so.. Please note this is to be used in
> production environment, so unstable patches cannot be applied...
> 
> Please help if possible..
> 
> EC.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


 ------------------------------------------ 
 Donald Murray, P.Eng.
 Senior Software Engineer
 Pason Systems Corp.
 Direct: (403) 301-3473
