Date: Fri, 24 Aug 2001 21:41:31 -0700
From: David Rees <dbr@greenhydrant.com>
Subject: Re: [linux-lvm] LVM, rawio, ext2?
Message-ID: <20010824214131.A26364@greenhydrant.com>
References: <20010823014012.A32700@greenhydrant.com> <46CEA578.B03DDD14@qis-systemhaus.de> <20010824194456.A25251@greenhydrant.com> <20010825131329.B337103@wobbly.melbourne.sgi.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010825131329.B337103@wobbly.melbourne.sgi.com>; from nathans@sgi.com on Sat, Aug 25, 2001 at 01:13:29PM +1000
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

On Sat, Aug 25, 2001 at 01:13:29PM +1000, Nathan Scott wrote:
> hi,
> 
> Does Sybase use O_DIRECT? (Direct I/O) - if so, you can use a
> filesystem which supports this (like XFS) to achieve what you
> describe above.
> 
> I understand some database vendors recommend this above raw I/O
> because its easier to backup (using filesystem backup tools).

Getting off-topic now, but as far as I know, no.  Is it possible to use
chattr or some other tool to force it to open in O_DIRECT mode?

-Dave
