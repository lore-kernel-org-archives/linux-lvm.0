From: "Peter A. Castro" <doctor@fruitbat.org>
Subject: Re: Re: [linux-lvm] Installing LVM on s/390 redhat 7.2 2.4.7-39
In-Reply-To: <20030128111907.GA880@tykepenguin.com>
Message-ID: <Pine.LNX.4.21.0301281638500.1848-100000@gremlin.fruitbat.org>
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
Date: Tue Jan 28 18:58:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, 28 Jan 2003, Patrick Caulfield wrote:

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
> See:
> http://www.uwsg.iu.edu/hypermail/linux/kernel/0111.1/0815.html

Excellent!  This looks like the problem.  John, you might just want to
punt and go grab a later 2.4 kernel source (2.4.19?) instead of hashing
with this old one as the later kernels have quite a few fixes in them.
Grab the later LVM source (1.0.6?) while you're at it and build fresh. 

Thanks Patrick for the link!

> patrick

-- 
Peter A. Castro <doctor@fruitbat.org> or <Peter.Castro@oracle.com>
	"Cats are just autistic Dogs" -- Dr. Tony Attwood
