Return-Path: <weissel@netcologne.de>
From: Wolfgang Weisselberg <weissel@netcologne.de>
Date: Mon, 18 Jun 2001 12:33:18 +0200
Subject: Re: [linux-lvm] What is a good stripe size?
Message-ID: <20010618123318.A31606@tiger.bigcats.invalid>
References: <134718885.992837796416.JavaMail.root@boots>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <134718885.992837796416.JavaMail.root@boots>; from ticket_668pps1in9d9754992837754108@sneakemail.com on Sun, Jun 17, 2001 at 11:07:54PM -0500
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

Hi, idsfa!

idsfa@visi.com wrote 63 lines:

> On Sun, Jun 17, 2001 at 11:36:27PM +0200, Wolfgang Weisselberg wrote:
> > For a single file you may gain reading speed (writing is less
> > critical as it is buffered); however with a stripe size below
> > file size you will need to move the heads of both (or even
> > more) disks, increasing latency[1], effectively slowing down
> > reads unless you have fairly large files.

> True, but I was assuming 'typical' use, which means < 2G of small files
> (everything having to do with the OS) with the majority of the hard
> drive space being used for files in the megabyte+ range (multimedia,
> databases and so forth).

Databases can be special cases here, they often only read small
parts of their storage files (retriving a 3-char fields e.g.).
But then many Databases want raw access and probably will do
striping themselves, too.

A maildir or MH-style central mail spool (e.g. qmail) will
contain lots and lots of small to medium files -- one file
per email.

Further, reiserfs is pretty good with many many files, this will
(over some development time) lead to smaller overall file size
as applications will be more often programmed not to aggregate
data into bigger files.  But this is something which will not
trouble us much now.

> I can agree with your logical argument that
> larger stripes are better for small files, but I would further argue
> that striping a partition of small files is the wrong way to go.

Again, this depends.  If you need parallel access to small
files, use stripes or even RAID10/15 (mirrored stripes/mirrored
RAID5).  This would be the case of a maildir imap server, for
example.  If this is no bottleneck -- let it be.

> > In conclusion (IMHO): 
> > - small stripes increase the latency even for small reads,
> >   hurting throughput (and slowing the reads even when looking
> >   at a single file).

> I'd have to change that to "increase the latency for small reads".
> For files >> stripe size, you will see no increase in latency.

You will with small stripe sizes[5], but it's usually neglectable,
since you finish earlier than with one disk.

> Something which would balance PEs within a VG based on their usage
> would be a lovely system tool to add to lvm.  I can hardly wait for
> your program  ;-)

First, we need a fool^Wcrashproof, completely interruptible
pvmove for active, being currently read from and written
to LVs.  Once this is there, we need to have a pvmove which
can be told the physical place to move to, else we can only
spread the most accessed PEs over the PVs.

And at the moment pvmove can only partially move non-striped
LVs.

Then the rest is simply ripping a balancing algorithm from
somewhere and slap it into a wrapper.  Data aquisition is
already done via lvmsadc/lvmsar.

-Wolfgang

[5] Assume: 
    - 1st head closer to data than second head (about 50% of
        the time)
    - small strip size (e.g. 4k)
    - no bad fragmentation (normal case)
    - idle I/O
    You request the first 15k:
    - head 1 seeks to stripe, so does head 2.
    - head 1 arrives; the platter turns until the begin of the
      data; head 1 starts deliver data -- the whole strip (4k)
      and internal caching of the following strips begins.
    - head 2 should now deliver the second 4k, 
          *but is still seeking.*  
      This is the added latency.
    - head 2 finishes seeking, the platter turns until the
      begin of the data; head 2 delivers the second 4k.
    - from here on the data is put out at 'double rate' from
      both disks.

    With larger strip sizes the added latency occurs less often,
    as up to the whole strip size is read and can be delivered
    giving the other head more time to finish seeking.

    With non-idle I/O the latency for gets worse, of course,
    even when reads are reordered to minimize the impact.
