From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] LVM ext3 and lvreduce
Message-ID: <20021113165953.GB9930@clusterfs.com>
References: <1037195718.3126.4.camel@corr11.doc.state.vt.us>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1037195718.3126.4.camel@corr11.doc.state.vt.us>
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
Date: Wed Nov 13 11:02:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joseph Kezar <jkezar@doc.state.vt.us>
Cc: Linux LVM Sistina <linux-lvm@sistina.com>

On Nov 13, 2002  08:55 -0500, Joseph Kezar wrote:
> I have LVM working, and I have created all my logical volumes for my
> environment.  All of my logical volumes have been mkfs.ext3'd. 
> Everything works, except for when I try to change the size with lvreduce
> or lvextend.  These tools are happy to work, but when I remount my
> logvols and type: mount I see that in fact the size that is reported to
> the OS has not changed.
> 
> Is there any incompatabilities with LVM and Ext3?  

No - ext3 is totally independent of LVM, except if you are doing snapshots.

> Is there a comparable tool for ext3 like e2fsadm?

Yes, e2fsadm.

> Is it possible to resize an ext3 partition while it is online?

Yes, but you need a new kernel patch and ext2online tools from CVS.
Find both at http://sourceforge.net/projects/ext2resize/

This is beta code now (i.e. we don't know of any bugs), excluding the
fact that ext2prepare doesn't work yet, so you can't online resize
past the next 16GB boundary unless you created a new filesystem with
the patched "mke2fs -O resize_inode" (patch at same place).

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/
