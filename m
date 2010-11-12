Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oACMSsfr023409
	for <linux-lvm@redhat.com>; Fri, 12 Nov 2010 17:28:54 -0500
Received: from q7.q7.com (q7.q7.com [69.168.48.248])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oACMSg4g030984
	for <linux-lvm@redhat.com>; Fri, 12 Nov 2010 17:28:42 -0500
Received: from charon.spiretech.com (charon.spiretech.com [69.168.63.193])
	(authenticated bits=0)
	by q7.q7.com (8.13.8/8.13.8) with ESMTP id oACMSbCS007022
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Fri, 12 Nov 2010 14:28:42 -0800
Message-ID: <4CDDBF95.9040104@q7.com>
Date: Fri, 12 Nov 2010 14:28:37 -0800
From: Joe Pruett <joey@q7.com>
MIME-Version: 1.0
References: <AANLkTi=+iwZLBxZFzhb++KMevOy55QJrg9xg9Ey2w_kX@mail.gmail.com>
In-Reply-To: <AANLkTi=+iwZLBxZFzhb++KMevOy55QJrg9xg9Ey2w_kX@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

my understanding of how the lvm does snapshots is that a write causes a
lookup to see if that extent is dirty or clean.  a dirty extent just
writes directly, a clean extent causes a copy from the main volume to
the snapshot volume and some amount of bookkeeping to track that the
block is now dirty and then the write completes to the main lv.  so a
test where you are creating a bunch of updates would cause a write to
turn into a read and two writes, so i'd expect more like a 3x hit.  and
i guess that the bookkeeping may have some sync calls in it, which could
cause some major stalls as caches flush.

have you tested the snapshots under normal load, and not test load?  you
may be seeing the worst possible behavior (which is good to know), but
may not really occur under typical usage.

On 11/12/2010 01:52 PM, chris (fool) mccraw wrote:
> hi folks,
>
> i'm new to linux lvm but a longtime user of lvm's on other commercial
> unices.  i love some of the features like r/w snapshots!  and indeed
> snapshots are the primary reason i'm even interested in using LVM on
> linux.
>
> however, snapshots really shoot my system in the foot.  in my (12
> processor, 12GB RAM, x86_64 centos 5.5) server, i have two pricey
> areca hardware raid cards that give me ridiculous write performance:
> i can sustain over 700MByte/sec write speeds (writing a file with dd
> if=/dev/zero bs=1M, twice the size of the raid card's onboard memory
> and timing the write + a sync afterwards) to the volumes on either
> card (both backed by 7 or more fast disks).  enabling a single
> snapshot reduces that speed by a factor of 10!  enabling more
> snapshots isn't as drastic but still doesn't really scale well:
>
>
> no snapshot  = ~11sec (727MB/sec)
> 1 snapshot   = ~102sec (78MB/sec)
> 2 snapshots  = ~144sec (55MB/sec)
> 3 snapshots  = ~313sec (25MB/sec)
> 4 snapshots  = ~607sec (15MB/sec)
>
>
> i have my snapshots set up a separate array from the master
> filesystem, on a separate raid card.  i did not change the default
> parameters for the setup (ie blocksize) because our typical workload
> is reading and writing small (<64k) files.  i can copy non-snapshotted
> files from an LVM on array1 to array2 at a good clip, 307MByte/sec
> (including sync).  copies from the parent array to itself (no
> snapshots enabled) go at about 220MByte/sec.
>
> all of my measurements were repeated 4x and averaged--occasionally
> there was one that was a good 30% faster than the other 3, but it was
> always an outlier.  typically all measurements for a given scenario
> were within 10% of eachother.
>
> so i guess that as a replacement for a netapp, setup with a few hourly
> & daily, and even one weekly snapshot isn't something people do with
> stock linux LVM?  or am i just doing it wrong?
>
> in searching the archives i heard about zumastor.  is that really
> production-ready?  the no-new-releases in the last 2 years and not
> being in the mainstream kernel makes me leery of it.  i think we can
> live with the factor-of-10 performance degradation on a daily
> basis--we can turn off all the snapshots in case we really have to
> hammer the server (which has a 4Gbit uplink to a render farm, so it is
> possible for us to actually write over 70MByte/sec when things are
> humming, via NFS), and in general it serves SMB at closer to 400Mbit
> than 4000, so all the desktop users will not notice a difference.
>
> it seems that others have seen these problems:
> http://www.nikhef.nl/~dennisvd/lvmcrap.html as an example.
>
> any thoughts?
>
> thanks in advance for your input!
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
