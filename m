From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Red Hat upgrade over existing LVM
Message-Id: <20020407102856.GB12349@colombina.comedia.it>
References: <3CAE9F23.3C58CB1E@vtc.edu.hk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3CAE9F23.3C58CB1E@vtc.edu.hk>
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
Date: Sun Apr  7 05:28:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM <linux-lvm@sistina.com>

to various points in the thread
upgrading by hand might be a choice
	rpm -Fvh /mnt/cdrom/RedHat/RPMS/*.rpm
	note the missing dependencies
	rpm -Uvh /all/the/dependencies/you/found.rpm
	rpm -Fvh /mnt/cdrom/RedHat/RPMS/*.rpm

i was able to upgrade from rh6.1 to 6.2 once upon a time by fiddling with up2date

mandrake has good lvm support, albeit they stubbornly refused to add lvm-root support
to 8.2

redhat has lvm support in rawhide, it also has lvm-root support with mkinitrd, dunno
about the installer

mandrake cd1 is a nice rescue disk it has support for about every filesystem on earth
(even if i would have liked ntfs r/w support).
It does not support raid or LVM, on 8.1 it also had the tendencxy to mount one of the mirrors
of your root partition, instead of the whole mirror
i found easier to recover from problems with raid/lvm by booting the mandrake cd in install
mode and switching to a shell as soon as possible.

regards
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
