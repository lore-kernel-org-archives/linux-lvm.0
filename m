Date: Tue, 17 Aug 1999 13:57:31 +0200
From: Adrien Farkas <freddy@redneck.sk.oracle.com>
Subject: [linux-lvm] corrupted VG/LVs
Message-ID: <19990817135731.A1109@redneck.sk.oracle.com>
Reply-To: freddy@sk.oracle.com
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi,

somehow I managed to get my volume group vg00 corrupted. I have 7 PVs, some of them are members of (not existing) vg00, some are not. Now my question is how I remove all the dependencies and/or PVs from VG to be able to create new PV/VG/LV? xxremove does not work.

Thanks in advance,
-- 
                                             freddy

----==-- _                      Adrien "freddy" Farkas
---==---(_)__  __ ____  __       freddy@sk.oracle.com
--==---/ / _ \/ // /\ \/ /  We all know Linux is great... It
-=====/_/_//_/\_,_/ /_/\_\  does infinite loops in 5 seconds
