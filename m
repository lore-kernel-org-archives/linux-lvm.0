Return-Path: <alden@math.ohio-state.edu>
Date: Thu, 26 Jul 2001 08:16:33 -0400
From: Dave Alden <alden@math.ohio-state.edu>
Subject: Re: [linux-lvm] Upgrade to 0.9.1b8 went ok but....
Message-ID: <20010726081633.A11299@math.ohio-state.edu>
References: <85063BBE668FD411944400D0B744267A643517@AUSMAIL>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <85063BBE668FD411944400D0B744267A643517@AUSMAIL>; from austin@coremetrics.com on Wed, Jul 25, 2001 at 04:57:06PM -0500
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

Hi,

  Are you aware that the XFS folks modified LVM to work with XFS (something
about a new ioctl or such)?  They state that if you install the latest
patches, you'll back out the XFS-specific changes which can cause you to
lose your XFS filesystem.  For more info, see the thread with a subject
of "When LVM-0.9.1beta7 will be merged to XFS cvs tree?" from:

http://oss.sgi.com/projects/xfs/mail_archive/0107/threads.html#00127

My understanding is that this applies to any LVM patches (including the beta8
patches).

...dave alden

On Wed, Jul 25, 2001 at 04:57:06PM -0500, Gonyou, Austin wrote:
> The Devices won't mount for some reason. Here is the ouput I get from trying
> to mount an XFS LVM Volume:
> 
> -----snip-----
> [root@BurnBox /root]# mount -t xfs /dev/web/webvol1 /web/            
> mount: wrong fs type, bad option, bad superblock on /dev/web/webvol1,
>        or too many mounted file systems                              
> [root@BurnBox /root]# xfs_check /dev/web/webvol1                     
> xfs_check: unexpected XFS SB magic number 0x484d0200                 
> bad superblock magic number 484d0200, giving up                      
> [root@BurnBox /root]#                                                
> -----snip-----
> 
> If I run xfs_repair, it can't find the superblock either. 
> 
> -- 
> Austin Gonyou
> Systems Architect, CCNA
> Coremetrics, Inc.
> Phone: 512-796-9023
> email: austin@coremetrics.com 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
