From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [linux-lvm] vgscan and initrd
Message-ID: <20030703035030.GB16773@www.13thfloor.at>
References: <200306272113.h5RLDD7E020638@ruby.ridersoft.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200306272113.h5RLDD7E020638@ruby.ridersoft.net>
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
Date: Wed Jul  2 22:51:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Mark de Ruijter <lvm@ruby.ridersoft.net>

On Fri, Jun 27, 2003 at 11:13:13PM +0200, Mark de Ruijter wrote:
> I tried to do that just now. 
> Sadly, it didn't work. Still vgscan doesn't see any volume group at all. So once again, kernel panic strikes.
> 
> This is so frustrating :) I mean, the livecd things boot just fine, but it absolutly refuses to boot to that lvm.
> 
> Any more suggestions ?

are you sure that the device nodes for the physical
volumes are present? (in case of doubt, try with devfs
and mount at boot option ;)

just an idea ...

best,
Herbert

> "Mark H. Wood" <mwood@IUPUI.Edu> wrote ..
> > Your follow-up makes it sound as though you have a different problem from
> > mine, but I can answer your question about mounting tmpfs over /etc:
> > 
> >   mount -t tmpfs tmpfs /etc
> > 
> > You wind up with an empty /etc, but at that point there should be no
> > problem.  vgscan just wants some place to store a metadata backup which
> > you are going to throw away, and after pivot-root runs you'll have a
> > different /etc anyway.  If the Gentoo startup scripts are like Red Hat's,
> > they'll do a second LVM metadata backup into the "real" /etc later.
> > 
> > -- 
> > Mark H. Wood, Lead System Programmer   mwood@IUPUI.Edu
> > MS Windows *is* user-friendly, but only for certain values of "user".
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
