From: Ewen McNeill <lvm@ewen.mcneill.gen.nz>
Subject: Re: [linux-lvm] Drive failure 
In-Reply-To: Message from Herbert Poetzl <herbert@13thfloor.at> 
   of "Thu, 15 May 2003 07:59:17 +0200." <20030515055917.GB19045@www.13thfloor.at> 
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2085.1052986490.1@basilica.la.naos.co.nz>
Message-Id: <20030515081450.ADEF6AE4F5@basilica.la.naos.co.nz>
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
Date: Thu May 15 03:14:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

In message <20030515055917.GB19045@www.13thfloor.at>, Herbert Poetzl writes:
>On Wed, May 14, 2003 at 10:41:37AM -0500, B. J. Zolp wrote:
>> Should I be able to dd (without reading the bad sectors) the failing drive 
>> (assuming it spins up and reads all the good sectors) to the replacement 
>> drive, then run fsck on the unmounted volume and then mount the volume with 
>> minimal data loss?
>
>I guess, this should work ... but make sure, that
>you do the copy operation on another system, otherwise
>the LVM stuff could/will be irritated by two diffent
>disks with the same signature (after copying over)

Other things to consider:

- make sure you do the dd with an option to replace unreadable sectors
  with blank sectors (otherwise nothing will be written out for the
  unreadable sectors, causing everything to be "out of alignment" after
  the first bad block)

- do the copy in single user mode, preferable booted in such a way that
  the LVM isn't active (or on another system as suggested above)

- it'll take longer but consider copying in sector-by-sector chunks, as
  it'll reduce the amount skipped  (eg, bs=512)

- you may want to map which logical volumes, and which files on those
  volumes, are affected by the bad sectors before you start, so you know
  which files you'll lose  (you could use something like "badblocks" --
  in _read_only_ mode!! -- to identify the affected blocks)

But aside from that, given an identical sized replacement disk and/or
replacement partition, I'd guess it should, in theory, work.  I've seen
similar things done with other systems with logical volume managers
(eg, HP/UX 10.20) reasonably successfully (we ended up restoring much
of the data from backup anyway to get a consistent database snapshot,
but it did save a bunch of volume reconstruction time, etc).

Ewen
