From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] problem in /proc/lvm/global help please..
Message-ID: <20030225163023.E832@sistina.com>
References: <F119Oc0Ne0PaLI9mK6P0000568f@hotmail.com> <000e01c2d651$a9c4b090$0400a8c0@venkat> <001501c2d945$90db30d0$0400a8c0@venkat>
Mime-Version: 1.0
In-Reply-To: <001501c2d945$90db30d0$0400a8c0@venkat>; from venkat@storageone.co.kr on Fri, Feb 21, 2003 at 10:07:12AM +0900
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
Date: Tue Feb 25 09:36:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

You can retrieve the information about the physical size of the snapshot
using the tools only.

Regards,
Heinz    -- The LVM Guy --

On Fri, Feb 21, 2003 at 10:07:12AM +0900, abbireddy venkatram reddy wrote:
> Hi all,
> 
> 
>  I am reading information of lvms from the /proc/lvm directory.
> 
>  but the snapshot size is shown as same size as lv if I create with lesses size of lv also.
> 
>  can anybody help me please.
> 
>  thanks in advance.
>  eg.
> 
> file information: /proc/lvm/global
> 
> VG:  vg01  [2 PV, 2 LV/2 open]  PE Size: 65536 KB
>   Usage [KB/PE]: 52232192 /797 total  3866624 /59 used  48365568 /738 free
>   PVs: [AA] rd/c0d0p5             41091072 /627      3080192 /47      38010880 /580
>        [AA] rd/c0d0p6             11141120 /170            0 /0       11141120 /170
>     LVs: [AWDL  ] lv01                       3080192 /47       1x open
>          [ARDL  ] lv01_snap0217_1550         3080192 /47       1x open
> 
> 
>  output from the lvscan :
> 
> lvscan -- ACTIVE   Original "/dev/vg01/lv01" [2.94 GB]
> lvscan -- ACTIVE   Snapshot "/dev/vg01/lv01_snap0217_1550" [767.25 MB] of /dev/vg01/lv01
> 
> Please help me. what is the reason?. is kernel problem?
> 
> with regards
> venkat.
> 
>   ----- Original Message ----- 
>   From: abbireddy venkatram reddy 
>   To: linux-lvm@sistina.com 
>   Sent: Monday, February 17, 2003 3:56 PM
>   Subject: [linux-lvm] problem in /proc/lvm/global help please..
> 
> 
>   Hi all,
> 
> 
>    I am reading information of lvms from the /proc/lvm directory.
> 
>    but the snapshot size is shown as same size as lv if I create with lesses size of lv also.
> 
>    can anybody help me please.
> 
>    thanks in advance.
>    eg.
> 
>   file information: /proc/lvm/global
> 
>   VG:  vg01  [2 PV, 2 LV/2 open]  PE Size: 65536 KB
>     Usage [KB/PE]: 52232192 /797 total  3866624 /59 used  48365568 /738 free
>     PVs: [AA] rd/c0d0p5             41091072 /627      3080192 /47      38010880 /580
>          [AA] rd/c0d0p6             11141120 /170            0 /0       11141120 /170
>       LVs: [AWDL  ] lv01                       3080192 /47       1x open
>            [ARDL  ] lv01_snap0217_1550         3080192 /47       1x open
> 
> 
>    output from the lvscan :
> 
>   lvscan -- ACTIVE   Original "/dev/vg01/lv01" [2.94 GB]
>   lvscan -- ACTIVE   Snapshot "/dev/vg01/lv01_snap0217_1550" [767.25 MB] of /dev/vg01/lv01
> 
>   Please help me. what is the reason?. is kernel problem?
> 
>   with regards
>   venkat.
> 
> 
> 
> 
> 

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
