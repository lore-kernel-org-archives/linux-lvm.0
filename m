From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] what is means in /proc/lvm/global
Message-ID: <20030211163150.D10750@sistina.com>
References: <000301c2d06c$99f7e280$0400000a@lenina> <20030210144322.A5997@sistina.com> <001b01c2d111$f54eb320$0400a8c0@venkat>
Mime-Version: 1.0
In-Reply-To: <001b01c2d111$f54eb320$0400a8c0@venkat>; from venkat@storageone.co.kr on Mon, Feb 10, 2003 at 11:37:37PM +0900
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
Date: Tue Feb 11 09:36:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Feb 10, 2003 at 11:37:37PM +0900, abbireddy venkatram reddy wrote:
> Hi all,
> 
>  I want to know some phrases in the 'proc/lvm/global file'.
>  1) what AA means.
>  2) What AWDL means.
>  3) What open means.

man lvm

look for the proc information.

Regards,
Heinz    -- The LVM Guy --

> 
> Please let me know soon..thanks in advance.
> 
> 
> 
> File : /proc/lvm/global
> 
> LVM driver LVM version 1.0.5+(22/07/2002)
> 
> Total:  2 VGs  4 PVs  4 LVs (4 LVs open 4 times)
> 
> Global: 112657 bytes malloced   IOP version: 10   6:37:38 active
> 
> VG:  vg01  [3 PV, 3 LV/3 open]  PE Size: 65536 KB
>   Usage [KB/PE]: 60358656 /921 total  13434880 /205 used  46923776 /716 free
>   PVs: [AA] rd/c0d0p5             41091072 /627      8257536 /126
> 32833536 /501
>        [AA] rd/c0d0p6             11141120 /170      5177344 /79
> 5963776 /91
>        [AA] rd/c0d0p7              8126464 /124            0 /0
> 8126464 /124
>     LVs: [AWDL  ] lv01                       5177344 /79       1x open
>          [AWDL  ] lv02                       3080192 /47       1x open
>          [AWDL  ] lv03                       5177344 /79       1x open
> 
> VG:  vg90  [1 PV, 1 LV/1 open]  PE Size: 32768 KB
>   Usage [KB/PE]: 833159168 /25426 total  204800000 /6250 used  628359168
> /19176 free
>   PV:  [AA] sda2                  833159168 /25426   204800000 /6250
> 628359168 /19176
>     LV:  [AWDL  ] opt                      204800000 /6250     1x open
> 
> 
> With Regards
> venkat.

<SNIP>

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
