From: Herbert =?iso-8859-1?Q?P=F6tzl?= <herbert@13thfloor.at>
Subject: Re: [linux-lvm] Block-Level Backup
Message-ID: <20030807134451.GA30494@www.13thfloor.at>
References: <1060247670.28307.37.camel@rocky> <20030807093631.GE381@fib011235813.fsnet.co.uk> <1060260466.4360.2.camel@chtephan.cs.pocnet.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1060260466.4360.2.camel@chtephan.cs.pocnet.net>
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
Date: Thu Aug  7 08:45:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Saout <christophe@saout.de>
Cc: linux-lvm@sistina.com, Joe Thornber <thornber@sistina.com>

On Thu, Aug 07, 2003 at 02:47:46PM +0200, Christophe Saout wrote:
> Am Do, 2003-08-07 um 11.36 schrieb Joe Thornber:
> 
> > > but it'll be great if there's a tool,
> > > that supoorts block-level increment backup....
> > 
> > Icremental backup would be good, from the kernel side all you'd need
> > is a dm target that records which blocks have changed - anyone
> > interested in coding this ?
> 
> I'm still here. ;-)
> 
> You already wrote something like this. I was thinking about it. Perhaps
> we could do some brainstorming how to exactly do this, not from the
> programming side, I could find that out myself, but from the "output"
> side.
> 
> Which options, what data format, what gets logged and where.

IMHO dm isn't required and not very useful, if for
example you want to do something like incremental
backups, you'll probably end up doing towers of
hanoi with changing intervals.

anyway, as pointed out in another response, there is
no good way, at least none I know of, to find the
blocks changed since the last backup ...

 - one could make checksums over blocks
   store them, and compare them later ...
 - there could be a blockdevice change journal
   extension, where block accesses are stored
   with time/date (100GB storage with 4k blocks
   would still require ~100MB change journal)

on the other hand, maybe the 'original' backup
could be used to find the differences, if it
can be accessed somehow (this requires at least
twice the size of your block device ...

this is not an issue for something like block
rsync, because you can easily compare source and
destination (live system and backup) either via
checksums or byte per byte ...

IMHO, compression and encryption are useful features
too, but YMMV

best,
Herbert
