From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: [linux-lvm] resize reiserfs
Message-ID: <20011122233620.A1319@backtop>
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
Date: Thu Nov 22 14:35:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

hello !

> Hi,
> I need to resize my lv /dev/store/data now.
> 
> I already added the 2nd HD (/dev/hdc1) to the vg store using vgextend
> and extended the lv using lvextend.
> 
> Now I need to extend the reiserfs I got on this lv. I seached the web
> and found the resize_reiserfs perl-script, but if I try it, I only get
> this msg:
> $#: ./resize_reiserfs --size +50G --lv /dev/store/data --dry-run          
> 
>   only 0 free PE's (0 K) left on VG store
> 
> Sure, I already added the PE?s to the lv.
> What to do?

seems perl script tries extend lv again.

use resize_reiserfs from reiserfsprogs (3.x.0j or better) package,
just type 
	resize_reiserfs /dev/store/data

it detects block device size and expands the file system as needed.

--
Alex.
