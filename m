Return-Path: <bluca@comedia.it>
Date: Sat, 28 Apr 2001 09:59:23 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM on root, Kernel panic: "I have no root and I must scream"
Message-ID: <20010428095923.B4149@colombina.comedia.it>
References: <DC5B1A21E9E7D211B0020090273AD628242BBB@summit15.corvallis.summit>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DC5B1A21E9E7D211B0020090273AD628242BBB@summit15.corvallis.summit>; from Evan.Day@SUMMITSITE.COM on Fri, Apr 27, 2001 at 02:39:12PM -0700
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Apr 27, 2001 at 02:39:12PM -0700, Day, Evan wrote:
> What I really don't get is that I can put a mount /dev/vg00/lvol1 in
> /linuxrc and it mounts!  I can also boot with a root of /dev/sda2 (old root
ok
trick 'im

at the end of linuxrc do
mount /dev/vg00/lvol1 new_root
cd new_root
pivot_root . initrd
exec chroot . sbin/init

be sure to create /initrd dir on your root fs


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
