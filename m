Return-Path: <iain@sandon.ca>
From: Iain Campbell <iain@sandon.ca>
Subject: Re: [linux-lvm] Reiserfs, 2.4.7, snapshots w/ 0.9
Date: Wed, 25 Jul 2001 11:46:57 -0400
References: <20010725103640.J5363@unirez.com>
In-Reply-To: <20010725103640.J5363@unirez.com>
MIME-Version: 1.0
Message-Id: <01072511465701.00921@exodus>
Content-Transfer-Encoding: 8bit
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
To: linux-lvm@sistina.com

On Wednesday 25 July 2001 11:36, you wrote:
> I'm using LVM on a couple of our production systems, and I'm very
> happy with it.  It's been working very well for us.  However, we
> have a very large database and backing it up has become problematic.
>
> So, naturally, I began looking into using LVM's snapshot feature.
> The filesystem the database rests on is a reiserfs partition.
> Creating the snapshot volume (acc to the directions in the howto)
> works fine, but when I try to actually mount it I get:
>
> $ sudo mount -t reiserfs -oro /dev/main/db_backup /mnt/dbbackup
> mount: wrong fs type, bad option, bad superblock on /dev/main/db_backup,
>        or too many mounted file systems
>
> checking dmesg reveals:
> reiserfs: checking transaction log (device 3a:04) ...
> clm-2076: device is readonly, unable to replay log
> Replay Failure, unable to mount
> reiserfs_read_super: unable to initialize journal space
>
> Ok, so I did some searching and found some people back in the first
> part of this year had a similar problems but none of the solutions
> really applied to me fwict.  They all appeared to be using a
> previous version of the kernel, or of the lvm code.  I looked through
> the changelog and did see a few notations of fixes since 0.9 related
> to the snapshot code.  But, I'm kind of wary about putting a beta
> on my production systems with something this critical, w/out knowing
> for sure that it will fix the problem.
>
> So, is the problem in lvm?  reiserfs?  Or is it just me?  Is there
> any other information I can give that might be helpfull in figuring
> out the problem?  Just let me know.
>
> TIA
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

Quote from Teigland and Mauelshagens's Volume Manager whitepaper:

"If a snapshot is simply taken of a file system volume, the resulting copy of 
the file system will look as if the system has crashed.  When the snapped 
file system is then mounted read only it would appear to need an fsck, in the 
case of a non journalled file system, or journal recovery in the case of  a 
journalled file system. These operations (fsck or journal replay) require 
writing to  the snapshot ligical volume, which is not allowed."

There's more, get the whole thing from sistina.com/lvm. Look for 
vmil_freenix.pdf.

Question to Heinz - what is the status of getting file system snapshot hooks 
into the kernel??

iain
