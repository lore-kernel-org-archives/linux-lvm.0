Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3IIr2j20921
	for <linux-lvm@redhat.com>; Sun, 18 Apr 2004 14:53:02 -0400
Received: from anor.ics.muni.cz (root@anor.ics.muni.cz [147.251.4.35])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3IIr187002843
	for <linux-lvm@redhat.com>; Sun, 18 Apr 2004 14:53:01 -0400
Received: from anxur.fi.muni.cz (IDENT:0@anxur.fi.muni.cz [147.251.48.3])
	by anor.ics.muni.cz (8.12.1/8.12.1) with ESMTP id i3IIr0na012276
	for <linux-lvm@redhat.com>; Sun, 18 Apr 2004 20:53:00 +0200
Received: from anxur.fi.muni.cz (IDENT:11561@localhost [127.0.0.1])
	by anxur.fi.muni.cz (8.12.10/8.12.8) with ESMTP id i3IIr0uw017083
	for <linux-lvm@redhat.com>; Sun, 18 Apr 2004 20:53:00 +0200 (MEST)
Received: (from kas@localhost)
	by anxur.fi.muni.cz (8.12.10/8.12.8/Submit) id i3IIr0b3017082
	for linux-lvm@redhat.com; Sun, 18 Apr 2004 20:53:00 +0200 (MEST)
Date: Sun, 18 Apr 2004 20:53:00 +0200
From: Jan Kasprzak <kas@informatics.muni.cz>
Subject: Re: [linux-lvm] lvextend fails on v2 metadata
Message-ID: <20040418185259.GF21069@fi.muni.cz>
References: <20040418182303.GD21069@fi.muni.cz>
	<20040418133837.B5005@homer.msp.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040418133837.B5005@homer.msp.redhat.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Alasdair G Kergon wrote:
: On Sun, Apr 18, 2004 at 08:23:03PM +0200, Jan Kasprzak wrote:
: > Then I have written a simple Perl script to lvextend the test_lv volume
: > by 1 extent from either md5 or md6, depending on which one has the higher
: > fraction of free extents. This way I will get as perfect interleaving as I
: > can get on the PVs of different size.
: 
: The method you're using means every extent gets listed separately in the
: metadata, so you'll need to prepare a lot more space for it when you
: run pvcreate.
: 
: Check out the --metadatasize option to pvcreate.

	Yes, this may be the problem. As I said, I am not able to test it
now. The metadata size depends on the PV size? It would be helpful
if lvextend can print something about insufficient space in metadata on
the PV.

	Thanks for the explanation.

-Y.

-- 
| Jan "Yenya" Kasprzak  <kas@{fi.muni.cz - work | yenya.net - private}> |
| GPG: ID 1024/D3498839      Fingerprint 0D99A7FB206605D7 8B35FCDE05B18A5E |
| http://www.fi.muni.cz/~kas/   Czech Linux Homepage: http://www.linux.cz/ |
 Any compiler or language that likes to hide things like memory allocations
 behind your back just isn't a good choice for a kernel.   --Linus Torvalds
