Date: Tue, 13 Jul 1999 13:28:02 +0200
From: Adrien Farkas <freddy@redneck.sk.oracle.com>
Subject: [linux-lvm] ERROR -6 activating volume group
Message-ID: <19990713132802.A7208@redneck.sk.oracle.com>
Reply-To: freddy@oracle.sk
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi,

I'v got the following problem: I've created volume group, logical volume, everything ran okay. vgscan and vgschange both ran with no problems. Then I recompiled the kernel (2.2.10-ac) with LVM included and now the situation is:

vgscan runs okay, gives

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found volume group "vg1"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created

but vgchange -a y gives

vgchange -- ERROR -6 activating volume group "vg1"

Anyone can guess what's wrong and how to avoid it?


Thanks in advance
-- 
                                             freddy

----==-- _                      Adrien "freddy" Farkas
---==---(_)__  __ ____  __       freddy@sk.oracle.com
--==---/ / _ \/ // /\ \/ /  We all know Linux is great... It
-=====/_/_//_/\_,_/ /_/\_\  does infinite loops in 5 seconds
