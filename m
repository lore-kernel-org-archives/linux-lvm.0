From: "Peter A. Castro" <doctor@fruitbat.org>
Subject: Re: Re: [linux-lvm] Installing LVM on s/390 redhat 7.2 2.4.7-39
In-Reply-To: <20030130115503.LFHJ14589.mta02-svc.ntlworld.com@[10.137.100.62]>
Message-ID: <Pine.LNX.4.21.0301300846120.2585-100000@gremlin.fruitbat.org>
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
Date: Thu Jan 30 11:04:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, 30 Jan 2003 jrelist@ntlworld.com wrote:

> Well, it's kind of working now ! I followed the link, got the patch. I
> patched lvm 1.0.6 to my kernel, ended up having to manually change
> lvm-snap.c, went throught the build and IPL'd successfully ! 

Hmmm.. this is why I suggested getting the latest standard kernel for 2.4
as it'll have the latest fixes already applied.  It doesn't have to be a
RedHat blessed kernel, ya know :)  The kernel is still just the kernel
reguardless of which distro it came with.

> However, I'm now faced with another problem. After creating, then
> extending a VG, a subsequent vgscan gives 'segmentation error' and a
> pvscan now says the vg the devices are connected to is unknown. The rpm
> installed for the lvm utilities is 1.0.3-10, and from searching the lists
> I believe I need an updated version of VGSCAN. I know there won't be a
> binary available for s/390 redhat at 1.0.6 level, but I'd like to what
> would be the best SRPMS to get - I've seen a couple of different versions
> but nothing specifically mentioned as for a Redhat distro. 

As Patrick mentioned in another reply, there isn't any official SRPM, but
the .tar source is readily downloadable and buildable from sistina.com.
If you really prefer a SRPM, I have one for LVM 1.0.5 and 1.0.6 that I
put together for a PPC port.  It's not from Red Hat, but it should build
reguardless (or at least with a minimum of hacking).  You are welcome to
download and try build it.  Let me know.  If you aren't familiar with
build SRPMs, then I highly suggest going for the .tar instead.

> Thanks for your help so far, nearly there.... !

Keep at it!

> John
> 
> 
> 
> > 
> > From: Patrick Caulfield <caulfield@sistina.com>
> > Date: 2003/01/28 Tue AM 11:19:07 GMT
> > To: linux-lvm@sistina.com
> > Subject: Re: Re: [linux-lvm] Installing LVM on s/390 redhat 7.2 2.4.7-39
> > 
> > On Tue, Jan 28, 2003 at 11:08:11AM +0000, jrelist@ntlworld.com wrote:
> > > 
> > > Peter
> > > 
> > > Still get the problem with kernel 2.4.9-38. I took your advice and checked out the System.map and got this:
> > > 
> > > 000315e8 T lock_kiovec               
> > > 00031800 T unlock_kiovec             
> > > 00050940 T brw_kiovec                
> > > 00068688 T alloc_kiovec_sz           
> > > 0006873c T free_kiovec_sz            
> > > 001ca412 ? __kstrtab_alloc_kiovec_sz 
> > > 001ca430 ? __kstrtab_free_kiovec_sz  
> > > 001ca4a4 ? __kstrtab_lock_kiovec     
> > > 001ca4be ? __kstrtab_unlock_kiovec   
> > > 001ca4da ? __kstrtab_brw_kiovec      
> > > 001d1d68 ? __ksymtab_alloc_kiovec_sz 
> > > 001d1d70 ? __ksymtab_free_kiovec_sz  
> > > 001d1d90 ? __ksymtab_lock_kiovec     
> > > 001d1d98 ? __ksymtab_unlock_kiovec   
> > > 001d1da0 ? __ksymtab_brw_kiovec      
> > > 
> > > Strikes me that it could be something (hopefully) as simple as amending labels in the appropriate lvm code - just got to suss out what needs changing now.
> > > 
> > > Thanks for the advice so far
> > > 
> > > John
> > 
> > This is quite an old problem (but then 2.4.9 is an old kernel I suppose!)
> > 
> > See:
> > 
> > http://www.uwsg.iu.edu/hypermail/linux/kernel/0111.1/0815.html
> > 
> > patrick
> > 
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

-- 
Peter A. Castro <doctor@fruitbat.org> or <Peter.Castro@oracle.com>
	"Cats are just autistic Dogs" -- Dr. Tony Attwood
