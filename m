Return-Path: <prj@multivac.cwru.edu>
Subject: Re: [linux-lvm] expanding physical disks
References: <200106130710.f5D7AhaX005430@webber.adilger.int>
From: Paul Jarc <prj@po.cwru.edu>
Date: 13 Jun 2001 13:22:26 -0400
In-Reply-To: <200106130710.f5D7AhaX005430@webber.adilger.int> (Andreas Dilger's message of "Wed, 13 Jun 2001 01:10:42 -0600 (MDT)")
Message-ID: <m3ofrsguqf.fsf@multivac.cwru.edu>
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

Andreas Dilger <adilger@turbolinux.com> writes:
> Brian Murrell writes:
>> How does LVM deal with physical disks that can get bigger or smaller,
>> such as a hardware RAID device?
> 
> Doesn't work at this time.  LVM will only see what was originally there
> at the time pvcreate was run (or possibly vgcreate/vgextend).

But it won't do any harm either, right?

> If the new PEs don't all fit into the padding space (it may happen if
> your starting PV size is just a couple hundred kB over n * PE size),
> then you will need to pvmove PE0 from its current location to somewhere
> else in the VG, and then renumber all of the PEs on that PV as (PE# - 1).
> That couble be ugly because I believe the PE number is stored in the
> snapshot tables and such.

Since this is a case of making the PV bigger, all the PEs could simply
be shifted by one; there is, after all, more room at the end now.
That would still be ugly, though.


paul
