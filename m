From: Eric Sandeen <sandeen@sgi.com>
In-Reply-To: <20020822214631.CUZO1228.imf06bis.bellsouth.net@TAZ2>
References: <20020822214631.CUZO1228.imf06bis.bellsouth.net@TAZ2>
Content-Transfer-Encoding: 7bit
Message-Id: <1030053519.10702.9.camel@stout.americas.sgi.com>
Mime-Version: 1.0
Subject: [linux-lvm] Re: Summary - Snapshot Effort
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
Date: Thu Aug 22 17:01:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Greg Freemyer <freemyer@norcrossgroup.com>
Cc: xfs mailing list <linux-xfs@oss.sgi.com>, LVM Mailing list <linux-lvm@sistina.com>

On Thu, 2002-08-22 at 16:43, Greg Freemyer wrote:
> All,
> 
> I have not been successful at getting reliable Read-Only snapshots of XFS via LVM.  Since XFS is being used in Enterprise quality applications, I suggest this is a major shortcoming that should be prioritized.
> 
> BTW: Are there any snapshot related tests in the XFS regression tests?

No, there aren't.  Frankly, snapshot has not gotten a lot of attention
lately.

> When a failure occurs the lvcreate --snapshot command will freeze up.    

If that's the failure, looking at a kdb backtrace of the "stuck" process
would be helpful, and might give us an idea of where to look.

Testing a CVS kernel for the same behavior would also be a good
datapoint.
 
> A manually entered xfs_freeze -u will release the lvcreate.  (The VFS-lock patch effectively is calling xfs_freeze -f internally prior to starting the snapshot process.)

> FYI: Adrian Head believes that the VFS-lock patch is more reliable than not having it and wrapping the lvcreate --snapshot call with explicit xfs_freeze calls.  I have not tried that.

If things are working as intended, that should not be the case - the end
result should be that xfs runs the same code, whether you did it via a
manual userspace command, or the automatic vfs-lock patch.

Sending some debug output from kdb would help - but also, take a look at
that list of work Steve posted today, and realize that there are lots of
things going on at the moment.  :)

Thanks,
-Eric


-- 
Eric Sandeen      XFS for Linux     http://oss.sgi.com/projects/xfs
sandeen@sgi.com   SGI, Inc.         651-683-3102
