Date: Fri, 24 Aug 2001 19:44:56 -0700
From: David Rees <dbr@greenhydrant.com>
Subject: Re: [linux-lvm] LVM, rawio, ext2?
Message-ID: <20010824194456.A25251@greenhydrant.com>
References: <20010823014012.A32700@greenhydrant.com> <46CEA578.B03DDD14@qis-systemhaus.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46CEA578.B03DDD14@qis-systemhaus.de>; from heinrichs@qis-systemhaus.de on Fri, Aug 24, 2007 at 11:31:36AM +0200
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

On Fri, Aug 24, 2007 at 11:31:36AM +0200, Dirk Heinrichs wrote:
> David Rees wrote:
> > 
> > Hi,
> > 
> > I'd like to create an ext2 filesystem over a raw io device, is this even
> > possible?  (If not, skip the rest of this message! ;-)
>
> Why do you want to do that?
> 
> These are two opposite things. One uses a raw device where an
> application has it's own storage layout, like databases.
> 
> If you just want to make shure that your files on an ext2 are written
> immediately, then mount with sync option.

Well, the version of Sybase I'm running (11.9.2) does not support Linux raw
partitions.  Sybase 12.5 reportedly does, but I have a number of servers
running 11.9.2 and don't want to upgrade yet.

Sybase 11.9.2 only supports database data put onto filesystems on Linux, so
I was hoping to create a situation where writes to the filesystem would not
be buffered by the operating system since Sybase has it's own buffers. 

Buffering IO to the filesystem also has the nasty side-effect of putting
increased VM pressure on the system and with 2.4.X kernels this leads to
poor performance.  (See the threads on linux-kernel describing huge
slowdowns with Oracle and 2.4.x when moving from 2.2.x).

Until I can validate my applications on Sybase 12.5 using rawio, I was
looking for a way to prevent filesystem IO from being buffered.

If anyone has any ideas, let me know!

Thanks,
Dave
