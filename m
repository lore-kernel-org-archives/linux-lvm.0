From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Unable to mount snapshot LV when fs=ext3 on Linux kernel 2.4.20
Message-ID: <20030417125259.GF1082@tykepenguin.com>
References: <3E9EA132.3020902@bull.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3E9EA132.3020902@bull.net>
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
Date: Thu Apr 17 07:53:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Apr 17, 2003 at 02:42:26PM +0200, Michel Seyller wrote:
> Hi,
> 
> Linux Red Hat 9.0 kernel 2.4.20-8
> I have created a ext3 fs on a LVM logical volume : OK.
> create a snapshot on it, trying to mount it :
> 
> [root@linux05 proc]# mount /dev/volume01/snap01 /SNAP
> mount: block device /dev/volume01/snap01 is write-protected, mounting 
> read-only
> mount: wrong fs type, bad option, bad superblock on /dev/volume01/snap01,
>        or too many mounted file systems
> 
> 
> No problem with an ext2 file system.
> 
> Any explanation ? a bug ? a bad patch for VFS locking in the kernel ?

Sounds like the VFS lock patch is not in the RH kernel, or is not patched in
correctly.

-- 

patrick
