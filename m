Return-Path: <austin@coremetrics.com>
Message-ID: <85063BBE668FD411944400D0B744267A6433B5@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] Mounting LVM volume with set UID and GID? (REPOST
	 )
Date: Thu, 12 Jul 2001 14:20:37 -0500
MIME-Version: 1.0
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

To clarify this, When I try mounting with the options uid=xxx,gid=xxx,rw
I cannot mount the volume. I get a mount error. Nothing out of the ordinary,
just that it can't "read supberblock", but if I mount it without those
options, it's just fine. 

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com 

> -----Original Message-----
> From: Gonyou, Austin [mailto:austin@coremetrics.com]
> Sent: Thursday, July 12, 2001 2:17 PM
> To: 'linux-lvm@sistina.com'
> Subject: RE: [linux-lvm] Mounting LVM volume with set UID and GID?
> (REPOST )
> 
> 
> > I'm using an XFS LVM volume of about 18GB, and it will be 
> > available for HTTP
> > and FTP. So, I want my ownership, and reading/writing files, 
> > to be as such:
> > ls -ld /somedirectory
> > drwxr-xr-x 	6 	web	ftp	4	somedirectory	
> > 
> > But mounted that way, not just owned that way. 
> > -- 
> > Austin Gonyou
> > Systems Architect, CCNA
> > Coremetrics, Inc.
> > Phone: 512-796-9023
> > email: austin@coremetrics.com 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
