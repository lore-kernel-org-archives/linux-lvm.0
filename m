From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] LVM Striping question
Message-ID: <9810000.1008525655@dizzy>
In-Reply-To: <25E4CA13D679FF48BC30769420220971467A23@nd1-clusa.local.bunnings.com.au>
References: <25E4CA13D679FF48BC30769420220971467A23@nd1-clusa.local.bunnings
 .com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Mon Dec 17 00:01:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Colin Coe <CCoe@bunnings.com.au>

> I have a Linux system using LVM and SGI XFS.  I have just added a second
> hard disk and I want to change the LVM config so it now stripes over both
> hard drives.  Also, is this striping RAID0 or RAID1?  If it is only RAID0,
> how can I do RAID1?

Striping has nada to do with RAID.

You can stripe new LV's as you create them to use the new
PV's. If you are not using RAID to manage the PV's themselves
then loosing one disk will loose all of the data on any
LV's striped across it.

Safest way to use striping is across PV's that are
themselves RAID1 or RAID5 [let's assume noone uses
RAID3 for much anymore]. At that point the RAID
protects you from hardware failure and the LVM
striping at the LV level spreads out the I/O to
allow the RAID component to catch up.

The existing volumes can't be striped on the fly; you'd
have to copy the contents to new, striped LV's.

--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
