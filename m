From: Robert Macaulay <robert_macaulay@dell.com>
Message-ID: <Pine.LNX.4.33.0110260000350.23688-100000@ping.us.dell.com>
MIME-Version: 1.0
Subject: [linux-lvm] More information on my LV with bad read performance..
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
Date: Fri Oct 26 00:02:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I realized I didn't include a lvdisplay -v of my volume. Here it is.
The disks are spread out over 4 scsi busses. 
Thanks again.

--- Logical volume ---
LV Name                /dev/vgOracle/foo
VG Name                vgOracle
LV Write Access        read/write
LV Status              available
LV #                   52
# open                 0
LV Size                9.04 GB
Current LE             2314
Allocated LE           2314
Stripes                26
Stripe size (KByte)    64
Allocation             next free
Read ahead sectors     120
Block device           58:51

   --- Distribution of logical volume on 26 physical volumes  ---
   PV Name                  PE on PV     reads      writes
   /dev/sdh1                89           13629      173625
   /dev/sdi1                89           13616      173386
   /dev/sdj1                89           13630      173372
   /dev/sdl1                89           13619      173354
   /dev/sdm1                89           13625      173369
   /dev/sdn1                89           13619      173384
   /dev/sdo1                89           13635      173391
   /dev/sdp1                89           13632      173387
   /dev/sdq1                89           13641      173401
   /dev/sdr1                89           13633      173386
   /dev/sds1                89           13639      173398
   /dev/sdt1                89           13633      173388
   /dev/sdu1                89           13625      173367
   /dev/sdv1                89           13617      173357
   /dev/sdw1                89           13625      173367
   /dev/sdx1                89           13617      173358
   /dev/sdy1                89           13624      173366
   /dev/sdz1                89           13618      173354
   /dev/sdaa1               89           13606      173366
   /dev/sdab1               89           13600      173388
   /dev/sdac1               89           13609      173366
   /dev/sdad1               89           13603      173356
   /dev/sdae1               89           13609      173364
   /dev/sdaf1               89           13600      173361
   /dev/sdag1               89           13607      173366
   /dev/sdah1               89           13602      173354

   --- logical volume i/o statistic ---
   354113 reads  4507931 writes


--cut--
