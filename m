Return-Path: <dmeyer@dmeyer.net>
Date: Mon, 15 Jan 2001 15:33:59 -0500
From: dmeyer@dmeyer.net
Subject: [linux-lvm] hard-lock seems to have caused serious LVM problems
Message-ID: <20010115153359.A10551@jhereg.dmeyer.net>
Mime-Version: 1.0
Content-Disposition: inline
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

In article <20010115172200.A31217@srv.t-online.de> you write:
> On Mon, Jan 15, 2001 at 11:03:58AM -0500, dmeyer@dmeyer.net wrote:
> > Interestingly enough, something seems to have fixed my PVs in the
> > meantime - now they all have every UUID.  Either activating the VG or
> > running vgck must have done it.
> 
> No, it doesn't happen while activating VGs or checking them.
> 
> The following tools call vg_write_with_pv_and_lv() in the library
> which in turn calls pv_write_uuidlist() to do the UUID list update:

Maybe it was calling vgscan on the messed up VG once I managed to get
it online did it, then.  I didn't call any of the others.

> You must have run one of those tools in order to update the UUID list.
> It is still rather interesting what caused the mess you reported in the first
> place.

I wonder if it wasn't somehow related to calling vgscan -d and getting
seg faults in the middle of it.  Or, more likely, running vgscan in
the debugger trying to extract more information about what was going
on.  

In any case, I hope fervantly never to have the opportunity to find
out again :-).

-- 
David M. Meyer
dmeyer@dmeyer.net
