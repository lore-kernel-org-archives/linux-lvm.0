Return-Path: <piete.brooks@cl.cam.ac.uk>
Subject: Re: [linux-lvm] Newbie question: ERROR "pv_move_pe(): PE lock" 
 pv_move_pe
In-reply-to: Your message of Sat, 17 Feb 2001 11:16:25 +0100.
             <20010217111625.B32060@colombina.comedia.it> 
Mime-Version: 1.0
Date: Sat, 17 Feb 2001 10:49:19 +0000
From: Piete Brooks <Piete.Brooks@cl.cam.ac.uk>
Message-Id: <E14U4vX-0006ka-00@whittlesey.cl.cam.ac.uk>
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
Cc: Piete.Brooks@cl.cam.ac.uk

>> # pvmove /dev/hda9 
>> pvmove -- moving physical extents in inactive volume group "vg01"
>> pvmove -- WARNING: moving of active logical volumes may cause data loss!
>> pvmove -- do you want to continue? [y/n] y
>> pvmove -- ERROR "pv_move_pe(): PE lock" pv_move_pe
>> 
>> pvmove -- ERROR "pv_move_pe(): PE lock" moving physical extents 
> i believe the vg should be active....

Sigh -- it warns that data loss can occur if they are active, so I assumed 
that they should be inactive.  If it has to be active, why does it quietly say 
`extents in inactive volume' and not warn that they should be active ?

I got the data onto the RAID device, and when that's active, I get a different 
message:

# pvmove /dev/md7
pvmove -- ERROR "pv_read(): multiple device" reading source physical volume 
"/dev/md7"

# cat /proc/lvm/global    
LVM driver version 0.9.1_beta4 (09/02/2001)

Total:  1 VG  3 PVs  2 LVs (2 LVs open 2 times)

Global: 10276 bytes malloced   IOP version: 10   0:19:55 active

VG:  vg01  [3 PV, 2 LV/2 open]  PE Size: 4096 KB
  Usage [KB/PE]: 3145728 /768 total  1257472 /307 used  1888256 /461 free
  PVs: [AA] md8                    1048576 /256      1048576 /256         0/0
       [AA] md7                    1048576 /256       208896 /51     839680/205
       [AA] md6                    1048576 /256            0 /0     1048576/256
    LVs: [AWDL  ] repl                        348160 /85       1x open
         [AWDL  ] scratch                     909312 /222      1x open
# 
