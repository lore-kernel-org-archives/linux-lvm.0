Return-Path: <jdiehl@sandia.gov>
Message-ID: <B51F0C636E578A4E832D3958690CD73E0130BEE3@es04snlnt>
From: "Diehl, Jeffrey" <jdiehl@sandia.gov>
Subject: RE: [linux-lvm] Can't pvcreate second partition...
Date: Mon, 7 May 2001 17:14:42 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

I wasn't trying to be rude, btw.  I had a friend tell me he had to bounce
his machine after a fdisk, but I have never had it happen myself.  This was
with a generic 2.2.x kernel, btw.

If you need/want details, I can call him and ask.

Thanx,
Mike Diehl,
Network Monitoring Tool Devl.
284-3137
jdiehl@sandia.gov


> -----Original Message-----
> From: AJ Lewis [mailto:lewis@sistina.com]
> Sent: May 07, 2001 5:08 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Can't pvcreate second partition...
> 
> 
> On Mon, May 07, 2001 at 04:13:38PM -0600, Diehl, Jeffrey wrote:
> > The problem with this theory is that I'm running 2.2.18, not 2.4.x.
> 
> Doh. I guess it isn't a 2.4x only problem then.  ;)  Very 
> odd.  Has anyone
> seen this when the LVM patches are not applied?
> 
> > > -----Original Message-----
> > > From: AJ Lewis [mailto:lewis@sistina.com]
> > > Sent: May 06, 2001 10:12 PM
> > > To: linux-lvm@sistina.com
> > > Subject: Re: [linux-lvm] Can't pvcreate second partition...
> > > 
> > > 
> > > On Sun, May 06, 2001 at 10:36:13AM -0700, Darren Young wrote:
> > > > Funny, I had the same issue at the same time. I
> > > > created /dev/hdb7 with fdisk and then a pvcreate just
> > > > after. pvcreate stated that the dev didn't exist.
> > > > Reboot fixed the problem. This could be a problem for
> > > > machines already up in production with small windows
> > > > for restarts. Why is this necessary and will it become
> > > > a "non-issue" in future releases? If this will be
> > > > necessary forever, then some simple planning would
> > > > solve the problem, at least on new installations. Any
> > > > way around this?
> > > 
> > > This appears to be an issue with fdisk and the 2.4.x series 
> > > Linux kernels.
> > > It has nothing to do with LVM as far as i can tell.  I've had 
> > > problems where
> > > I run fdisk to change the size of a partition, but linux 
> > > doesn't detect the
> > > change.  /proc/partitions is identical before and after i 
> > > attempt to write
> > > out the changes with fdisk.  I'm not sure what has caused 
> this. Maybe
> > > someone else on the list knows?
> > > 
> > > I'll try to verify this when i get into work tomorrow.
> > > 
> > > Regards,
> > > -- 
> > > AJ Lewis
> > > Sistina Software Inc.                  Voice:  612-638-0500
> > > 1313 5th St SE, Suite 111              Fax:    612-638-0500
> > > Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
> > > http://www.sistina.com
> > > 
> > > Current GPG fingerprint = 3B5F 6011 5216 76A5 2F6B  52A0 941E 
> > > 1261 0029 2648
> > > Get my key at: http://www.sistina.com/~lewis/gpgkey
> > >  (Unfortunately, the PKS-type keyservers do not work with 
> > > multiple sub-keys)
> > > 
> > > -----Begin Obligatory Humorous 
> > > Quote----------------------------------------
> > > Life's unfair - but root password helps!
> > > -----End Obligatory Humorous 
> > > Quote------------------------------------------
> > > 
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
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
> A computer without a Microsoft operating system is like a dog 
> without bricks
> tied to its head.
> -----End Obligatory Humorous 
> Quote------------------------------------------
> 
