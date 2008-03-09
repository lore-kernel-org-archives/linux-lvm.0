Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m29NVmm2008486
	for <linux-lvm@redhat.com>; Sun, 9 Mar 2008 19:31:48 -0400
Received: from mail.linbit.com (aug.linbit.com [212.69.162.22])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m29NVBsu031436
	for <linux-lvm@redhat.com>; Sun, 9 Mar 2008 19:31:12 -0400
Received: from racke.linbit (office.linbit [86.59.100.100])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.linbit.com (LINBIT Mail Daemon) with ESMTP id AAB6C2E0373C
	for <linux-lvm@redhat.com>; Mon, 10 Mar 2008 00:31:09 +0100 (CET)
Date: Mon, 10 Mar 2008 00:31:23 +0100
From: Lars Ellenberg <linux-lvm@linbit.com>
Subject: Re: [linux-lvm] Restore LVM snapshot without creating a full dump
	to an "external" device?
Message-ID: <20080309233123.GA6688@racke.local>
References: <47D45F39.4090502@tuxes.nl>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline
In-Reply-To: <47D45F39.4090502@tuxes.nl>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 09, 2008 at 11:05:45PM +0100, Bas van Schaik wrote:
> Hi all,
> 
> When I started to use LVM snapshots, I presumed that it was easy to
> restore a system to such a snapshot. As far as I can see now, this
> presumption was incorrect... People on the internet write that I should
> dump the whole snapshot using dd and then write it over the original
> volume. This actually implies that I need another device with at least
> the size of the original volume available to dump to. In my situation,
> this means that I need about 2 TB free space to recover this snapshot!
> 
> Isn't there a more sophisticated way to restore the snapshot than just
> dumping it?
>  1) create snapshot of /dev/myvolumegroup/myvolume to
> /dev/myvolumegroup/mysnapshot
>  2) dd if=/dev/myvolumegroup/mysnapshot of=/tmp/mysnapshot.dd
>  3) lvremove /dev/myvolumegroup/mysnapshot
>  4) dd if=/tmp/mysnapshot.dd of=/dev/myvolumegroup/myvolume

you got (size-of-your-volume) free space in /tmp?
pretty large /tmp, or pretty small volume, I guess.

> Something like:
>  1) lvrevert /dev/myvolumegroup/mysnapshot /dev/myvolumegroup/myvolume
> 
> I'd like to hear your thoughts on this, because I think it should be
> fairly easy to restore a COW snapshot. Or am I wrong and missing something?

you may want to investigate the status of
http://fedoraproject.org/wiki/StatelessLinux/CachedClient
were it says "The LVM and device-mapper code to allow merging is
awaiting upstream review."

or you can try, at your own risk, the hack below.

as I'm not too deep into devicemapper snapshot code and development,
please correct me if I'm wrong, and don't shoot yourself too readily,
apply own mental effort as appropriate :->

current dm-snap and dm-exception-store are implemented in a way that
for a single snapshot, you get
   (mapping only) snapshot-origin
   (real storage) origin-real
   (mapping only) snapshot
   (real storage) COW (or exception store)

COW on disk format is pretty simple (as of now).
its all fixed size chunks.
it starts with a 4x32bit header,
[SnAp][valid][version][chunk_size in sectors]
so any valid snapshot looks
"SnAp" 1 1 [power of two]

chunk_size it what you set with the lvcreate "-c" option.

the rest of the (just as well chunk_size'ed) header block is unused.

expressed in chunks, the COW storage looks like:
[header chunk][exception area 0][data chunks][....][exception area 1][...]
where each exception area is one "chunk" itself.
each exception area holds a mapping table of
"logic chunk number" to "in COW storage chunk number", both 64bit.
"logic number" is called "old", "in COW" address is called "new".
byte number
1                     [old][new]
2                     [old][new]
3                     ...
(chunk_size*512/16)   [old][new]
following are as many data chunks.

this whole thing is append only.

     as a side note,
     since the "new" address is completely implicit in this scheme,
     I wonder why it is recorded at all. maybe they are not
     enlisted in creation/submit order, but in completion order.

I attached a perl script, that opens its argument _read only_,
with O_DIRECT, reads these mappings,
and spits out "dd" command lines.
C-code would pretty much look the same, I guess.
you could replace the "print dd" stuff with a real
pread/pwrite, and whoops, there is your "lvrevert.", sort of.

usage woudld be:
  * make sure nothing will concurrently access any of the involved
    devices.  neither origin nor snapshot may be mounted!
    neither should be accessed, either.
  * now, to get $origin into the state that
    is recorded on $cow, do
    # cow=/dev/mapper/vgXY-somedev-snap-cow
    # origin=/dev/mapper/vgXY-somedev
    ## optionally create a new snapshot of the $origin,
    ## so you can change your mind later :->
    # lvcreate -s -n snap_before_revert -L $enough_room vgXY/somedev
    ## then run
    # list_exception_chunks $cow | tee tmp.out | less +F
    ## check for plausibility...
    ## ...and chicken out.^A^Kexecute those dd lines:
    # sed -ne 's/^#d //p' < tmp.out > tmp.sh
    # source tmp.sh
    ## verify outcome,
    ## throw away your snapshot(s),
    ## and create new ones.

can even be done if the snapshot is (still valid but almost) full.
because we are only dd-ing chunks onto the origin that exist in the cow
storage already, so nothing triggers a new COW exception.

again, use at your own risk.
the reason I wrote it and used it once (litteraly):
the origin in question was 1.7 TB (iirc) and there
was simply no room left in the available VGs for a clone.
and it worked. YMMV.

-- 
: commercial DRBD/HA support and consulting: sales at linbit.com :
: Lars Ellenberg                            Tel +43-1-8178292-0  :
: LINBIT Information Technologies GmbH      Fax +43-1-8178292-82 :
: Vivenotgasse 48, A-1120 Vienna/Europe    http://www.linbit.com :

--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="list_exception_chunks.pl"

#!/usr/bin/perl
use Fcntl qw(:DEFAULT O_DIRECT);

# Copyright 2008 Lars Ellenberg
# use at your own risk
# License: GNU GENERAL PUBLIC LICENSE version 2 (GPL2)

# given a snapshot exception store ("*-cow" device),
# this lists the chunk size in sectors,
# and the logical to cow chunk mapping
# in a "dd command line" format

######### DANGER DANGER DANGER ############################
### if you execute these dd command lines,              ###
### you may very well SCRAMLE YOUR DATA                 ###
### because you are BYPASSING LVM, and any file system! ###
###########################################################

# if you want to use this to implement an "make origin look like snapshot" feature
# or similar, understand that _you_ have to deal with the implications.
# make sure there is NOTHING is accessing the origin/snapshot/cow/exceptionstore
# devices while your "make origin look like snapshot" io is running.
#
# also, only you can possibly know whether this snapshot received any direct
# writes during its lifetime, or whether it only received COW exceptions from
# the origin, or maybe both!


### for on disk layout of the exception store,
### See ./drivers/md/dm-exception-store.c
###
#  * All on disk structures are in little-endian format.  The end
#  * of the exceptions info is indicated by an exception with a
#  * new_chunk of 0, which is invalid since it would point to the
#  * header chunk.
#  */
# 
# /*
#  * Magic for persistent snapshots: "SnAp" - Feeble isn't it.
#  */
# #define SNAP_MAGIC 0x70416e53
# 
# /*
#  * The on-disk version of the metadata.
#  */
# #define SNAPSHOT_DISK_VERSION 1
# 
# struct disk_header {
# 	uint32_t magic;
# 
# 	/*
# 	 * Is this snapshot valid.  There is no way of recovering
# 	 * an invalid snapshot.
# 	 */
# 	uint32_t valid;
# 
# 	/*
# 	 * Simple, incrementing version. no backward
# 	 * compatibility.
# 	 */
# 	uint32_t version;
# 
# 	/* In sectors */
# 	uint32_t chunk_size;
# };
# 
# struct disk_exception {
# 	uint64_t old_chunk;
# 	uint64_t new_chunk;
# };
############

#!/usr/bin/perl
use Fcntl qw(:DEFAULT O_DIRECT);

use strict;
use warnings;

my $file = $ARGV[0] or die "usage: $0 <input device or file>\n";

# max exception chunk size apears to be 512k
# we need an aligned buffer for O_DIRECT.
# dirty trick to get a PAGE_ALIGNed buffer in perl
# be _very_ careful with $buf, do not touch it,
# and do not assign to it, not even implicitly!
my $bufsize = 512*1024;
my $align = 4096;
my $buf = "x" x ($bufsize + $align);
my $offset = $align - (unpack "l", pack "p", $buf) % $align;

my $header = { magic => 0, valid => 0, version => 0, chunk_size => 0, };

sysopen(IN, $file, O_RDONLY | O_DIRECT) or die "sysopen($file, O_DIRECT): $!\n";

sub read_header()
{
        my $c = sysread(IN, $buf, 512, $offset);
	die "problem reading header, \$c: $c, \$!: $!"
		 if ($c != 512);
	@{$header}{qw(magic valid version chunk_size)} =
		unpack "A4VVV", substr($buf, $offset, 512);

	die "does not appear to be a lvm-snapshot-cow device"
		if $header->{magic} ne 'SnAp';
	die "cannot deal with this snapshot version"
		if $header->{version} != 1;
	die "snapshot is invalid, refusing to operate on it"
		unless $header->{valid};
	die "unexpected chunk size"
		if ($header->{chunk_size} & ($header->{chunk_size}-1)) != 0;
	printf "# found snapshot header for chunk_size=%u sectors\n", $header->{chunk_size};
}

sub seek_to_exception_table($)
{
	my $n = $_[0];
	my $cs = $header->{chunk_size} * 512;
	my $epc = $cs / 16;
	my $pos = ($n*($epc+1)+1)*$cs;
	sysseek(IN, $pos, 0) == $pos
		or die "sysseek(,$pos,): $!";
}

sub process_one_exception
{
	my ($old,$new,$merge_count) = @_;
	# chunk numbers!
	# old: logical chunk number
	# new: chunk number in exception store
	# merge count: how many chunks could be merged
	# with these start sectors

	# chunk number mapping
	# printf "#c %20.0f\t%20.0f\t%u\n", $old, $new, $merge_count;

	# for sectors you'd have to multiply with $header->{chunk_size};

	# dd command line
	# if you dare,
	# you can do it in perl directly!
	# or implement it in C using pread/pwrite.
	printf "#d dd of=\$origin seek=%.0f if=\$cow iflag=direct skip=%.0f count=%u bs=%ub\n",
		$old, $new, $merge_count, $header->{chunk_size};
	
}

sub list_exceptions()
{
	my $cs = 512*$header->{chunk_size};
	my $enr = 0;
	my $ecount = 0;
	my $e;
	my @t;
EXCEPTION_CHUNK:
	for ($enr = 0; seek_to_exception_table($enr); $enr++) {
		my $c = sysread(IN, $buf, $cs, $offset);
		die "problem reading exception table, \$c: $c, \$!: $!"
			 if ($c != $cs);
		@t = unpack "V*", substr($buf, $offset, $cs);
		for (my $i = 0; $i < @t; $i += 4) {
			# if the "new" location is equal to zero,
			# that was the END marker.
			last EXCEPTION_CHUNK unless $t[$i+2] || $t[$i+3];
			$ecount++;

			# unfortunately 64bit integer is not available
			# in many perl. we compensate:
			my ($old,$new) = (
				$t[$i+1] * 4294967296.0 + $t[$i],
				$t[$i+3] * 4294967296.0 + $t[$i+2]);

			# maybe we can merge?
			if ($e and
				$old == $e->[0] + $e->[2] and
				$new == $e->[1] + $e->[2])
			{
				$e->[2]++;
				next;
			}
			process_one_exception(@$e) if $e;
			$e = [ $old, $new, 1]
		}
		process_one_exception(@$e);
		# would not work anyways, $new mapping jumps, but lets
		# _explicitly_ only merge within one exception table chunk
		undef $e;
	}
	# don't forget to report the last mapping
	process_one_exception(@$e) if $e;
	printf "# found %.0f exceptions (%.0f kB)\n",
		$ecount, $ecount*$header->{chunk_size}/2;
	print "## use these dd commands AT YOUR OWN RISK\n" if $ecount;
}

read_header;
list_exceptions;

--TB36FDmn/VVEgNH/--
