Date: Mon, 3 Jul 2000 15:05:24 +0100
From: "Stephen C. Tweedie" <sct@redhat.com>
Subject: Re: [linux-lvm] ReiserFS/XFS/JFS, LVM, Raid5
Message-ID: <20000703150524.E2931@redhat.com>
References: <B45465FD9C23D21193E90000F8D0F3DF6834F1@mailsrv.linkvest.ch>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <B45465FD9C23D21193E90000F8D0F3DF6834F1@mailsrv.linkvest.ch>; from Jean-Eric.Cuendet@linkvest.com on Wed, Jun 28, 2000 at 11:21:30AM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Eric Cuendet <Jean-Eric.Cuendet@linkvest.com>
Cc: linux-lvm@msede.com, Stephen Tweedie <sct@redhat.com>

Hi,

On Wed, Jun 28, 2000 at 11:21:30AM +0200, Jean-Eric Cuendet wrote:
> 
> > > 	Currently you cannot put journaled filesystems on a software 
> > > raid I believe, because they use the buffer cache in incompatible 
> > > ways.  If I am wrong, someone correct me.  Ext2 (what I use) works
> > > fine. 
> > 
> > I'm using etx3 on top of 20GB raid0 for over an year with no 
> > problem...
> 
> In fact, if you have ext3 and a crash, in the worst case, journal will be
> out of sync (In the case of writes were not like the filesystems thought due
> to LVM)

No, LVM never lies in any way which will confuse a journaling
filesystem.  The block remapping which happens inside LVM does not
result, ever, in early I/O completion notifications.

The only known problem with journaling and software raid is to do with
the raid array rebuild code in raid1/5.  The rebuild could cause I/O
to be done in the wrong order for the filesystem, causing clean blocks
in the buffer cache to be flushed to disk as part of the rebuild.
That is fixed in the 2.4 soft raid.  raid0 and LVM were never affected
by this as they have no rebuild operation.

Cheers,
 Stephen
