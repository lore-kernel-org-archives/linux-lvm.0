From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] FYI - Red Hat 7.2 and LVM module
Message-ID: <20020529133650.G20426@kluge.net>
References: <OFE8C7233D.E443DB74-ON86256BC8.005050DC@lsu.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OFE8C7233D.E443DB74-ON86256BC8.005050DC@lsu.edu>; from mlambe7@lsu.edu on Wed, May 29, 2002 at 10:32:59AM -0500
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
Date: Wed May 29 12:37:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, May 29, 2002 at 10:32:59AM -0500, Michael K Lambert wrote:
> This causes the rc.sysinit test to fail and LVM is not initialized. Of
> course, it is simple to work around this. I changed rc.sysinit to test for
> /proc/lvm OR the existence of the lvm-mod, and that seemed to work fine.
> This is just an FYI so that others in similar circumstances can avoid any
> confusion.

My solution to this was that when I made my initrd using mkinitrd, I add a
"--with=lvm-mod" option.  That force-loads lvm-mod before init kicks in,
so /proc/lvm will exist when the check occurs.

-- 
Randomly Generated Tagline:
"the real ttys became pseudo ttys and vice-versa." - Today's BOFH Excuse
