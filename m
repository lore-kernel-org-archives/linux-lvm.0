Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2UAeCj11579
	for <linux-lvm@redhat.com>; Tue, 30 Mar 2004 05:40:12 -0500
Received: from anor.ics.muni.cz (root@anor.ics.muni.cz [147.251.4.35])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2UAeA1X001978
	for <linux-lvm@redhat.com>; Tue, 30 Mar 2004 05:40:10 -0500
Received: from anxur.fi.muni.cz (IDENT:0@anxur.fi.muni.cz [147.251.48.3])
	by anor.ics.muni.cz (8.12.1/8.12.1) with ESMTP id i2UAe9h2006427
	for <linux-lvm@redhat.com>; Tue, 30 Mar 2004 12:40:09 +0200
Received: from anxur.fi.muni.cz (IDENT:11561@localhost [127.0.0.1])
	by anxur.fi.muni.cz (8.12.10/8.12.8) with ESMTP id i2UAe8uw022163
	for <linux-lvm@redhat.com>; Tue, 30 Mar 2004 12:40:08 +0200 (MEST)
Received: (from kas@localhost)
	by anxur.fi.muni.cz (8.12.10/8.12.8/Submit) id i2UAe8oU022161
	for linux-lvm@redhat.com; Tue, 30 Mar 2004 12:40:08 +0200 (MEST)
Date: Tue, 30 Mar 2004 12:40:08 +0200
From: Jan Kasprzak <kas@informatics.muni.cz>
Subject: Re: [linux-lvm] LVM2 over RAID-5 (AMD64)
Message-ID: <20040330104008.GE3444@fi.muni.cz>
References: <20040329152509.GA27@fi.muni.cz>
	<1080586970.1133.32.camel@tesla.mmt.bellhowell.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1080586970.1133.32.camel@tesla.mmt.bellhowell.com>
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

Jeffrey Layton wrote:
: 
: On Mon, 2004-03-29 at 10:25, Jan Kasprzak wrote:
: > 	Hello,
: > 
: > 	I have problems creating a LV on top of SW RAID-5 volume.
: > I have Fedora Core 1/AMD64, and LVM2 utils 2.00.08-5 RPM from the latest
: > Fedora Core beta (1.90, I think). My kernel is 2.6.4. The problem is that
: > 1) Metadata version 2 does not work at all, and
: 
: This is a little sparse on details, but you may have the problem I hit,
: which was not having set up lvm.conf to exclude the underlying devices.
: LVM2 (at least its current iteration) doesn't automagically exclude
: devices that underly an MD set. 

	This is strange, because lvcreate -v -v writes something like

Duplicate PV R9n6ygz1oDeeOQWQH9vPFWCVirNSQ9rr on /dev/sda4 - using md /dev/md5

which looks as if lvcreate knows that it has to use md5 instead of sda4.

: You might try setting a filter in lvm.conf that excludes everything but
: MD devices, e.g.:
: 
: filter = [ "a|^/dev/md|", "r|.*|" ]
: 
: Not sure if this works at all with LVM1, though.

	Yes, this fixed the problem (tested both on V1 and V2 metadata).
Thanks for a hint!

-Yenya

-- 
| Jan "Yenya" Kasprzak  <kas@{fi.muni.cz - work | yenya.net - private}> |
| GPG: ID 1024/D3498839      Fingerprint 0D99A7FB206605D7 8B35FCDE05B18A5E |
| http://www.fi.muni.cz/~kas/   Czech Linux Homepage: http://www.linux.cz/ |
 Any compiler or language that likes to hide things like memory allocations
 behind your back just isn't a good choice for a kernel.   --Linus Torvalds
