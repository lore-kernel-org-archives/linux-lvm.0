Return-Path: <tack@orion.dok.org>
Date: Tue, 24 Jul 2001 15:13:19 -0400
From: Jason Tackaberry <tack@linux.com>
Message-ID: <20010724151319.H25303@linux.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM vs. md: Benefits in RAID0?
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

I am about to be deploying a new server whose purpose is to replace an
existing, aging system.  The new server has 2 18GB drives.  Once I
migrate the user data to the new server, I can reclaim a practically
brand new 18GB disk in the old server, bringing the total raw capacity
to 18x3 GB.

I installed RH7.1 and was happy to see how easy it was to setup
mirroring using the md driver.  My plan was to setup 9GB on each disk in
a RAID1 config, and then stripe the remaining 9GB on each disk for user
data in /home.  Then, when I migrated the user data from the old server,
I could add the 18GB into /home to give me 36GB for user data.  (I want
redundancy for the system partitions because as this is a mail server, I
do not want the flow of mail to be interrupted during a disk failure.
For user data I want to go for raw storage, since I will take full
backups nightly.)

In planning the migration, I discovered that md does not allow you to
grow.  Well, no problem, I know LVM supports this, so I setup LVM to
stripe the 2 9GB partitions together.  Then, I dropped a 3rd disk in to
test the procedure of adding a new disk to the stripe set.  I
unfortunately then discovered LVM won't let you extend a RAID0 volume,
but this is supposedly a planned feature for post-1.0.

I assume the only way to proceed is to use linear concatenation.  This
lets me extend the volume, but then I don't get the performance gain I'd
see with RAID0.  But, as I understand the LVM, its advantage is that it
lets you resize volumes.  Since you can't currently do this in RAID0,
does the LVM offer any benefits over md in this situation?

Thanks,
Jason.

--
Academic Computing Support Specialist         Assistant Section Editor
Algoma University College                     http://linux.com/develop
Sault Ste. Marie, Ontario                 
705-949-2301 x330                                   Personal Home Page
http://www.auc.ca                                     http://sault.org
