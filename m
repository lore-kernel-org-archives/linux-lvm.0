From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Problem copying device files to an LVM volume
Message-Id: <20020116223907.A31167@colombina.comedia.it>
References: <00a001c19eca$aca6cec0$38c8a8c0@caladanxp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00a001c19eca$aca6cec0$38c8a8c0@caladanxp>; from
    dwilliams@garfield.storage.com on Wed, Jan 16, 2002 at 03:16:25PM -0500
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
Date: Wed Jan 16 15:40:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Don Williams <dwilliams@garfield.storage.com>
Cc: linux-lvm@sistina.com

On Wed, Jan 16, 2002 at 03:16:25PM -0500, Don Williams wrote:
>     When I copy device driver files files via NFS to a LVM volume they
>    are "interpreted" instead of copied.  The
>    
>    result is that when the copy hits the sda driver it starts copying the
>    entire contents of /dev/sda drive!  Instead

1) you should not post in html to mailing lists, fix you MUA
2) this is not an LVM related question but an UNIX related one
3) never use cp to copy special files, use cpio or tar instead as in
	cd /source/dir
	find . -xdev -print0 | cpio -0padumv /destination/dir
4) nfsv2 does not support mknod syscal (AFAIR), so you should either be sure
you are using nfsv3 or you better use cpio on a rsh pipe
	sourcehost# cd /source/dir
	sourcehost# find . -xdev -print0 | cpio -0oadumv | rsh desthost "cd /destination/dir && cpio -iadumv"

L.
-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
