From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] resize reiserfs
Message-ID: <20011122130248.L1308@lynx.no>
References: <20011122203009.A557@sky.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011122203009.A557@sky.net>; from U.Wiederhold@gmx.net on Thu, Nov 22, 2001 at 08:30:10PM +0100
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
Date: Thu Nov 22 14:01:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ulrich Wiederhold <U.Wiederhold@gmx.net>
Cc: linux-lvm@sistina.com

On Nov 22, 2001  20:30 +0100, Ulrich Wiederhold wrote:
> I already added the 2nd HD (/dev/hdc1) to the vg store using vgextend
> and extended the lv using lvextend.
> 
> Now I need to extend the reiserfs I got on this lv. I seached the web
> and found the resize_reiserfs perl-script, but if I try it, I only get
> this msg:
> $#: ./resize_reiserfs --size +50G --lv /dev/store/data --dry-run          
> 
>   only 0 free PE's (0 K) left on VG store

It looks like the resize_reiserfs script is trying to do LVM operations
internally, and then doing the resize afterwards.  However, this is
terribly confusing, because the resize_reiserfs _program_ has the same
name.  You should get resize_reiserfs with the other reiserfs tools,
but I'm not sure whether it is compiled and installed by default.

I would suggest just reducing the LV to the original size, or not using
a relative size but an absolute size (so it doesn't try to grow the
LV), and continue to use the script.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
