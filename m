Date: Sat, 25 Aug 2001 12:34:53 -0600
From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] LVM, rawio, ext2?
Message-ID: <20010825123453.A20447@lynx.no>
References: <20010823014012.A32700@greenhydrant.com> <46CEA578.B03DDD14@qis-systemhaus.de> <20010824194456.A25251@greenhydrant.com> <20010825131329.B337103@wobbly.melbourne.sgi.com> <20010824214131.A26364@greenhydrant.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010824214131.A26364@greenhydrant.com>; from dbr@greenhydrant.com on Fri, Aug 24, 2001 at 09:41:31PM -0700
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
To: David Rees <dbr@greenhydrant.com>, linux-lvm@sistina.com

On Aug 24, 2001  21:41 -0700, David Rees wrote:
> Getting off-topic now, but as far as I know, no.  Is it possible to use
> chattr or some other tool to force it to open in O_DIRECT mode?

You can get per-file synchronous I/O behaviour by using 'chattr +s <file>'.
This is not quite the same as O_DIRECT, because it still buffers the data.

Cheers, Andreas
-- 
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
