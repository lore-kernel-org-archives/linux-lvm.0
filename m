Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200101231643.f0NGhU330876@webber.adilger.net>
Subject: Re: [linux-lvm] New dumb question
In-Reply-To: <3A6DAE2B.D7E48966@infologic.fr> "from Benoit SERRA at Jan 23, 2001
 05:15:39 pm"
Date: Tue, 23 Jan 2001 09:43:29 -0700 (MST)
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
To: linux-lvm@sistina.com

Beniot Sera writes:
> Patrick Caulfield wrote:
> > If you're doing striped LVs on top of software RAID I'm not really
> > surprised.  Pick one method of striping (LVM *or* RAID) and stick to
> > it but don't mix them or who knows where your data will end up!
> 
> Software RAID is build in, but is not used. Nevermind !
> I'm not using LVM on top of SOFTWARE RAID for the moment.
> If I use LVM on top of SOFTWARE RAID, it will be for redudancy,
> not for striping.

It isn't fatal to layer LVM striping on top of software RAID 5, but
I don't think you would get better performance because of too much
overhead from software RAID 5.

You could LVM stripe hardware RAID 5 as long as the LVM stripe size ==
RAID chunk size.  For example, if you have a RAID array with 5 disks
(4 data + 1 parity) and it is using 4kB chunks, then the LVM stripe
size should be n*16kB so that you will write out a full RAID chunk at
one time from LVM.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
