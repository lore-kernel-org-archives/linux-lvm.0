From: Adrian Head <ahead@bigpond.net.au>
Subject: Re: [linux-lvm] Newbie VFS-lock question
References: <20020819214738.LPNS1621.imf03bis.bellsouth.net@TAZ2>
In-Reply-To: <20020819214738.LPNS1621.imf03bis.bellsouth.net@TAZ2>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E17gybK-00042E-00@hermes.sistina.com>
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
Date: Mon Aug 19 21:19:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Greg Freemyer <freemyer@NorcrossGroup.com>
Cc: linux-lvm@sistina.com

Gday Greg,

On Tue, 20 Aug 2002 07:44, Greg Freemyer wrote:
> Hello all,
>
> I'm new to LVM, but I want to be able to use the snapshot feature with a
> XFS filesystem.
>
> I tried
>
>   xfs_freeze -f
>   lvcreate --snapshot
>   xfs_freeze -u
>
> but it was not a reliable solution, and lvcreate would often lock up until
> I executed a xfs_freeze -u on another ssh session.
>
> Adrian Head recommended I use the VFS-lock patch instead of xfs_freeze to
> accomplish my goal of reliable snapshots.
>
> Since I'm new to LVM, I'm not sure what I need to do.
>
> I'm running SuSE 8.0 with there 2.4.18-231 kernel.  This is based on the
> 2.4.19pre1aa1 kernel with some extra patches.  They also have a test kernel
> based on 2.4.19aa1.

First is to issue a "lvm version" and please let me know of the results.

> Both have some level of LVM in them, but I don't know which specific
> version.
>
> Would either of these have the VFS-lock patch already included, or do I
> need to get the SRPM for one of the above, get the VFS-lock patch from
> somewhere and apply the patch?

Not sure - we'll have to work it out.  The easiest way is to comment out the 
xfs_freeze above and still run the script - if you are able to mount the 
resulting snapshot then you most likely have the VFS-lock patch.

> If so, where do I get the patch?

From either the tarballs or from CVS.

> Also, once I get an appropriate kernel, do I need to do anything to invoke
> this feature prior to creating a snapshot, or is it automatic?

The VFS-lock is automatic - it deals with the writing out of pending I/O 
before the snapshot is writen.
>
>
> Greg Freemyer
> Internet Engineer
> Deployment and Integration Specialist
> Compaq ASE - Tru64 v4, v5
> Compaq Master ASE - SAN Architect
> The Norcross Group
> www.NorcrossGroup.com
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 
Adrian Head

(Public Key available on request.)
