Message-ID: <20010911011612.37371.qmail@web13407.mail.yahoo.com>
Date: Mon, 10 Sep 2001 18:16:12 -0700 (PDT)
From: Pierre Lamb <plamb_98@yahoo.com>
Subject: Re: [linux-lvm] rc2 problems
In-Reply-To: <20010910132133.F31313@sistina.com>
MIME-Version: 1.0
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

Here is what I did:
  Built patch, then applied it I got this
 it patched various file, next it said it detected a
provious patch I said (y) then it wanted to remove a
file not detected.

Next I did a xconfig selecting LVM. did a make dep
then a make clean did a make bzImage, then a make
modules ( no errors), then make modules_install there
at the en it gave an error :

Unsolved sysmbols in (path)lvm-mod.o

depmod  lvm_init_fs
depmod  lvm_fs_remove.vg
depmod  lvm_fin_fs
depmod  lvm_fs_remove_lv
depmod  lvm_fs_remove_pv
depmod  lvm_fs_create_vg
depmod  lvm_fs_create_lv
depmod  lvm_fs_create_pv

know what ???

Pierre


--- "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
wrote:
> On Fri, Sep 07, 2001 at 06:07:38AM -0700, Pierre
> Lamb wrote:
> > Well I got rh 2.4.7 made the rc2 patches and
> patched
> > the kernel. No errors, complied the kernel,
> modules,
> > and installed the modules. All with no errors.
> Upon
> > booting the lvm-mod modules doesn't load so I did
> a
> > insmod on lvm-mod and get errors about
> non-resloved
> > symbols,  What to do next????
> 
> Could you send what symbols are non resolved?
> 
> > 
> > PIerre
> > 
> > __________________________________________________
> > Do You Yahoo!?
> > Get email alerts & NEW webcam video instant
> messaging with Yahoo! Messenger
> > http://im.yahoo.com
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> >
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at
> http://www.sistina.com/lvm/Pages/howto.html
> 
> -- 
> 
> Regards,
> Heinz    -- The LVM Guy --
> 
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to
> solve them ***
> 
>
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> Heinz Mauelshagen                                
> Sistina Software Inc.
> Senior Consultant/Developer                       Am
> Sonnenhang 11
>                                                  
> 56242 Marienrachdorf
>                                                  
> Germany
> Mauelshagen@Sistina.com                          
> +49 2626 141200
>                                                     
>   FAX 924446
>
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at
http://www.sistina.com/lvm/Pages/howto.html



__________________________________________________
Do You Yahoo!?
Get email alerts & NEW webcam video instant messaging with Yahoo! Messenger
http://im.yahoo.com
