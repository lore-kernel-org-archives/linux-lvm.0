Date: Sat, 25 Aug 2001 13:13:29 +1000
From: Nathan Scott <nathans@sgi.com>
Subject: Re: [linux-lvm] LVM, rawio, ext2?
Message-ID: <20010825131329.B337103@wobbly.melbourne.sgi.com>
References: <20010823014012.A32700@greenhydrant.com> <46CEA578.B03DDD14@qis-systemhaus.de> <20010824194456.A25251@greenhydrant.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010824194456.A25251@greenhydrant.com>; from dbr@greenhydrant.com on Fri, Aug 24, 2001 at 07:44:56PM -0700
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

hi,

On Fri, Aug 24, 2001 at 07:44:56PM -0700, David Rees wrote:
> On Fri, Aug 24, 2007 at 11:31:36AM +0200, Dirk Heinrichs wrote:
> > David Rees wrote:
> > > 
> > > Hi,
> > > 
> > > I'd like to create an ext2 filesystem over a raw io device, is this even
> > > possible?  (If not, skip the rest of this message! ;-)
> >
> > Why do you want to do that?
> > 
> > These are two opposite things. One uses a raw device where an
> > application has it's own storage layout, like databases.
> > 
> > If you just want to make shure that your files on an ext2 are written
> > immediately, then mount with sync option.
> 
> Well, the version of Sybase I'm running (11.9.2) does not support Linux raw
> partitions.  Sybase 12.5 reportedly does, but I have a number of servers
> running 11.9.2 and don't want to upgrade yet.
> 
> Sybase 11.9.2 only supports database data put onto filesystems on Linux, so
> I was hoping to create a situation where writes to the filesystem would not
> be buffered by the operating system since Sybase has it's own buffers. 
> 
> Buffering IO to the filesystem also has the nasty side-effect of putting
> increased VM pressure on the system and with 2.4.X kernels this leads to
> poor performance.  (See the threads on linux-kernel describing huge
> slowdowns with Oracle and 2.4.x when moving from 2.2.x).
> 
> Until I can validate my applications on Sybase 12.5 using rawio, I was
> looking for a way to prevent filesystem IO from being buffered.
> 
> If anyone has any ideas, let me know!
> 

Does Sybase use O_DIRECT? (Direct I/O) - if so, you can use a
filesystem which supports this (like XFS) to achieve what you
describe above.

I understand some database vendors recommend this above raw I/O
because its easier to backup (using filesystem backup tools).

cheers.

-- 
Nathan
