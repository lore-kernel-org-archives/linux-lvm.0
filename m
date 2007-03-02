Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l22GwjMD011615
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2007 11:58:45 -0500
Received: from homer.panici.net (homer.panici.net [207.234.145.200])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l22Gwg8A019382
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2007 11:58:42 -0500
Received: from homer.panici.net (localhost.localdomain [127.0.0.1])
	by homer.panici.net (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	l22GwbJL005529
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2007 16:58:37 GMT
Received: (from paddy@localhost)
	by homer.panici.net (8.13.4/8.13.4/Submit) id l22Gwb9a005524
	for linux-lvm@redhat.com; Fri, 2 Mar 2007 16:58:37 GMT
Date: Fri, 2 Mar 2007 16:58:37 +0000
From: paddy@panici.net
Subject: Re: [linux-lvm] partition table needed for lvm ?
Message-ID: <20070302165837.GB28190@homer.panici.net>
References: <20070301171425.30ktkd2oroo4cco0@www.mail.yale.edu>
	<20070301231907.GG3319@agk.surrey.redhat.com>
	<20070302140153.GB12744@percy.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20070302140153.GB12744@percy.comedia.it>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Fri, Mar 02, 2007 at 03:01:53PM +0100, Luca Berra wrote:
> On Thu, Mar 01, 2007 at 11:19:07PM +0000, Alasdair G Kergon wrote:
> >On Thu, Mar 01, 2007 at 05:14:25PM -0500, Chris Hunter wrote:
> >>Do I reallly need to make partition tables on all my disks to use lvm2 ?
> >
> >Other packages such as the installer like to have them.
> 
> what about the fact that on many storage creating an ms-dos compatible
> partition usually results in screwing io alignment?

interesting.  

Although it comes as no surprise that the CHS boundaries are not aligned
with the hardware anymore (like they were back in the days of say MFM),
I thought that systems that attempted to use this level of information 
about a disk were fairly rare these days ?

> Do _NOT_ use partitions, they are evil and should have been shot long
> ago.

:-)

agreed, there are plenty of reasons to retire msdos partitions.

What would you recommend as a setup for boot drives where the bios
expects to boot from an msdos partition table (or more specifically
the code at the begining of a sector with the magic of an msdos 
partitiontable) on sector 0 ?

<reminisces ...>

back in the days of around LVM 0.7 I patched my LVM to leave a blank
sector at the front of the PV, in the much the same fashion as ext2,
specifically so that I could format an entire boot disk in HM LVM.

I found a number of "bugs" in the userspace tools which didn't account 
for variations in this variable, but were easy enough to fix up.

As I recall, the author wasn't interested in such a modification, and 
warned against booting/swapping on LVM.

one of the problems with this setup (apart from my learning at the time
that you can patch your kernel so far, but eventually with enough
patches it becomes a serious headache :-) was that grub didn't
understand LVM and LILO wants blocks that don't move about, but there
was no way to tell LVM to pin the relevant block in place (not that this
was ever a problem in practice for me).

One of the reasons I felt confident to do this was because I had read
the kernel code, which was exceeding clear and simple.

Of course that code has changed, and I have not kept up, and I have had
one nasty LVM related event in the past few years (couldn't promise you
that it wasn't operator error) and I am much more shy of putting swap 
and root on LVM than I was back then.

Anyway, enough of that! </reminisces>

Regards,
Paddy
