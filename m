Return-Path: <paranoid@tweet.paranoid.dhs.org>
Date: Sun, 5 Aug 2001 00:32:57 -0700
From: Mark Glines <mark@glines.org>
Subject: Re: [linux-lvm] LVM with multi-path disks?
Message-ID: <20010805003257.A2728@glines.org>
References: <3B6B30C4.B4427F3D@cup.hp.com> <20010804174049.B564@colombina.comedia.it> <20010805022800.A26419@vestdata.no> <20010805091201.A4490@colombina.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010805091201.A4490@colombina.comedia.it>
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

On Sun, Aug 05, 2001 at 09:12:01AM +0200, Luca Berra wrote:
> On Sun, Aug 05, 2001 at 02:28:01AM +0200, Ragnar Kj?rstad wrote:
> > On Sat, Aug 04, 2001 at 05:40:49PM +0200, Luca Berra wrote:
> > > John, there is an addition for multi-path to the md driver
> > > you can fetch it from the redhat source kernel rpm.
> > > you can then stack lvm on top of md to achieve your goal
> > 
> > E.g. you have a md0 device consisting of sda and sdb - would not lvm
> > find three different paths to the same data (sda, sdb, md0) when
> > scanning for physical volumes? Will that not cause problems?
> 
> there is an (*horrible*) piece of code in pv_read_all_pv.c
> that deals with multiple entries for the same PV, so all duplicate
> PV are skipped, so the md will be the obly one detected.
> what probably happened to John is, that his PV was killed by
> this routine (they were duplicate and not md devices)

I would only think this is a problem when md isn't being used.  In the
above described situation, vgscan would see 2 devices which have md
headers (and ignore them), and one LVM signature (and use it)?

If the code does what you say, and LVM was using the dual-path SCSI
device directly, then it would detect one and ignore the other, and it
would still work as if there was only one route to the drive.

However, in this case, md is in the middle, and its md's job to handle
multi-path.  LVM should be ignoring md's lowlevel volumes anyway, and
act solely on the virtual device md exports.  Am I missing something?
-- 
#!/usr/bin/perl
while($_=shift){if($d==1){$a="$a \"$_\""}else{if(/^-(.+)/){$t
=$1;$i.=$t;if($i=~/-/){$i=~s/-//;$r=shift;$d=1}}else{$r=$_;$d
=1}}}die"Usage: $0 [-ix] [--] regex [paths]\n"if!$r;eval"\$r=
qr/$r/$i";$a='.'if!$a;@F=`find $a -type f`;chomp@F;for $f(@F)
{open(I,$f)or next;while(<I>){print"$f:$.:$_"if/$r/}close(I)}
