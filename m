From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <199912311946.UAA16976@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] lvextend
Date: Fri, 31 Dec 1999 20:46:02 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com
Cc: mge@ez-darmstadt.telekom.de


Another problem could be, that you have 3 stripes and not enough space
on a physical volume to hold the soize of one or more extended stripes.

Heinz


> Adam Crews <acrews@cisco.com> wrote:
> 
> > Yes I do want one big lv.  I used lvm so that as I add disks I can just
> > grow the fs without needing to re-do md devices or things like that.
> 
> > What I figured out is that you cannot extend a striped lv.  even if I have
> > 2 partitions to add to a lv that has 2 stripes, I still cant extend the
> > volume.
> 
> Are you using 0.7 ? There is a bug that avoids extending striped lvs under
> some circumstances. Update to 0.8i or apply the following diff
> 
> --- pv_move.c.orig	Thu Dec 30 22:10:44 1999
> +++ pv_move.c	Thu Dec 30 22:11:25 1999
> @@ -254,7 +254,7 @@
>  
>        for ( pe = 0; pe < pe_to_move; pe++) {
>           if ( lv_check_on_pv ( vg->pv[dst_pv_index],
> -                               pe_src[pe].lv_num - 1) == TRUE &&
> +                               pe_src[pe].lv_num) == TRUE &&
>                vg->lv[pe_src[pe].lv_num-1]->lv_stripes > 1) break;
>           if ( ( vg->lv[pe_src[pe].lv_num-1]->lv_allocation & LV_CONTIGUOUS) &&
>                pv_check_free_contiguous ( vg->pv[dst_pv_index],
> 
> 
> Torsten
> 

-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
