From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] Mandrake 8.1 and LVM
Message-ID: <NBBBKLKHMJHIJLHOGAOJOEDKJCAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20011130020118.C17482@wookimus.net>
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
Date: Fri Nov 30 02:40:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Chad C. Walstrom
>
> On Thu, Nov 29, 2001 at 07:09:20PM -0500, Theo Van Dinter wrote:
> > My rule of thumb for disk layout on a server is:
> > 	/boot	- Small, usually 32-128MB, don't run out of space here.
>
> Good.
>
> > 	/	- I put /usr in here since there's no reason not to any
> > 		  longer.  So this will be any size you think is
> > 		  appropriate.	I will usually put anywhere from 4-8GB
> > 		  here, depending on disk size.  These files should be
> > 		  static-ish, no major changed here.  Don't let it hit 100%.
>
> Reason #1:  Mount /usr as read-only.  There is only one reason why you

ONLY if you also have /usr/share (for one, there may be others) on writeable
partitions!!!


> That being said, I suppose there's not a whole lot holding you back from
> mounting "/" as read-only, either.  Perhaps /etc/mtab would be an
> annoyance, but if you symbolically link it to /proc/mounts, you could
> fake it.

surely theres more than that in /etc that needs to be writeable?
hmmmm doesn't /lib/modules/<something to do with module dependencise>
need to be writeable too?
