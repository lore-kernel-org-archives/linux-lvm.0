From: <jrelist@ntlworld.com>
Subject: Re: Re: [linux-lvm] Installing LVM on s/390 redhat 7.2 2.4.7-39
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20030128110811.OREX14589.mta02-svc.ntlworld.com@[10.137.100.62]>
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
Date: Tue Jan 28 05:09:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Peter A. Castro" <doctor@fruitbat.org>
Cc: linux-lvm@sistina.com

Peter

Still get the problem with kernel 2.4.9-38. I took your advice and checked out the System.map and got this:

000315e8 T lock_kiovec               
00031800 T unlock_kiovec             
00050940 T brw_kiovec                
00068688 T alloc_kiovec_sz           
0006873c T free_kiovec_sz            
001ca412 ? __kstrtab_alloc_kiovec_sz 
001ca430 ? __kstrtab_free_kiovec_sz  
001ca4a4 ? __kstrtab_lock_kiovec     
001ca4be ? __kstrtab_unlock_kiovec   
001ca4da ? __kstrtab_brw_kiovec      
001d1d68 ? __ksymtab_alloc_kiovec_sz 
001d1d70 ? __ksymtab_free_kiovec_sz  
001d1d90 ? __ksymtab_lock_kiovec     
001d1d98 ? __ksymtab_unlock_kiovec   
001d1da0 ? __ksymtab_brw_kiovec      

Strikes me that it could be something (hopefully) as simple as amending labels in the appropriate lvm code - just got to suss out what needs changing now.

Thanks for the advice so far

John


> 
> From: "Peter A. Castro" <doctor@fruitbat.org>
> Date: 2003/01/24 Fri AM 12:31:55 GMT
> To: jrelist@ntlworld.com
> CC: linux-lvm@sistina.com
> Subject: Re: Re: [linux-lvm] Installing LVM on s/390 redhat 7.2 2.4.7-39
> 
> On Thu, 23 Jan 2003 jrelist@ntlworld.com wrote:
> 
> > Peter
> 
> Hi John,
> 
> > I followed the instructions from the LVM how-to to do the configuration
> > and patch. To be safe, each time I tried I re-installed the kernel-source
> > & header rpms (Saving my .config beforehand) then amending the kernel
> > extension in the Makefile before configure / patching, then went through
> > the process in the r/h doc 
> > 
> > make mrproper
> > make config   (actually xconfig)
> 
> You'd missing the 'make dep' step here.  Creating the dependencies is
> important.
> 
> > make clean
> > make image
> > make modules
> > 
> > which would all work very nicely
> 
> You might try saving the output from the 'make image' and 'make modules'
> to see if iobuf.c gets compiled and linked into fs.o
> 
> > then make modules_install which would always give the error.
> > I tried it with config_modversions on and off in the config, no joy. 
> > 
> > I'll try getting the version you have. You mention timer patches - are
> > they significant ? Also, those depmods that cause problems - do you know
> > of anywhere else I might locate them or might need to do during the
> > building of the patch to get them ? 
> 
> The specific version shouldn't matter much, nor should the distro as long
> as it supports S/390.
> I'm not the one who built our systems here, but I'll ask.  I'd assume it
> was the stock distro from SuSE.  Not sure about the timer patches, again
> I'll ask, and in any case it wouldn't help with your module symbol
> resolving problem.
> 
> > Thanks
> > 
> > John
> > 
> > > 
> > > From: "Peter A. Castro" <doctor@fruitbat.org>
> > > Date: 2003/01/23 Thu PM 08:50:33 GMT
> > > To: jrelist@ntlworld.com
> > > Subject: Re: [linux-lvm] Installing LVM on s/390 redhat 7.2 2.4.7-39
> > > 
> > > On Thu, 23 Jan 2003 jrelist@ntlworld.com wrote:
> > > 
> > > > Hi
> > > 
> > > Hi John,
> > > 
> > > > I'm wondering has anybody been able to install LVM onto s/390 Redhat
> > > > Linux 7.2 ? I have kernel 2.4.7-39 running and the rpm for lvm 1.0.3. is
> > > > part of the build, but not the lvm-mod.o module. 
> > > 
> > > We have LVM 0.9.1_beta7 running on SuSE SLES-7.2 (s390) under
> > > a 2.4.7-SuSE-SMP kernel, with some timer patches, at work.
> > > 
> > > > I've attempted rebuilding the kernel from source with patches etc. from
> > > > versions 1.0.3 and 1.0.6 following the instructions from sistina and
> > > > redhat (including enabling lvm support !) but I always fall at the final
> > > > hurdle, when doing the make_install : 
> > > > 
> > > > ---------------------------------------
> > > > cd /lib/modules/2.4.9-37lvm; \
> > > > mkdir -p pcmcia; \
> > > > find kernel -path '*/pcmcia/*' -name '*.o' | xargs -i -r ln -sf ../{} pcmcia
> > > > if [ -r System.map ]; then /sbin/depmod -ae -F System.map  2.4.9-37lvm; fi
> > > > depmod: *** Unresolved symbols in /lib/modules/2.4.9-37lvm/kernel/drivers/md/lvm-mod.o
> > > > depmod:         alloc_kiovec
> > > > depmod:         free_kiovec
> > > > make: *** [_modinst_post] Error 1
> > > > [root@rother-8 linux]#
> > > > ------------------------------------
> > > > 
> > > > If anyone can help me, I'd be grateful. I'm an os/390 guy, this is my
> > > > first dive into the Linux pool and so far I'm enjoying it ! 
> > > 
> > > alloc_kiovec and free_kiovec are part of the fs code and should always be
> > > present.  You should be able to grep for either in the System.map.
> > > 
> > > Did you do a 'make dep' and 'make clean' before doing a 'make all'?  For
> > > that matter, did you do a 'make mrproper' before creating your config
> > > ('make menuconfig')?  Save your existing .config before doing make mrproper!!
> > > 
> > > > Thanks in advance
> > > > John Ellis
> > > > UK
> > > 
> > > -- 
> > > Peter A. Castro <doctor@fruitbat.org> or <Peter.Castro@oracle.com>
> > > 	"Cats are just autistic Dogs" -- Dr. Tony Attwood
> > > 
> > > 
> > 
> 
> -- 
> Peter A. Castro <doctor@fruitbat.org> or <Peter.Castro@oracle.com>
> 	"Cats are just autistic Dogs" -- Dr. Tony Attwood
> 
> 
