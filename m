From: "Steve Wray" <steve.wray@paradise.net.nz>
Subject: RE: [linux-lvm] Again (still?): File size limit exceeded
Message-Id: <NBBBKLKHMJHIJLHOGAOJEEKAJDAA.steve.wray@paradise.net.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.21.0201170118120.2118-100000@yaq.axel.ma>
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
Date: Wed Jan 16 18:28:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of lvm@xbits.de
> 
> On Wed, 16 Jan 2002, Andreas Dilger wrote:
> 
[snip]
> > Kernel + libc bug.  You need to log in directly as root (no "su",
> > no "sudo") and you must not have any ulimits set.  Even if you try
> > to set your ulimit to "unlimited" (and even if it shows "unlimited")
> > it is really 2GB.

CRIPES!

So how on earth does one set it to *really* be unlimited??
Obviously making it *say* its unlimited doesn't work...

(I got this problem trying to dd a 5G partition into
a file)


> > 
> > You can also upgrade to 2.4.18-pre2+ or glibc-2.2 to fix this.
> 
> Thanks for your helpful reply. Just one last short question: Until I can
> upgrade my libc or my kernel, if I created this 2GB+ LV's on the console,
> can I use them or should they generally be at most 2GB?
> 
> Many thanks in advance,
> Axel
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
