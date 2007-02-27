Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1RFgxmp016342
	for <linux-lvm@redhat.com>; Tue, 27 Feb 2007 10:42:59 -0500
Received: from Mycroft.westnet.com (Mycroft.westnet.com [216.187.52.7])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l1RFgtKX021698
	for <linux-lvm@redhat.com>; Tue, 27 Feb 2007 10:42:56 -0500
Received: from jfsnew.stoffel.org (68-118-228-211.dhcp.oxfr.ma.charter.com
	[68.118.228.211]) (authenticated bits=0)
	by Mycroft.westnet.com (8.13.8/8.13.8) with ESMTP id l1RFgpja027534
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 27 Feb 2007 10:42:51 -0500 (EST)
MIME-Version: 1.0
Message-ID: <17892.20858.582811.496280@jfsnew.stoffel.org>
Date: Tue, 27 Feb 2007 10:42:50 -0500
From: "John Stoffel" <john@stoffel.org>
Subject: Re: [linux-lvm] LVM - History
In-Reply-To: <809419.63369.qm@web32913.mail.mud.yahoo.com>
References: <20070221212318.GA8141@IUPUI.Edu>
	<809419.63369.qm@web32913.mail.mud.yahoo.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>


k> Thaks for your help; my goal is to document LVM, from
k> an architecture, and source code point of views:
k> -The architecture will probably go back to 70�s or
k> early 80�s.

It goes back even earlier than that AFAIK

k> -The Source code will start from when LVM, started to exist as an
k> open source product (1998??) , and the product that inspired the
k> first release.

Don't forget MD.  

k> Do you know if IBM licensed, LVM to HP, and also released it to the
k> open source for linux developments?

Nope, not that I know of.  I think it happened that people liked the
logic and commands of the HP LVM version and decided to implement
something similiar.

k> Did Linux (Sistina) LVM derived from the IBM's LVM? Is
k> HP's LVM also drived from IBM's LVM? 

Don't forget that there are also filesystems which had/have LVM like
options.  DEC's Advfs had the ability to carve up and use multiple
disks in a filesystem.  Very nice stuff.

Sun has two LVM like setups, the first is the Solstice DiskSuite
(originally Sun DiskSuite) tools, as well as their re-branded version
of Veritas' VxVM which they called Sun Volume Manager (SeVM I
think?).  

Veritas was the big non-iron vendor of LVM software for a long time.
They also had the VxFS filesystem which layered ontop of VxVM very
nicely and let you grow/shrink volumes and filesystems.  Expensive,
but solid.

Linux has had several different LVM like projects over the years.
There's the original Linux RAID stuff, evms (Enhanced Volume Manager
System) which is IBM based as I recall.  This morphed into the DM
(Device Mapper) stuff of today.

You also need to be careful how you define whan an LVM is.  Does it
include filesystems?  Or how about a filesystem with some (but not
all) LVM features?  

It's a funky roadmap, and I'm sure people would be interested to see
and comment on what you find out.

John
