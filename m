Return-Path: <jdiehl@sandia.gov>
Message-ID: <B51F0C636E578A4E832D3958690CD73E0130BF3B@es04snlnt>
From: "Diehl, Jeffrey" <jdiehl@sandia.gov>
Subject: RE: [linux-lvm] logical volumes extending beyond 1 machine
Date: Thu, 7 Jun 2001 15:40:52 -0600
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

Actually, I think hew as refering to MFS (mosix fs).  Unfortunately, this
probably won't work since it's not really a block device, it's much more
like an nfs mount.  I've been watching this thread and have yet to see
anyone answere if a network block device would work.  I think it would be
neat...

Mike Diehl,
Network Monitoring Tool Devl.
Sandia National Laboratories.
(505) 284-3137
jdiehl@sandia.gov

> -----Original Message-----
> From: AJ Lewis [mailto:lewis@sistina.com]
> Sent: June 07, 2001 2:58 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] logical volumes extending beyond 1 machine
> 
> 
> On Thu, Jun 07, 2001 at 06:27:20PM +0200, Jens Benecke wrote:
> > On Wed, Jun 06, 2001 at 05:08:47PM -0700, Damon Fasching wrote:
> > > 
> > > Is it possible using LVM define a logical volume which 
> includes disks from
> > > more than 1 machine?
> > 
> > I don't think so. You want NFS for that, or the Mosix GFS 
> (global file
> > system). Look at www.mosix.org
> 
> Umm, not to be anal or anything, but the MOSIX team doesn't 
> develop GFS,
> Sistina Software does.  You know, the same group that's 
> heading up LVM?
> The same group that hosts this mailing list?  Please look at
> http://www.sistina.com if you're still confused.
> 
> And yes, you might want to consider using GFS for your system.  :)
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
> Carpe Aptenodytes! (Seize the Penguins!)
> -----End Obligatory Humorous 
> Quote------------------------------------------
> 
