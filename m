Return-Path: <austin@coremetrics.com>
Message-ID: <85063BBE668FD411944400D0B744267A481A8D@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] LVM problems
Date: Tue, 19 Jun 2001 17:42:34 -0500
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

Ahhh..that explains a lot. My sincere apologies. I was not aware that it was
fixed in CVS. I'd never seen anyone be referenced to that. Thanks for info.

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com 

> -----Original Message-----
> From: AJ Lewis [mailto:lewis@sistina.com]
> Sent: Tuesday, June 19, 2001 4:19 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] LVM problems
> 
> 
> On Tue, Jun 19, 2001 at 02:28:05PM -0500, Gonyou, Austin wrote:
> > Why in the hell is this NOT in the source tree by default. 
> This has really
> > got be boggled. I've seen tons of others have this proble, 
> I've had this
> > problem, and still it doesn't seem to get itself into the 
> tree. Is this
> > because it is a temporary problem or something?
> 
> It *is* in the source tree by default.  It is in the CVS.  It 
> is not in
> LVM 0.9.1 Beta7 because LVM 0.9.1 Beta7 was released before 
> linux 2.4.4,
> which is when the problem surfaced.  We have not had a 
> release since then,
> so it is not in the latest release.
> 
> You can now grab the patch and apply it to beta7, which fixes 
> the problem,
> or you can use the CVS repository.  I really don't know what 
> else you expect
> us to do.
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
> geep!
> -----End Obligatory Humorous 
> Quote------------------------------------------
> 
