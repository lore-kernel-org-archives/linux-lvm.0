Message-ID: <38CA0EC0.414DCAEA@osp.nl>
Date: Sat, 11 Mar 2000 10:15:44 +0100
From: Jos Visser <josv@osp.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM performance questions..
References: <38C91793.AD7815DE@amis.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Eric Whiting <ewhiting@amis.com>
Cc: linux-lvm@msede.com

Hi,

I would not pose myself as an absolute expert, but as far as I know,
striping's biggest performance improvements come if multiple threads (or
processes) are accessing the same file system (block device).

Suppose your OS does I/O in 4k units.

If your stripe set has a stripe size of larger than 4kb, than one OS
logical write goes to one disk. In this case, with one process writing
data there is no performance improvement to be expected.

If your stripe set has a smaller stripe size (say 1kb, or 2kb), then
performance could even degrade. A 4k write will be split across two or
more drives, and the entire write has to wait for the slowest disk. I
won't even go into the factors involved if you have a two-deep stripe of
1kb stripe size and an OS block size of 4kb! In my view (and please
correct me if I see it wrong), the stripe size must be a whole multiple
of the OS block size that is going to be used in the striped LV.

With multiple processes doing I/O the story gets better. With a stripe
of 2 deep, there is a 50% chance that two processes doing I/O in the
same LV (file system) end up on different disks for a particular I/O. In
this case, the I/O's do not have to wait for one another.

Have you tried doing I/O with more than one process? If not, could you
try that as well?

++Jos

Eric Whiting wrote:
> 
> I've been watching the LVM stuff for a long time. I finally gave it a
> try this week. I really like the tools. I think it is a great thing
> for Linux.. Thanks.
> 
> I have some performance questions. I was expecting to see some speed
> increase for a LVM stripe, but I didn't. Is there someone out there
> who has had more experience with this that can point me in the right
> direction? I found that the LVM stripe is running the same write
> speeds as a single disk and the same as a md RAID0 set. Sure feels
> like a Hardware problem, but I'm not sure.
> 
> I threw 2 9G 10k RPM disks into a VG. Then I created a 12G LV in
> stripe mode (at least I think I had it set right). I did a simple
> dd write benchmark.  25M/s (for a 1000M file). Then I tried a solo
> drive. 25M/s as well.  I'm confused by the performance numbers -- on
> our Suns with SW raid we improve speed somewhat linear as we add
> drives
> to a raid0 set. I redid the LV with stripsize of 16k and 256k. No
> difference in performance. Could my SCSI bus be killing me? My boot
> log shows this:
> 
> <6>sym53c876-0-<0,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 16)
> <4>SCSI device sda: hdwr sector= 512 bytes. Sectors= 17773524 [8678
> MB] [8.7 GB]
> 
> Any scsi experts out there? I did scsiinfo -i /dev/sdb and saw the 32
> bit bus not set... I'm not sure if that matters or not.. Am I looking
> the wrong place for problems.
> 
> Inquiry command
> ---------------
> Relative Address                   0
> Wide bus 32                        0
> Wide bus 16                        1
> Synchronous neg.                   1
> Linked Commands                    1
> Command Queueing                   1
> 
> ko /home/ewhiting> cat /proc/lvm
> LVM driver version 0.8i  (02/10/1999)
> 
> Total:  1 VG  2 PVs  1 LV (1 LV open 1 times)
> 
> Global: 53225 bytes vmalloced   IOP version: 5   2 days 17:49:02
> active
> 
> VG:  oracle_vg  [2 PV, 1 LV/1 open]  PE Size: 4096 KB
>   Usage [KB/PE]: 17768448 /4338 total  12582912 /3072 used  5185536
> /1266 free
>   PVs: [AA] /dev/sdb1              8884224 /2169     6291456 /1536
> 2592768 /633
>        [AA] /dev/sdc1              8884224 /2169     6291456 /1536
> 2592768 /633
>     LV:  [AWDS2 ] oracle_lv                 12582912 /3072     1x open
> 
> eric
> 
> --
> __________________________________________________________________
> Eric T. Whiting                                 AMI Semiconductors
> (208) 234-6717                                  2300 Buckskin Road
> (208) 234-6659 (fax)                            Pocatello,ID 83201
> ewhiting@poci.amis.com

-- 
Dihydrogen Monoxide kills! 
Support a worldwide ban of Dihydrogen Monoxide. See http://www.dhmo.org
