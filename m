From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] [Q]XFS + LVM Snapshot?
Message-ID: <20011119083211.A755@tykepenguin.com>
References: <007201c16f91$a8d49650$fc00a8c0@xp>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <007201c16f91$a8d49650$fc00a8c0@xp>
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
Date: Mon Nov 19 02:30:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Nov 18, 2001 at 02:59:53AM +0900, Sean Oh wrote:
> Hi,
> 
> Kernel: 2.4.15-pre4 with XFS patch ( linux-2.4-xfs CVS tree from SGI site)
> LVM: current - LVM CVS
> 
> Patches applied: linux-2.4.11-VFS-lock.patch from LVM CVS
> 
> 
> I have tried to test the LVM snapshot feature with XFS and encountered the following problem.
> 
> *I can not mount the original FS and snapshot FS at the same time. If I unmount the origianal XFS FS and then mount the snapshot FS, it works, tough.

If you have fairly recent XFS code you should be able to mount the snapshot with
the -onouuid,norecovery options.

patrick
