Date: Fri, 7 Sep 2001 11:05:34 -0500 (EST)
From: John Marquart <jomarqua@indiana.edu>
Subject: Re: [linux-lvm] lvcreate segfaults
In-Reply-To: <20010906073254.A10735@sistina.com>
Message-ID: <Pine.A41.4.21.0109071104190.38880-100000@gigue.dlib.indiana.edu>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Thanks AJ,
	Me and my trusty ddd had figured out the same thing - that an
extra printf inserted into the function fixed it.  It is a darn weird bug
though.
	Thanks for the link - made a much nicer cleaner patch then my
own. :)

-john


On Thu, 6 Sep 2001, AJ Lewis wrote:

> On Thu, Sep 06, 2001 at 09:00:25AM +0100, Joe Thornber wrote:
> > On Wed, Sep 05, 2001 at 03:37:03PM -0500, AJ Lewis wrote:
> > > On Wed, Sep 05, 2001 at 01:32:34PM -0500, John Marquart wrote:
> > > > 	I am running LVM 1.0.1rc2 on  2.4.8 kernel ontop of a IBM
> > > > Serverraid 4Mx RAID5 filesystem.  I am trying to create a new lv using
> > > > "lvcreate -n foo -L 4M rootvg" - however that command insists on giving me
> > > > a segfault.  
> > > 
> > > Here is a patch that should fix this problem.  It has already been applied
> > > to the CVS.  just save this to a file and apply it to the 1.0.1-rc2 source
> > > with the -p0 flag after cd'ing to the 1.0.1-rc2 directory.
> > 
> > I don't think this patch fixes it, it's just a tidy up.
> 
> Hmm...was looking at this:
> http://lists.sistina.com/pipermail/lvm-devel/2001-September/000637.html
> 
> Sounded like changing the inlines fixed the seg-fault for this guy.  
> 
> John,
> you could also try the patch referred to from that e-mail, but it doesn't
> sound like it's the same problem i guess...
> 
> Regards,
> -- 
> AJ Lewis
> Sistina Software Inc.                  Voice:  612-638-0500
> 1313 5th St SE, Suite 111              Fax:    612-638-0500
> Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
> http://www.sistina.com
> 
> Current GPG fingerprint = 60F3 160D C0D5 2C4B 751B  4FF9 6F67 E9BC 44CD DE95
> 
> -----Begin Obligatory Humorous Quote----------------------------------------
> Programming graphics in X is like finding sqrt(pi) using Roman numerals.
> -----End Obligatory Humorous Quote------------------------------------------
> 


John "Jamie" Marquart		|     This message posted 100% MS free.
Digital Library SysAdmin	|  Work: 812-856-5174   Pager: 812-334-6018
Indiana University Libraries	|  ICQ: 1131494	 	D'net Team:  6265
