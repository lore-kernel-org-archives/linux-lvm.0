From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvmcreate_initrd: depmod without -F?
Message-ID: <20031009132355.GE11071@tykepenguin.com>
References: <1065625602.7061.42.camel@pc>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1065625602.7061.42.camel@pc>
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
Date: Thu Oct  9 08:24:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Oct 08, 2003 at 11:06:42AM -0400, Brian J. Murrell wrote:
> I am trying to create an LVM aware initrd on Debian stable (a.k.a.
> Woody, 3.0) and running into a problem.  The problem is so basic though,
> that I must be missing something somewhere else.
> 
> I have built and installed a new kernel, but not yet booted it (because
> I need the initrd to boot it).  When I try to create the initrd with
> "lvmcreate_initrd <KVER>" it complains:
> 
> lvmcreate_initrd -- ERROR running depmod
> 
> When I try to run depmod just as the script does (depmod -a <KVER>) it
> indeed does error out with a bunch of unresolved symbols.  But they are
> symbols provided by the kernel and hence the command "depmod -F
> /boot/System.map-<KVER> <KVER>" is successful.
> 
> How/why does this work for everyone else?  If this were a bug (not
> passing the System.map to depmod) as I outline it above, surely it would
> have been fixed by now.

It has, but it's not in Debian stable, it's in Debian testing and unstable.

patrick
