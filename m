From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] PV Status NOT available
Message-ID: <20030211163014.C10750@sistina.com>
References: <000801c2d0e8$91e8d320$0d01a8c0@aphrodite> <20030210143353.A5958@sistina.com> <004e01c2d119$ce050be0$0d01a8c0@aphrodite>
Mime-Version: 1.0
In-Reply-To: <004e01c2d119$ce050be0$0d01a8c0@aphrodite>; from rupert.hair@ntlworld.com on Mon, Feb 10, 2003 at 03:33:44PM -0000
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
Date: Tue Feb 11 09:34:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Feb 10, 2003 at 03:33:44PM -0000, Rupert Hair wrote:
> 
> > do all 3 PVs show up active (the [] following 'PV:' should contain 'AA'
> > unless you set a PV to inallocatable) in /proc/lvm/global ?
> LVM driver LVM version 1.0.5(15/07/2002)
> 
> Total:  1 VG  3 PVs  1 LV (1 LV open 1 times)
> 
> Global: 179278 bytes malloced   IOP version: 10   5 days 1:33:43 active
> 
> VG:  datavg  [3 PV, 1 LV/1 open]  PE Size: 32768 KB
>   Usage [KB/PE]: 357171200 /10900 total  357171200 /10900 used  0 /0 free
>   PVs: [AA] hdg1                  119996416 /3662    119996416 /3662
> 0 /0
>        [AA] hde1                  119996416 /3662    119996416 /3662
> 0 /0
>        [AA] hdf1                  117178368 /3576    117178368 /3576
> 0 /0
>     LV:  [AWDL  ] datalv                   357171200 /10900    1x open
> 
> Looks like Patrick and I have the same problem.  Thanks for your help Heinz.

Hmmm, pretty od really. pvdisplay calls the pv_status() lib function
which retrieves the information from the kernel. That's why i asked for
the proc output which shows that the PVs are _active_ and allocatable.

Wait, need to preserve the core flags to make this work...

Could you test if the following patch to pvdisplay.c helps ?

diff -u -B -u -r1.25 pvdisplay.c
--- tools/pvdisplay.c   6 Feb 2003 15:05:30 -0000       1.25
+++ tools/pvdisplay.c   11 Feb 2003 15:31:51 -0000
@@ -42,6 +42,7 @@
  *    06/02/2002 - cope with changed pv_get_size() return cast
  *    07/02/2002 - fixes for > 1TB support
  *    17/02/2002 - avoid pv_get_size() altogether
+ *    11/02/2002 - fixed bug preventing correct 'active' status displayed [HM]
  *
  */

@@ -231,7 +232,8 @@
          return LVM_EPVDISPLAY_PV_CHECK_CONSISTENCY;
       }

-      /* restore the from disk pointer */
+      /* restore the from disk pointer _but_ preserve kernel status */
+      pv_from_disk->pv_status = pv->pv_status;
       pv = pv_from_disk;

       if ( opt_c == 0) {


> 
> Rupert
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

Regards,
Heinz    -- The LVM Guy --

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
