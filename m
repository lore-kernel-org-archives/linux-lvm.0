From: Benjamin Scott <bscott@ntisys.com>
Subject: Re: [linux-lvm] Initrd, usefull ?
In-Reply-To: <1005754193.3bf29751422a4@imp.free.fr>
Message-ID: <Pine.LNX.4.33.0111141125090.19303-100000@dragon.inside.ntisys.com>
MIME-Version: 1.0
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
Date: Wed Nov 14 10:23:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, 14 Nov 2001, Georges Giralt wrote:
> But once this is done, what will the initrd be used for ?

  initrd (initial ramdisk) is generally used to load dynamic modules needed
to mount the root filesystem.  So your LVM, filesystem, storage controller,
and any other needed drivers are all compiled statically into the kernel,
you should be all set.

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |
