From: Marc Cousin <cousinmarc@free.fr>
Subject: Re: [linux-lvm] lvm2 + linux 2.6.0-test2 + nptl
References: <200307311721.24805.cousinmarc@free.fr> <1059665440.4658.1.camel@chtephan.cs.pocnet.net>
In-Reply-To: <1059665440.4658.1.camel@chtephan.cs.pocnet.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200307311803.30572.cousinmarc@free.fr>
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
Date: Thu Jul 31 11:04:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

hardly, as I don't have strace without /usr ... I'll try that as soon as I can 
...
i'm with gentoo too, did you use the latest glibc 2.3.2-r3 or the latest 
unmasked glibc 2.3.2-r1 ?
I had to edit my 2.3.2-r3 ebuild to make it work with my current compiler 
(gcc3.2, not 3.3)

I'll try to reproduce it and get an strace

On Thursday 31 July 2003 17:30, Christophe Saout wrote:
> Am Do, 2003-07-31 um 17.21 schrieb Marc Cousin:
> > What information can I provide ?
> > kernel is 2.6.0-test2
> > lvm tools are LVM2.2.00.05
> > glibc is 2.3.2, with NPTL 0.55
> >
> > Is it a know problem ?
>
> Exactly the same configuration here (glibc/nptl from the latest Gentoo
> Linux ebuild), I don't see any problems.
>
> Can you strace vgscan?
>
> --
> Christophe Saout <christophe@saout.de>
> Please avoid sending me Word or PowerPoint attachments.
> See http://www.fsf.org/philosophy/no-word-attachments.html
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
   Hobbes : Shouldn't we read the instructions?  
   Calvin : Do I look like a sissy?
