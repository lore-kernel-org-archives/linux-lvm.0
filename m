From: Herbert =?iso-8859-1?Q?P=F6tzl?= <herbert@13thfloor.at>
Message-ID: <20030827153352.GC7896@www.13thfloor.at>
References: <20030827144240.GB4737@www.13thfloor.at> <20030827145743.GR473@fib011235813.fsnet.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030827145743.GR473@fib011235813.fsnet.co.uk>
Subject: [linux-lvm] Re: devmapper-ioctl 2.4.21 ...
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
Date: Wed Aug 27 10:58:11 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Thornber <thornber@sistina.com>
Cc: linux-lvm@sistina.com

On Wed, Aug 27, 2003 at 03:57:43PM +0100, Joe Thornber wrote:
> On Wed, Aug 27, 2003 at 04:42:40PM +0200, Herbert P?tzl wrote:
> > 
> > Hi!
> > 
> > stumbled over the following code:
> > 
> > +	/* Don't update times for block devices using O_DIRECT */
> > +	if (!(file->f_flags & O_DIRECT) || !S_ISBLK(inode->i_mode)) {
> > +		inode->i_ctime = inode->i_mtime = CURRENT_TIME;
> > +		mark_inode_dirty_sync(inode);
> > +	}
> > 
> > but [A:] S_ISBLK() should be true if the inode is a block device
> > [B:] (file->f_flags & O_DIRECT) should be true if O_DIRECT is requested
> > 
> > !(A || !B)  ==  (!A && B) (De Morgan)
> 
> but it's actually
> (!A ||!B)
> 

*argl*, okay, simply didn't see it ... sorry for the noise ...

thanks for the quick response ...

ahh, by the way, updated the devmapper-ioctl for 2.4.22 final,
are you interrested in the rediff?

best,
Herbert

> - Joe
