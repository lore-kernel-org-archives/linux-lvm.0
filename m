Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8CHRkcW011855
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2011 13:27:46 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8CHRgZc031081
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2011 13:27:42 -0400
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.4/8.14.4/SuSE Linux 0.8) with ESMTP id
	p8CHRZIG000884
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2011 10:27:37 -0700
Message-ID: <4E6E4107.70802@tlinx.org>
Date: Mon, 12 Sep 2011 10:27:35 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <4E6D5600.4060008@tlinx.org>	<20110912023345.476db018@bettercgi.com>
	<alpine.LRH.2.00.1109120949090.9046@bmsred.bmsi.com>
In-Reply-To: <alpine.LRH.2.00.1109120949090.9046@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How to stop MERGE? (was Re: more vg problems or
	oddities...not using dmsetup remove seems to be bad?)
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>




Stuart D. Gathman wrote:
>
> In the OP problem, we don't know the exact error message, so perhaps
> the snapshot really was open.  In any case, she needs to stop the
> merge from happening the next time the LV is activated.
---
I've only seen 1 error message ..

Ah....here are the two messages...this ****IS NOT*** a snapshot volume...
it's a static volume!

Here's lvs.  I'm going to remove the oldest static 'snap' (not an active
snapshot, but a copy of one that existed back then.  It's currently
mounted, .. (lv Home-2011.07.20-13.43.15; you'll never guess when the
snapshot was started or what the base LV was.. ;-) )...
It's currently mounted, and no 's' in status... (i.e. not an active 
snapshot).



NOTE, poor 'Home' has 'O' status -- thinks it is MERGing, but nothing
for it to MERGE with! -- this is a problem waiting to happen that I need
to ABORT.

# lvs
  LV                       VG         Attr   LSize  
  Backups                  Backups    -wi-ao  10.91t
  Home                     Home+Space Owi-ao   1.00t
  Home-2011.07.20-13.43.15 Home+Space -wi-ao 171.00g    <-about to remove
  Home-2011.07.25-16.24.53 Home+Space -wi-ao   1.88g
....     
  Home-2011.08.31-07.34.53 Home+Space -wi-ao   1.86g
  Home-2011.09.04-19.25.08 Home+Space swi-ao   1.00t Home     1.25
  Home.diff                Home+Space -wi-ao 512.00g


# lvremove /dev/Home+Space/Home-2011.07.20-13.43.15    # first w/o 
umounting it...
Can't remove open logical volume "Home-2011.07.20-13.43.15"
ok... so lets. unmount it...
# umount /home/snapdir/@GMT-2011.07.20-13.43.15
# lvremove /dev/Home+Space/Home-2011.07.20-13.43.15
Do you really want to remove active logical volume 
Home-2011.07.20-13.43.15? [y/n]: y
  Logical volume "Home-2011.07.20-13.43.15" successfully removed

^^^
This isn't helpful...as it's not *really* active in any way to the OS...
though it might still be 'activated'...(that's why I'm trying to
remove it...!)...

It was created w/lvcreate, so ... opposite of lvcreate would be
lvremove, no?...  there is no 'lvucreate'.. ;-/

FWIW...Home is even more confused...

Thought it was going to merge with a volume from 2011.09.03-xxxx, but
dmsetup remove on /dev/Home+Space/Home-2011.09.03-xxxx suceeded w/o force
as well as:
/dev/Home+Space/Home-2011.09.03-xxxx-cow

So now, /Home... what's it going to merge w/?  (Garbage likely...)...

That's what I love about the M5 computer, er, LVM2 Merge option:
 "No off switch"...

(last crewman who tried to pull the plug got zapped...didn't know lvm
was so dangerous!...;-) ).
