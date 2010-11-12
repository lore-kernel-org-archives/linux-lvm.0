Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oACNVC6A008003
	for <linux-lvm@redhat.com>; Fri, 12 Nov 2010 18:31:12 -0500
Received: from mail-qy0-f174.google.com (mail-qy0-f174.google.com
	[209.85.216.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oACNUxkZ003509
	for <linux-lvm@redhat.com>; Fri, 12 Nov 2010 18:30:59 -0500
Received: by qyk12 with SMTP id 12so1623121qyk.12
	for <linux-lvm@redhat.com>; Fri, 12 Nov 2010 15:30:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4CDDBF95.9040104@q7.com>
References: <AANLkTi=+iwZLBxZFzhb++KMevOy55QJrg9xg9Ey2w_kX@mail.gmail.com>
	<4CDDBF95.9040104@q7.com>
From: "chris (fool) mccraw" <gently@gmail.com>
Date: Fri, 12 Nov 2010 15:30:37 -0800
Message-ID: <AANLkTinaWRE0Ppsh=S+NgDg+EuheOq8Kqt75WHN995Mj@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] advice for curing terrible snapshot performance?
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Nov 12, 2010 at 14:28, Joe Pruett <joey@q7.com> wrote:
> my understanding of how the lvm does snapshots is that a write causes a
> lookup to see if that extent is dirty or clean. �a dirty extent just
> writes directly, a clean extent causes a copy from the main volume to
> the snapshot volume and some amount of bookkeeping to track that the
> block is now dirty and then the write completes to the main lv. �so a
> test where you are creating a bunch of updates would cause a write to
> turn into a read and two writes, so i'd expect more like a 3x hit.

i would also expect that.  it is reasonable and seems to be designed
s.t. that's the best case.  but that does not seem to be anyone's
experience, that i could find.  does anyone else out there have
performance numbers that don't suck?  i stopped short of setting up a
ramdisk to hold the snapshots because that seems ridiculous and scales
terribly too..

i found one post to this list over a year ago about it, and Dennis'
web page (http://www.nikhef.nl/~dennisvd/lvmcrap.html) all firmly
corroborating my numbers.


> and
> i guess that the bookkeeping may have some sync calls in it, which could
> cause some major stalls as caches flush.

i want caches to flush;  i want to know what the actual speed to write
to disk is.


> have you tested the snapshots under normal load, and not test load? �you
> may be seeing the worst possible behavior (which is good to know), but
> may not really occur under typical usage.

sequential writes to a near-empty filesystem from a single non-network
source while the machine is otherwise quiet aren't exactly worst-case
situations, IMNSHO.

the fact that the machine became unavailable as a samba server (still
pingable and became functional again once i stopped writing) while i
was doing the tests with 4 snapshots (single writer thread) does not
lead me to want to put it into production with multiple writer threads
to see if that just happens to work for awhile.  i can vouch for the
fact that it doesn't work well when writing 0's locally--how does
throwing multiple network writers with samba and nfs into the picture
make things more transparent or even less load-inducing?  couple that
with a backup reading from a snapshot at full throttle (a likely
scenario) and things aren't looking too rosy.  at this point my
fanless 1ghz via home server with a single PATA disk does a better job
serving files than this $30,000 beast with 24x the ram, disks, and
ghz, when as few as 2 snapshots are enabled.

while the machine may do ok under real-world load, there is 0 chance
of me selling it as a solution to the team when my dinky test can
bring things to a halt, so we'll never know.  (if i can find settings
that approximate the 3x penalty and scale linearly, this becomes far
more likely!)  this group already uses rsnapshot and it works well (at
the cost of enough room to keep a complete backup online along with
deltas)--it certainly isn't as instant to create a snap, nor even
trying to be real-time updated, but it also doesn't bog the machine
down horribly when keeping, quite literally, 50 snapshots around
(possibly because rsnapshot runs single-threaded leaving the other 11
procs to serve files, etc, whereas having X snapshots seems to lead to
X kcopyd's all using as much cpu as they can?).  unless i'm doing
something terribly wrong, there is just no way that more than a
handful of snapshots will lead to reasonable performance--writing a
100mb file (not unreasonable real-world workload simulation) with 10
snapshots takes almost a minute.

please tell me i'm doing something terribly wrong =)  i want this to
work, but so far it doesn't seem like this technology is actually a
reasonable replacement for netapp style snapshots, at least not in
snapshot quantities >1?
