From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Help!  VG corrupted?
Message-ID: <20011126231649.U730@lynx.no>
References: <1006197162.28796.26.camel@outback.key> <20011120113607.A18529@sistina.com> <1006830613.2791.27.camel@outback.key>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1006830613.2791.27.camel@outback.key>; from kf4wbx@hamsnet.net on Mon, Nov 26, 2001 at 10:10:03PM -0500
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
Date: Tue Nov 27 00:15:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben <kf4wbx@hamsnet.net>
Cc: linux-lvm@sistina.com

On Nov 26, 2001  22:10 -0500, Ben wrote:
> I will try to get a newer version of LVM installed this week and give
> you the response from vgck.
> 
> BTW, is it safe for me to just use the 1.0.1rc4 utils and kernel on a VG
> created with the 0.9 release?

Well, it's broken already, isn't it?  In any case, it _should_ be OK to
run a newer kernel and/or newer tools (separately or together, although
obviously newer everything is preferred).  Whether that actually fixes
your problems depends on whether the on-disk data is totally fsck'd up,
and whether you can restore it and get it working or not.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
