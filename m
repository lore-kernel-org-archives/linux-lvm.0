Message-ID: <38C91793.AD7815DE@amis.com>
Date: Fri, 10 Mar 2000 08:41:07 -0700
From: Eric Whiting <ewhiting@amis.com>
MIME-Version: 1.0
Subject: [linux-lvm] LVM performance questions..
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

I've been watching the LVM stuff for a long time. I finally gave it a
try this week. I really like the tools. I think it is a great thing
for Linux.. Thanks.

I have some performance questions. I was expecting to see some speed
increase for a LVM stripe, but I didn't. Is there someone out there
who has had more experience with this that can point me in the right
direction? I found that the LVM stripe is running the same write
speeds as a single disk and the same as a md RAID0 set. Sure feels
like a Hardware problem, but I'm not sure.

I threw 2 9G 10k RPM disks into a VG. Then I created a 12G LV in
stripe mode (at least I think I had it set right). I did a simple
dd write benchmark.  25M/s (for a 1000M file). Then I tried a solo
drive. 25M/s as well.  I'm confused by the performance numbers -- on
our Suns with SW raid we improve speed somewhat linear as we add
drives
to a raid0 set. I redid the LV with stripsize of 16k and 256k. No
difference in performance. Could my SCSI bus be killing me? My boot
log shows this:

<6>sym53c876-0-<0,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 16)
<4>SCSI device sda: hdwr sector= 512 bytes. Sectors= 17773524 [8678
MB] [8.7 GB]

Any scsi experts out there? I did scsiinfo -i /dev/sdb and saw the 32
bit bus not set... I'm not sure if that matters or not.. Am I looking
the wrong place for problems. 

Inquiry command
---------------
Relative Address                   0
Wide bus 32                        0
Wide bus 16                        1
Synchronous neg.                   1
Linked Commands                    1
Command Queueing                   1


ko /home/ewhiting> cat /proc/lvm
LVM driver version 0.8i  (02/10/1999)

Total:  1 VG  2 PVs  1 LV (1 LV open 1 times)

Global: 53225 bytes vmalloced   IOP version: 5   2 days 17:49:02
active

VG:  oracle_vg  [2 PV, 1 LV/1 open]  PE Size: 4096 KB
  Usage [KB/PE]: 17768448 /4338 total  12582912 /3072 used  5185536
/1266 free
  PVs: [AA] /dev/sdb1              8884224 /2169     6291456 /1536    
2592768 /633   
       [AA] /dev/sdc1              8884224 /2169     6291456 /1536    
2592768 /633   
    LV:  [AWDS2 ] oracle_lv                 12582912 /3072     1x open



eric

-- 
__________________________________________________________________
Eric T. Whiting					AMI Semiconductors   
(208) 234-6717					2300 Buckskin Road
(208) 234-6659 (fax)				Pocatello,ID 83201
ewhiting@poci.amis.com
