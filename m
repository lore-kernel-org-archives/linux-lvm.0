Date: Tue, 2 Oct 2001 09:24:04 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] segmentation fault problems
Message-ID: <20011002092404.A13002@sistina.com>
References: <E15oBO3-00035u-00@hermes.sistina.com> <3BB94718.30441CCA@adelaide.edu.au>
Mime-Version: 1.0
In-Reply-To: <3BB94718.30441CCA@adelaide.edu.au>; from sean.burford@adelaide.edu.au on Tue, Oct 02, 2001 at 02:18:24PM +0930
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

You are suffering from a previously reported compiler flaw.

Regards,
Heinz    -- The LVM Guy --

On Tue, Oct 02, 2001 at 02:18:24PM +0930, Sean Burford wrote:
> Henning Hogue wrote:
> > 
> > I have been having a problem getting the LVM working due to lvcreate causing a
> > segmentation fault when it's run. I am running redhat 7.1 on a SMP system with
> > kernel 2.4.9. I have had the same problem with versions 1.0.1rc2 and the CVS
> > code. A copy of the output from the command /sbin/lvcreate -d -l1000 -ntestlv
> > volume_1  2> debug.out is available at http://www.randomfactor.net/~henning/deb
> > ug.out
> 
> This sounds like the lvcreate problem I am seeing.  I modified
> lvcreate.c to use lv_create_remove() rather than the lv_create() inline,
> as illustrated below, and it worked.
> 
> This suggests a problem with the lv_create() inline in
> lib/lv_create_remove.c.  gdb shows that it is messing up the three
> parameters vg, lv and lv_name.
> 
> *** tools/lvcreate.c    Thu Jul 26 00:22:19 2001
> --- tools.patched/lvcreate.c    Tue Oct  2 14:14:27 2001
> ***************
> *** 788,794 ****
>      /* create it in kernel */
>      if ( opt_v > 0)
>         printf ( "%s -- creating logical volume VGDA in kernel\n", cmd);
> !    if ( ( ret = lv_create ( vg, vg->lv[l], vg->lv[l]->lv_name)) < 0) {
>         fprintf ( stderr,
>                   "%s -- ERROR \"%s\" creating VGDA for \"%s\" in
> kernel\n",
>                           cmd, lvm_error ( ret), lv_name_ptr);
> --- 788,794 ----
>      /* create it in kernel */
>      if ( opt_v > 0)
>         printf ( "%s -- creating logical volume VGDA in kernel\n", cmd);
> !    if ( ( ret = lv_create_remove ( vg, vg->lv[l], vg->lv[l]->lv_name,
> LV_CREATE)) < 0) {
>         fprintf ( stderr,
>                   "%s -- ERROR \"%s\" creating VGDA for \"%s\" in
> kernel\n",
>                           cmd, lvm_error ( ret), lv_name_ptr);
> 
> 
> -- 
> Sean Burford    x34135
> ITS Systems Specialist
> Adelaide University
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
