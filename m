Return-Path: <weissel@netcologne.de>
From: Wolfgang Weisselberg <weissel@netcologne.de>
Date: Sun, 19 Aug 2001 21:20:58 +0200
Subject: Re: [linux-lvm] Adding a mirror after-the-fact
Message-ID: <20010819212058.B3188@tiger.bigcats.invalid>
References: <20010814171159.B28266@linux.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010814171159.B28266@linux.com>; from tack@linux.com on Tue, Aug 14, 2001 at 05:11:59PM -0400
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

Hi, Jason!

Jason Tackaberry (tack@linux.com) wrote 16 lines:

> Suppose I have a volume group with 1 physical volume, say a 9GB disk.
> Now, after some time, I decide I want to mirror this VG with another 9GB
> disk.  What options do I have?  AFAICS, the only way to do this would be

How about: 
- Get RAID HW controller
- put in a test disk with some unimportant data on it
- run RAID in degraded mode
- add second disk
- have RAID rebuild itself (like after an actual disk
  failure)

If that works. simply do it 'real', otherwise you might need
to copy the data onto the 'degraded mode' disk.

You could do the same with a Software raid, but then I'd
run it in RAID1 with 1 disk, add that mdX to my LVM, pvmove
everything off the other PV onto the mdX PV, remove the PV,
add the second Disk, auto-rebuild.

(I read about that trick in some time ago in an Linux Soft-RAID
HOWTO, about "moving from 2-Disk RAID1 to 3-Disk RAID5 with
only 3 Disks".)

-Wolfgang
