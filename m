Message-ID: <20030613002945.80024.qmail@web20419.mail.yahoo.com>
From: Matt E <mgeusenet@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] Questions about Physical Volumes...
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
Date: Thu Jun 12 19:30:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello!

I'm going to be adding a RAID 5 setup to my system,
but I need to get all the data off my disks that are
currently installed and put on to the new raid array. 
Once this is done, I'll take one of the disks that is
currently in my system and add it to the RAID array.

I'm going to run LVM ontop of this RAID array.  The
raid tools package has a tool "raidreconf" that will
allow me to add another disk to the array without
destroying the data on it.

Once this is done, I'd want to use this extra space in
LVM.  However, I can't pvcreate /dev/md0 again,
beacuse I will already have an LVM setup on it.  Is
there anyway to let LVM know that /dev/md0 has grown,
so I could then use this extra space in VGs?

Anyone know anything about this?

Cheers!

__________________________________
Do you Yahoo!?
Yahoo! Calendar - Free online calendar with sync to Outlook(TM).
http://calendar.yahoo.com
