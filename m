From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] df reporting incorrect size?
Message-ID: <20020708211350.GI11345@kluge.net>
References: <3D29FD25.5050902@jumpline.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3D29FD25.5050902@jumpline.com>
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
Date: Mon Jul  8 16:13:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jul 08, 2002 at 04:59:17PM -0400, Ben Snyder wrote:
> Filesystem            Size  Used Avail Use% Mounted on
> /dev/spheravg/spheralv
>                              59G   20k   56G   0% /test
> 
> 
> WTF?!?!  Where'd that 3G go?  Does LVM mess with things so that the OS 
> cant read volumes correctly?  Or is there another issue that I might be 
> running into?

This isn't a LVM question, it's a filesystem question....  Specifically:

$ man mke2fs
...
       -m reserved-blocks-percentage
              Specify the percentage of the filesystem blocks reserved for the super-user.
              This value defaults to 5%.
...

So 5% of 59GB is ~3GB.  59-3 = 56GB available.

As you can tell, 5% is huge.  For non-root/OS filesystems, I almost
always set that to 0.  Look at tune2fs to see how to do that without
recreating the FS.

-- 
Randomly Generated Tagline:
Real theology is always rather shocking to people who already
 think they know what they think.  I'm still shocked myself.  :-)
              -- Larry Wall in <199708261932.MAA05218@wall.org>
