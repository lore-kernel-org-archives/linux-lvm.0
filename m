From: "Stephen C. Tweedie" <sct@redhat.com>
Message-Id: <20020408160246.H9970@redhat.com>
References: <3.0.6.32.20020408155317.0090b210@pop3.bmlv.gv.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3.0.6.32.20020408155317.0090b210@pop3.bmlv.gv.at>;
    from marek@bmlv.gv.at on Mon, Apr 08, 2002 at 03:53:17PM +0200
Subject: [linux-lvm] Re: ext3 on an logical volume - snapshot using how?
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
Date: Mon Apr  8 10:02:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Ph. Marek" <marek@bmlv.gv.at>
Cc: ext3-users@redhat.com, linux-lvm@sistina.com

Hi,

On Mon, Apr 08, 2002 at 03:53:17PM +0200, Ph. Marek wrote:
 
> I'm using LVM and ext3 and am very satisfied with it.
> 
> But now I have the following problem:
> I have a filesystem on a LV which is in use -
> files are created, modified and so on.
> To do a backup I'd like to create a snapshot
> of this volume which gets backup'd  and then dropped.

> 	mount: wrong fs type, bad option, bad superblock on /dev/vg/snapshot,
> 	       or too many mounted file systems
> 	> EXT3-fs: INFO: recovery required on readonly filesystem.
> 	> EXT3-fs: write access unavailable, cannot proceed.

> If the snapshot wasn't ro I'd do a tune2fs or e2fsck or something.

There is a "VFS-lock" patch distributed with the LVM sources, which
adds code to LVM to tell filesystems to quiesce themselves for a
snapshot.  This results in a filesystem which can be mounted safely
without recovery.

Ext3 already supports this functionality, but the LVM code in the main
kernel does not have the code to call it.  The VFS-lock patch adds
that code.

Cheers,
 Stephen
