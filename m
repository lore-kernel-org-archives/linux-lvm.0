From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvm-1.0.1 not working with DAC960/2.2.20
Message-ID: <20011127111424.A8179@sistina.com>
References: <wvbshoy54w.fsf@freeze.oslo.dnmi.no>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <wvbshoy54w.fsf@freeze.oslo.dnmi.no>; from a.phillips@dnmi.no on Tue, Nov 27, 2001 at 09:44:47AM +0100
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
Date: Tue Nov 27 04:13:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Checked it in.

Heinz

On Tue, Nov 27, 2001 at 09:44:47AM +0100, Adrian Phillips wrote:
> 
> The problem seems to be (and I believe GRUB had the same problem) that
> the device name for DAC960 changed from rd to dac960 in 2.4.
> 
> This patch fixes the partition checking code :-
> 
> --- tools/lib/lvm_check_partitioned_dev.c.orig  Tue Nov 27 09:16:03 2001
> +++ tools/lib/lvm_check_partitioned_dev.c       Tue Nov 27 09:42:38 2001
> @@ -140,7 +140,8 @@
>         "md",                   /* Multiple Disk driver (SoftRAID)   */
>         "loop",                 /* Loop device              */
>         "dasd",                 /* DASD disk (IBM S/390, zSeries)      */
> -       "dac960",               /* DAC960              */
> +       "rd",                   /* DAC960 2.2          */
> +       "dac960",               /* DAC960 2.4          */
>         "nbd",                  /* Network Block Device              */
>         "ida",                  /* Compaq SMART2              */
>         "cciss",                /* Compaq CCISS array              */
> 
> 
> Sincerely,
> 
> Adrian Phillips
> 
> -- 
> Your mouse has moved.
> Windows NT must be restarted for the change to take effect.
> Reboot now?  [OK]
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
