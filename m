Return-Path: <thornber@btconnect.com>
Date: Wed, 18 Jul 2001 10:33:21 +0100
Subject: Re: [linux-lvm] HUGE LVM log file...
Message-ID: <20010718103321.A540@btconnect.com>
References: <85063BBE668FD411944400D0B744267A643448@AUSMAIL> <85063BBE668FD411944400D0B744267A643448@AUSMAIL> <20010718092201.C382@btconnect.com> <5.0.2.1.2.20010718104547.00a40ec0@193.0.0.208>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5.0.2.1.2.20010718104547.00a40ec0@193.0.0.208>; from bs@infologic.fr on Wed, Jul 18, 2001 at 10:48:55AM +0200
From: Joe Thornber <thornber@btconnect.com>
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

On Wed, Jul 18, 2001 at 10:48:55AM +0200, Benoit SERRA wrote:
> At 18/07/01, you wrote:
> >We've not had much feedback on this, I guess that people don't really
> >notice much of a difference, I certainly haven't.  The allocation
> >policy for PE's is to start at the beginning of the disk (which tend
> >to have faster data transfer rates) and work back.  Anybody done any
> >benchmarking in this area ?
> >
> 
> Are you sure ?

No.

I'm just talking transfer rate here, and am just going on the typical
benchmark graphs you see in reviews. eg,

http://www6.tomshardware.com/storage/01q2/010614/barracuda-05.html#data_transfer_diagram

This comment is interesting:

"Seagate uses horizontal mapping with this drive, so that it reaches
maximum performance at the beginning of the medium, decreasing at the
end of the medium."

So obviously this varies from drive to drive.

> In AIX, the system create PPS (PE) from the middle of the disk for 
> performance reasons.

If people really think this would be of benefit we can always provide
another allocator.  Does it allocate to alternate sides of the middle ?

eg, middle, middle + 1, middle - 1, middle + 2 etc ... ?

If so you have to take the extra seek times into account if you're streaming
files that are bigger than the PE size.

This can also fragment your PV; if you create the first LV to take up
half the PV, and it puts this in the middle, a subsequent LV of the
same size ends up having a monster seek in the middle of it - though
it depends on your filesystem if this is an issue.
 
> I heard on this list or on Linux-raid list that it's the middle of the disk 
> which is the faster area.

Depends what you mean by 'faster', data transfer rate or seek time ?

- Joe
