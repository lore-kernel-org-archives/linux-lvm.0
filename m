From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM Root
Message-ID: <20030122083853.GA21169@percy.comedia.it>
References: <1043113906.3e2ca7b2864b6@mail.serviceweb.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1043113906.3e2ca7b2864b6@mail.serviceweb.net>
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
Date: Wed Jan 22 02:38:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

On Mon, Jan 20, 2003 at 08:51:46PM -0500, tlove@serviceweb.net wrote:
>VFS: Mounted root reiserfs filesystem) readonly
>Trying to move old root to /initrd ... failed
try creating a /initrd directory (i suppose this is a pivot_root call
which fails).
>Unmounting old root
i wonder what is it unmounting since pivot_root failed can you send the
/linuxrc code
>Trying to free ramdisk memory ... okay
>mount_dev_fs(): unable to mount devfs, err: -2
dunno, hope it comes from an error before
>Freeing unused kernel memory: 120k freed
>Warning: unable to open an initial console.
yep it could'nt mount dev in the above step
>Kernel panic: No init found.  Try passing init= option to kernel.
....

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
