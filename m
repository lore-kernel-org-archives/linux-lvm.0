From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] BMT-LVM performance with snapshots
Message-ID: <20030130102935.B26745@sistina.com>
References: <F80oe73FqS0XrPoqxBJ00008bbe@hotmail.com>
Mime-Version: 1.0
In-Reply-To: <F80oe73FqS0XrPoqxBJ00008bbe@hotmail.com>; from benew666@hotmail.com on Thu, Jan 30, 2003 at 12:30:32AM +0900
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
Date: Thu Jan 30 03:32:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

This is to be expected in principal but _not_ in this order of magnitude.
Did you allcoate the original and the snapshot logical volumes on the
same physical device?
If so, this means that you trash different areas of that device
with additional read+write ios per write to the original LV.
Change this to see better performanace.

FYI: LVM1 deals with snapshots in a synchronous way which can be outperformed
     by LVM2s asynchronous design.

Regards,
Heinz    -- The LVM Guy --


On Thu, Jan 30, 2003 at 12:30:32AM +0900, tester7 A. wrote:
> 
> Kernel: 2.4.20
> LVM: 1.0.6 with kernel patched(VFS-lock and lvm-1.0.6)
> CPU: PIII 1.4
> RAM: 512M
> 
> This is the output from bonnie++ with lv only and with lv + snapshot
> 
> Version  1.03      ------Sequential Output------ --Sequential Input- 
> --Random-
>                     -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- 
> --Seeks--
> Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec 
> %CP
> lv_wo_snap 2G           78505  32 41745  27           151742  41 435.4   1
> lv_wo_snap 2G           75501  31 40277  25           150466  42 436.8   1
> lv_wo_snap 2G           73933  29 41213  26           150052  41 433.4   1
> lv_wo_snap 2G           76434  30 40980  26           147544  41 399.0   0
> lv_with_sn 2G            1367   0 10196   6           128362  35 437.4   1
>                     ------Sequential Create------ --------Random 
> Create--------
>                     -Create-- --Read--- -Delete-- -Create-- --Read--- 
> -Delete--
> files:max:min        /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec 
> %CP
> lv_wo_snap 16  1669  17 +++++ +++  2532  23  1464  17 +++++ +++   475   5
> lv_wo_snap 16  1572  17 +++++ +++  2265  24  1431  14 +++++ +++   457   5
> lv_wo_snap 16  1481  17 +++++ +++  2100  22  1405  15 +++++ +++   478   6
> lv_wo_snap 16  1536  16 +++++ +++  2286  23  1513  17 +++++ +++   458   5
> lv_with_sn 16   625   8 +++++ +++  2333  26  1174  12 +++++ +++   460   5
> 
> 
> After making snapshots for a LV, the write performance goes down from 75M/s 
> to 1.3M/s.
> 
> Something must be wrong in LVM.
> 
> 
> _________________________________________________________________
> The new MSN 8: smart spam protection and 2 months FREE*  
> http://join.msn.com/?page=features/junkmail
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
