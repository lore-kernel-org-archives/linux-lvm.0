Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E3212026D69
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2020 00:47:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 596A28007A4
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2020 00:47:22 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id p205so522329iod.8
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2020 17:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <CALOnQv5gib+tQTBzZBD9QDDNiZcuoybN3HoH_wQVD8rAdsMQKA@mail.gmail.com>
	<20200722003954.GJ6740@agk-dp.fab.redhat.com>
In-Reply-To: <20200722003954.GJ6740@agk-dp.fab.redhat.com>
From: L A Walsh <lvm@tlinx.org>
Date: Tue, 21 Jul 2020 17:47:07 -0700
Message-ID: <CALOnQv7BfMKCXVV-ED+884RuxFWCEA0UOE79MqKExXLVn2YDpw@mail.gmail.com>
Subject: Re: [linux-lvm] lvm question regarding start and placement of data
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: L A Walsh <lvm@tlinx.org>, linux-lvm@redhat.com

I don't think the tools work on bare disk (or disk images).  This is a
bit of a background, and earlier note that might explain more what I
am asking and why I am asking and not looking at the output of tools:

---------- Forwarded message ---------
From: L A Walsh <lvm@tlinx.org>
Date: Wed, Jul 8, 2020 at 11:58 AM
Subject: Finding beginning of lvm log and data recovery


I am trying to find the beginning of what looks like some lvm metadata
that seems to be printed into about 6-64K segments (part of a RAID10
that was on an LSI-card-raid that went belly up).  The raid used
64K/disk in what appears to be an 11-disk RAID0 (mirrored) out of 24
disks (I think 2/24 were spares, but this was created about 7 years
ago).

I'm beginning to wonder if this is a circular log since I can't really
find the beginning or end, but I do seem to find 2 copies of items
(no, it's not the RAID pair).

The first part of the one of the disks shows:
-----
 1    # linear

stripes = [
"pv0", 1618634
]
}
}

Home-2015.05.23-04.08.02 {
id = "jCsttc-l9To-SHtI-sqFu-YEbv-nWhp-Wy63A4"
status = ["READ", "WRITE", "VISIBLE"]
flags = []
creation_host = "Ishtar"
creation_time = 1432636568
segment_count = 1

segment1 {
start_extent = 0
extent_count = 1146

type = "striped"
stripe_count = 1    # linear

stripes = [
"pv0", 1619220
]
}
}
------------------------
I found about 5-6 more 64K sections at the same offset
(2nd 64K on the disk numbering from 0) that appear to be contiguous
with each other, but the beginning and end seem to be not there.

I also have the root file system's /etc/lvm (and a copy made over a
month ago) to make sure things didn't get overwritten, with items
like:
Ishtar:/etc> ll /etc/lvm
total 128
-rw-rw-r-- 1  8884 Sep 12  2011 Home+Space.vg
drwxrwxr-x 2 24576 Jun 24 12:02 archive/
drwxrwxr-x 2   110 Jun 24 12:02 backup/
drwxrwx--- 2     6 Apr 24 01:46 cache/
-rw-rw-r-- 1 39253 Feb 26  2016 lvm.conf
-rw-rw-r-- 1 10906 Jul 19  2010 lvm.conf.orig
-rw-rwxr-- 1 10968 Mar 10  2013 lvm.conf.rpmorig*
-rw-rwxr-- 1 10930 Sep 21  2011 lvm.conf.rpmsave*
drwxrwxr-x 2     6 Jan 15  2015 metadata/
-rw-rw-r-- 1  8512 Sep 12  2011 nHome+Space.orig
-----

I've found about 9** pairs of the mirror
(pairs as determined by an md5sum of the first 4GB)
I have 4 unknowns at this point (need to re-md5sum them in
different areas to see if they might be mirrors that have junk at the
beginning?)

I think the entire disk was in lvm (24 disks, 11 data mirrored on
another 11 with 2 spares. (4tdB disks ).
(td=tera-decimal-Bytes)

Yes, I had backups that also got knocked offline the same day --
controller went south, xfs didn't like what was being written and
turned off file systems.  The backups
were incrementals of the "important stuff" on a similar setup (11 data
on RAID10 of 2tdB disks).

Found a 10th pair that has a boot record at the beginning:

 DOS/MBR boot sector; partition 1 : ID=0xee, start-CHS (0x0,0,1),
end-CHS (0x3ff,254,63), startsector 1, 4294967295 sectors, extended
partition table (l
ast)

but has some differences between the two pairs in the first 1G
(thinking  one disk of the pair got written and the other did not)?

The last 2 disks I see don't appear to to be dups, one could be a
spare -- also I can't read the disk in slot23, as it has a bad PHY.

While the new controller had the disks come up as sdc-sds in JBOD
mode, I don't know what disk is in what slow.  Going to have to try
saturating them (the identify drive function isn't working with this
container).

So anyway to determine the start of the LVM log on disk?

How about info out of /etc/lvm?  Anything there people can think of
that would help.  I think I am getting close, but my nervousness level
goes up as I get closer for fear that either things won't "fit
together" or I'll forget something and do something foolish.  Even
knowing the right order, its still seems like it will be a pain to
reconstruct 1 copy of the RAID (a RAID0 essentially),
since I need to sweep across the RAID0 set reading 64k of
each "disk" to write contiguously somewhere.

Thanks for any pointers.
Linda W.


On Tue, Jul 21, 2020 at 5:40 PM Alasdair G Kergon <agk@redhat.com> wrote:
>
> On Tue, Jul 21, 2020 at 05:23:47PM -0700, L A Walsh wrote:
> > I have a file in the /etc/lvm/archive dir that seems to be the name of a vg.
>
> Use the tools to explain what you have where:
>   pvs, lvs, vgs
> with -o help to see the list of fields available
> and --units to select your choice of output units.
>
> (Offset from start of disk and extent size is recorded as 512-byte sectors;
> Within VGs units are extents.)
>
> Alasdair
>
