Resent-Message-Id: <199907261133.NAA07307@colombina.comedia.it>
Date: Mon, 26 Jul 1999 13:11:22 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] RAID and LVM?
Message-ID: <19990726131121.A7263@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <19990726002923.C6315@colombina.comedia.it> <Pine.LNX.4.10.9907260107230.14960-100000@hibernia.spin.ie>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.10.9907260107230.14960-100000@hibernia.spin.ie>; from Paul Jakma on Mon, Jul 26, 1999 at 01:12:17AM +0100
Resent-To: linux-lvm@msede.com
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Jakma <paul@clubi.ie>
Cc: linux-lvm@msede.de

On Mon, Jul 26, 1999 at 01:12:17AM +0100, Paul Jakma wrote:
> cool! Tell me, how is md_make_request in md.c defined? The old way,
> or the new way:
> 
new way!
you better check alans patch it is on kernel.org mirrors

> i noticed lvm does autodetect based on partition ID. Raid does
> aswell. So how can we do autodetection for LVM on RAID? The md device
> won't have a partition id, and the underlying device will have to
> have a RAID partition ID for RAID to autodetect it. 
> Can LVM check for some magic within each block device and use that to
> decide whether a device is a PV or not?
we have to set the partition as a raid autodetect partition
then create an initrd with the command
insmod lvm.o
vgscan
vgchange -a y

the problem is that when raid is loaded as a module autodetect
does not happen than when initrd is finished :(

L.

-- 
Luca Berra -- bluca@comedia.it
    Communications Media & Services S.r.l.
