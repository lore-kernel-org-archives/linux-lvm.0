Date: Tue, 19 Oct 1999 23:15:08 +0200
From: Adrien Farkas <freddy@redneck.sk.oracle.com>
Subject: [linux-lvm] how to remove PV from a VG?
Message-ID: <19991019231507.A337@redneck.sk.oracle.com>
Reply-To: freddy@sk.oracle.com
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hey folks,

the subject says it (almost) all, I need to remove three PVs that were added to my VG by mistake (namely /dev/sdi, /dev/sdj and /dev/sdk), I guess you see where the error is. I can access data on previous PVs (yet), but don't know how to remove PVs, there is nothing linke 'pvremove'. I can assure you there is no data (perhaps except signature) on those disks.

Another question regarding devfs, some time ago a guy had a problem with devfs and 'smart' libs and Heinz pointed him to mailing list archives to look for patches. I did so, too (because I have tha same probs) but didn't find anything regarding this issue, anyone can help me with this?

THanks in advance,
-- 
                                             freddy

----==-- _                      Adrien "freddy" Farkas
---==---(_)__  __ ____  __       freddy@sk.oracle.com
--==---/ / _ \/ // /\ \/ /  We all know Linux is great... It
-=====/_/_//_/\___/ /_/\_\  does infinite loops in 5 seconds
