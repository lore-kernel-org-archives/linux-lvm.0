Return-Path: <lembark@wrkhors.com>
Date: Wed, 18 Jul 2001 12:02:32 -0500
From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] HUGE LVM log file...
Message-ID: <476390000.995475752@dizzy>
In-Reply-To: <5.0.2.1.2.20010718104547.00a40ec0@193.0.0.208>
References: <85063BBE668FD411944400D0B744267A643448@AUSMAIL>   <85063BBE668FD411944400D0B744267A643448@AUSMAIL>
 <5.0.2.1.2.20010718104547.00a40ec0@193.0.0.208>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
To: linux-lvm@sistina.com

> In AIX, the system create PPS (PE) from the middle of the disk for 
> performance reasons.

And systematically fry their performance in some cases.


The theory behind middle-tracks is reducing butterfly reads.
Eventually, however, the drive gets full and you end up with
butterflys anyway.

With newer (last 5 years+) drives the outer cyl's have more
sectors to keep the bit density constant.  This leaves you with
much more storate at the outside edge, which reduces seeks
which is faster (especially since at least SCSI drives normally
do cyl buffering).

For even finer control you can create fast/med/slow part's 
on the drive and then use them as PV's in different VG's.
Used carefully this can be a serious performance boost for
high-I/O systems.

sl
