Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1GJA6O17737
	for <linux-lvm@redhat.com>; Wed, 16 Feb 2005 14:10:06 -0500
Received: from synflood.office.aol.com (h-64-236-128-14.nat.aol.com
	[64.236.128.14])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j1GJ9xNu000986
	for <linux-lvm@redhat.com>; Wed, 16 Feb 2005 14:09:59 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by synflood.office.aol.com (Postfix) with ESMTP id 26B3343116
	for <linux-lvm@redhat.com>; Wed, 16 Feb 2005 13:37:10 -0500 (EST)
Message-ID: <421392D6.4070405@avondalenetworks.com>
Date: Wed, 16 Feb 2005 13:37:10 -0500
From: Jeff Bethke <jeff@avondalenetworks.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgscan changing/resetting perms?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hello!
   I have a LVM2 question that I am guessing has been asked before, 
however, I can't find it anywhere in the archives.   The problem is 
simple...   I create a volume group called 'vgfoo' at /dev/vgfoo. I 
create all the devices logical volumes under it.   I change the perms 
for the logical volumes/volume groups to a user:groupid other than 
root:root.   At this point everything is fine.  

Then I go ahead and reboot the host or someone comes along and runs a 
vgscan.  VOILA!  The perms for those files reset to root:root.   How do 
I prevent that from happeneing?  I want it so that I can make a device 
and set its perms to some user, and forget about it.   Is that even 
possible? If so, how? Or, what am I doing wrong in setting up the lv/vg's?
 
TIA for any answers!

-jeff
