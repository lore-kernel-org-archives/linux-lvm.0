From: <jrelist@ntlworld.com>
Subject: Re: Re: [linux-lvm] Installing LVM on s/390 redhat 7.2 2.4.7-39
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20030130115503.LFHJ14589.mta02-svc.ntlworld.com@[10.137.100.62]>
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
Date: Thu Jan 30 05:56:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Well, it's kind of working now ! I followed the link, got the patch. I patched lvm 1.0.6 to my kernel, ended up having to manually change lvm-snap.c, went throught the build and IPL'd successfully !

However, I'm now faced with another problem. After creating, then extending a VG, a subsequent vgscan gives 'segmentation error' and a pvscan now says the vg the devices are connected to is unknown. The rpm installed for the lvm utilities is 1.0.3-10, and from searching the lists I believe I need an updated version of VGSCAN. I know there won't be a binary available for s/390 redhat at 1.0.6 level, but I'd like to what would be the best SRPMS to get - I've seen a couple of different versions but nothing specifically mentioned as for a Redhat distro.

Thanks for your help so far, nearly there.... !

John



> 
> From: Patrick Caulfield <caulfield@sistina.com>
> Date: 2003/01/28 Tue AM 11:19:07 GMT
> To: linux-lvm@sistina.com
> Subject: Re: Re: [linux-lvm] Installing LVM on s/390 redhat 7.2 2.4.7-39
> 
> On Tue, Jan 28, 2003 at 11:08:11AM +0000, jrelist@ntlworld.com wrote:
> > 
> > Peter
> > 
> > Still get the problem with kernel 2.4.9-38. I took your advice and checked out the System.map and got this:
> > 
> > 000315e8 T lock_kiovec               
> > 00031800 T unlock_kiovec             
> > 00050940 T brw_kiovec                
> > 00068688 T alloc_kiovec_sz           
> > 0006873c T free_kiovec_sz            
> > 001ca412 ? __kstrtab_alloc_kiovec_sz 
> > 001ca430 ? __kstrtab_free_kiovec_sz  
> > 001ca4a4 ? __kstrtab_lock_kiovec     
> > 001ca4be ? __kstrtab_unlock_kiovec   
> > 001ca4da ? __kstrtab_brw_kiovec      
> > 001d1d68 ? __ksymtab_alloc_kiovec_sz 
> > 001d1d70 ? __ksymtab_free_kiovec_sz  
> > 001d1d90 ? __ksymtab_lock_kiovec     
> > 001d1d98 ? __ksymtab_unlock_kiovec   
> > 001d1da0 ? __ksymtab_brw_kiovec      
> > 
> > Strikes me that it could be something (hopefully) as simple as amending labels in the appropriate lvm code - just got to suss out what needs changing now.
> > 
> > Thanks for the advice so far
> > 
> > John
> 
> This is quite an old problem (but then 2.4.9 is an old kernel I suppose!)
> 
> See:
> 
> http://www.uwsg.iu.edu/hypermail/linux/kernel/0111.1/0815.html
> 
> patrick
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
