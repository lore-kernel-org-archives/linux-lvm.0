Message-Id: <199902180900.AA26287@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Problems on compile
Date: Thu, 18 Feb 1999 10:00:51 MET
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


> 
> Ok, it seems it is fixed by re-arranging liblvm.h a little. Heinz sent me
> this a while back.
> 
> I suspect this was your problem as well.
> 
> --- 0.5alpha/tools/lib/liblvm.h Sat Jan 30 13:46:35 1999
> +++ 0.6alpha/tools/lib/liblvm.h Mon Feb  1 00:54:29 1999
> @@ -46,10 +46,6 @@
>  #  endif
>  #endif
> 
> -#include <sys/ioctl.h>
> -#include <linux/genhd.h>
> -#include <linux/major.h>
> -
>  #if __GLIBC__ > 1
>  #  ifndef uint8_t
>  #    define uint8_t    u_int8_t
> @@ -97,6 +93,10 @@
>  #  include <malloc.h>
>  #  include <stdio.h>
>  #endif /* __GLIBC__ > 1 */
> +
> +#include <sys/ioctl.h>
> +#include <linux/genhd.h>
> +#include <linux/major.h>
> 
>  #include <lvm.h>
> 

Thank you Shawn.

It's concerned with BSD disk label support.
I never choosed that config option ;*)

It will be in 0.6alpha anyway.

BTW: hope to bring out 0.6alpha including some features and
     bug fixes before march.

Heinz
--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement C/S                             Deutsche Telekom AG
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement C/S                             Deutsche Telekom AG
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
