Date: Wed, 14 Jul 1999 23:38:06 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: [linux-lvm] RAID and LVM?
Message-ID: <Pine.LNX.4.10.9907142327410.30426-100000@hibernia.spin.ie>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM list <linux-lvm@msede.com>, Linux Raid Mailing List <linux-raid@vger.rutgers.edu>

I'm wondering: is it possible to run LVM on top of the linux-raid
patches?

I'd like to carve up my disks into 500MB RAID-5 devices, and then
build LVM on top of the /dev/md devices instead of the usual
/dev/sd{a1,b1.. etc} devices.

Should I try it? or do the 2 patches tread on each others toes? (i
notice they both touch buffer.c). 

if it can't be done, then are there any plans to integrate linux-raid
and linux-lvm, or change LVM to able to use md devices?

(LVM and RAID are very complementary... really should be merged)

thanks,
-- 
Paul Jakma
paul@clubi.ie	http://hibernia.clubi.ie
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
Don't get suckered in by the comments -- they can be terribly misleading.
Debug only code.
		-- Dave Storer
