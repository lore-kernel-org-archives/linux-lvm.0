Date: Tue, 30 Mar 2004 15:19:12 -0800
From: Dave Olien <dmo@osdl.org>
Subject: Re: [linux-lvm] LVM2 scalability within volume group
Message-ID: <20040330231912.GA20397@osdl.org>
References: <20040317173637.GA2126@osdl.org>
	<20040317120005.C31599@homer.msp.redhat.com>
	<20040322224145.GA26571@osdl.org>
	<20040326163403.F17377@homer.msp.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040326163403.F17377@homer.msp.redhat.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: agk@redhat.com
Cc: linux-lvm@redhat.com


Thanks for the feedback.  I'll be experimenting more with this over the
next few weeks.  I'd love to try changes as they come available.

Dave Olien

On Fri, Mar 26, 2004 at 04:34:03PM -0600, Alasdair G Kergon wrote:
> On Mon, Mar 22, 2004 at 02:41:45PM -0800, Dave Olien wrote:
> > Can these user-level commands be made smarter in this regard?
> 
> Yes.  
>   (a) Additional internal state can be written to the cache file.
>       [The index of which PVs are in which VGs; the index of which
>        UUIDs were found on which devices.]
>   (b) Some disk reads are still duplicated and can be cached safely.
> 
> > Is this something that using the lvm(8) shell would help?  
> 
> Yes, this is equivalent to point (a).
> Either pipe the commands through it, or try linking against
> the library I checked into CVS today.  
> (configure --enable-cmdlib;  brief docn in lvm2cmd.h)
> 
> Quick example prog below.
> 
> 
> #include "lvm2cmd.h"
>  
> /* All output gets passed to this function line-by-line */
> void test_log_fn(int level, const char *file, int line, const char *format)
> {
> 	/* Extract and process output here instead of printing it */
> 
>         if (level != 4)
>                 return;
>  
>         printf("%s\n", format);
>         return;
> }
>  
> int main(int argc, char **argv)
> {
>         void *handle;
>         int r;
>  
>         lvm2_log_fn(test_log_fn);
>  
>         handle = lvm2_init();
>  
>         lvm2_log_level(handle, 1);
>         r = lvm2_run(handle, "vgs --noheadings vg1");
> 
> 	/* More commands here */
>  
>         lvm2_exit(handle);
>  
>         return r;
> }
>  
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
