Return-Path: <austin@coremetrics.com>
Message-ID: <85063BBE668FD411944400D0B744267A481A88@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] LVM problems
Date: Tue, 19 Jun 2001 14:28:05 -0500
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

Why in the hell is this NOT in the source tree by default. This has really
got be boggled. I've seen tons of others have this proble, I've had this
problem, and still it doesn't seem to get itself into the tree. Is this
because it is a temporary problem or something?

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com 

> -----Original Message-----
> From: AJ Lewis [mailto:lewis@sistina.com]
> Sent: Tuesday, June 19, 2001 2:24 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] LVM problems
> 
> 
> On Tue, Jun 19, 2001 at 11:27:11AM -0600, Andreas Dilger wrote:
> > I could have sworn this problem was fixed already, but 
> maybe only in CVS?
> > Time for a new patch release I guess.  As someone else 
> already mentioned,
> > simply change get_hardblocksize to get_hardsect_size() in lvm.c.
> 
> I dropped a patch on the FTP site:
> ftp://ftp.sistina.com/pub/LVM/0.9.1_beta/lvm_0.9.1_beta7-get_h
> ardblocksize.patch
> 
> apply this to your LVM source tree and regenerate the kernel patch.
> 
> Regards,
> -- 
> AJ Lewis
> Sistina Software Inc.                  Voice:  612-638-0500
> 1313 5th St SE, Suite 111              Fax:    612-638-0500
> Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
> http://www.sistina.com
> 
> Current GPG fingerprint = 3B5F 6011 5216 76A5 2F6B  52A0 941E 
> 1261 0029 2648
> Get my key at: http://www.sistina.com/~lewis/gpgkey
>  (Unfortunately, the PKS-type keyservers do not work with 
> multiple sub-keys)
> 
> -----Begin Obligatory Humorous 
> Quote----------------------------------------
> A)bort, R)etry, I)nfluence with large hammer.
> -----End Obligatory Humorous 
> Quote------------------------------------------
> 
