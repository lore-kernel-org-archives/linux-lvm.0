From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200004191950.VAA05852@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] [Patch] lvchange better error reporting
In-Reply-To: <20000415203514.A21662@home.ds9a.nl> from bert hubert at "Apr 15, 2000  8:35:15 pm"
Date: Wed, 19 Apr 2000 21:50:03 +0200 (MEST)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: bert hubert <ahu@ds9a.nl>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com


Applied.

Regards,
Heinz

> Heinz, people,
> 
> It annoyed me that lvchange sometimes reported that volume group "(null)"
> was invalid. This patch fixes this behaviour. Please apply.
> 
> diff -u -r 0.8final.orig/tools/lvchange.c 0.8final/tools/lvchange.c
> --- 0.8final.orig/tools/lvchange.c	Tue Feb 22 03:09:33 2000
> +++ 0.8final/tools/lvchange.c	Sat Apr 15 20:32:34 2000
> @@ -255,9 +255,15 @@
>        /* does VG exist? */
>        if ( opt_v > 0) printf ( "%s -- checking volume group existence\n", cmd);
>        if ( lvm_tab_vg_check_exist ( vg_name, NULL) != TRUE) {
> -         fprintf ( stderr, "%s -- can't change logical volume: volume group "
> -                           "\"%s\" doesn't exist\n\n", cmd, vg_name);
> -         return LVM_ELVCHANGE_VG_CHECK_EXIST;
> +        
> +         if(vg_name)
> +            fprintf ( stderr, "%s -- can't change logical volume: volume group "
> +                 "\"%s\" doesn't exist\n\n", cmd, vg_name);
> +         else
> +            fprintf ( stderr, "%s -- can't change logical volume: need to specify "
> +                              "volume group\n\n", cmd);
> +                              
> +         return LVM_ELVCHANGE_VG_CHECK_EXIST;
>        }
>  
>        if ( opt_v > 0) printf ( "%s -- checking for active volume "
> 
> -- 
>                        |              http://www.rent-a-nerd.nl
>                        |                     - U N I X -
>                        |          Inspice et cautus eris - D11T'95
> 


-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement TS                              T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
