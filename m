Return-Path: <mark@unirez.com>
Date: Wed, 25 Jul 2001 10:36:40 -0500
From: Mark Bainter <mark@unirez.com>
Message-ID: <20010725103640.J5363@unirez.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Reiserfs, 2.4.7, snapshots w/ 0.9
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I'm using LVM on a couple of our production systems, and I'm very 
happy with it.  It's been working very well for us.  However, we
have a very large database and backing it up has become problematic.

So, naturally, I began looking into using LVM's snapshot feature. 
The filesystem the database rests on is a reiserfs partition.  
Creating the snapshot volume (acc to the directions in the howto) 
works fine, but when I try to actually mount it I get:

$ sudo mount -t reiserfs -oro /dev/main/db_backup /mnt/dbbackup 
mount: wrong fs type, bad option, bad superblock on /dev/main/db_backup,
       or too many mounted file systems

checking dmesg reveals:
reiserfs: checking transaction log (device 3a:04) ...
clm-2076: device is readonly, unable to replay log
Replay Failure, unable to mount
reiserfs_read_super: unable to initialize journal space

Ok, so I did some searching and found some people back in the first
part of this year had a similar problems but none of the solutions
really applied to me fwict.  They all appeared to be using a 
previous version of the kernel, or of the lvm code.  I looked through
the changelog and did see a few notations of fixes since 0.9 related
to the snapshot code.  But, I'm kind of wary about putting a beta 
on my production systems with something this critical, w/out knowing
for sure that it will fix the problem.

So, is the problem in lvm?  reiserfs?  Or is it just me?  Is there
any other information I can give that might be helpfull in figuring
out the problem?  Just let me know. 

TIA
