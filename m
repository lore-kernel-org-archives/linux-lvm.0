From: "tester7 A." <benew666@hotmail.com>
Mime-Version: 1.0
Message-ID: <F80oe73FqS0XrPoqxBJ00008bbe@hotmail.com>
Subject: [linux-lvm] BMT-LVM performance with snapshots
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
Date: Wed Jan 29 09:31:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Kernel: 2.4.20
LVM: 1.0.6 with kernel patched(VFS-lock and lvm-1.0.6)
CPU: PIII 1.4
RAM: 512M

This is the output from bonnie++ with lv only and with lv + snapshot

Version  1.03      ------Sequential Output------ --Sequential Input- 
--Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- 
--Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec 
%CP
lv_wo_snap 2G           78505  32 41745  27           151742  41 435.4   1
lv_wo_snap 2G           75501  31 40277  25           150466  42 436.8   1
lv_wo_snap 2G           73933  29 41213  26           150052  41 433.4   1
lv_wo_snap 2G           76434  30 40980  26           147544  41 399.0   0
lv_with_sn 2G            1367   0 10196   6           128362  35 437.4   1
                    ------Sequential Create------ --------Random 
Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read--- 
-Delete--
files:max:min        /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec 
%CP
lv_wo_snap 16  1669  17 +++++ +++  2532  23  1464  17 +++++ +++   475   5
lv_wo_snap 16  1572  17 +++++ +++  2265  24  1431  14 +++++ +++   457   5
lv_wo_snap 16  1481  17 +++++ +++  2100  22  1405  15 +++++ +++   478   6
lv_wo_snap 16  1536  16 +++++ +++  2286  23  1513  17 +++++ +++   458   5
lv_with_sn 16   625   8 +++++ +++  2333  26  1174  12 +++++ +++   460   5


After making snapshots for a LV, the write performance goes down from 75M/s 
to 1.3M/s.

Something must be wrong in LVM.


_________________________________________________________________
The new MSN 8: smart spam protection and 2 months FREE*  
http://join.msn.com/?page=features/junkmail
