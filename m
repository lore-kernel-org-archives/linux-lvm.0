Message-Id: <200109161731.NAA11318@erez.physics.lsa.umich.edu>
From: dwchin@umich.edu
In-reply-to: <20010916025223.1CA035E041@oscar.casa.dyndns.org> 
References: <200109160203.WAA10814@erez.physics.lsa.umich.edu> <200109160207.WAA10835@erez.physics.lsa.umich.edu> <20010916025223.1CA035E041@oscar.casa.dyndns.org>
Mime-Version: 1.0
Date: Sun, 16 Sep 2001 13:31:44 -0400
Subject: [linux-lvm] Re: pvcreate dumping core with 2.4.10-pre9
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

In message <20010916025223.1CA035E041@oscar.casa.dyndns.org>, Ed Tomlinson writ
es:
> On September 15, 2001 10:07 pm, dwchin@umich.edu wrote:
> > Oh, a couple of details: I'm running RedHat 7.1 (except for the kernel
> > update as mentioned in previous message).  And gdb says that lvcreate is
> > getting a segmentation fault at lv_create_remove.c:42
> >
> > 42      inline int lv_create ( vg_t *vg, lv_t *lv, char *lv_name) {
> 
> 
> The jist of the above it to look at the LVM patch generated for 2.4.10pre9 and
> change and lines begining with "+" that contain "min(" or "max(" to "min_t(" 
> or > "max_t(" respectivily.
> 

I should have mentioned that I ran into this problem when compiling the module, 
so I edited lvm.c and lvm-snap.c to use min_t() and max_t().

I also just started having problems with my aic7xxx module.  I'm thinking I may 
have missed something in the kernel and/or module compilation.  Am trying 
another pass at it.

--Dave
