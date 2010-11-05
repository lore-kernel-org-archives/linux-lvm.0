Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oA54dbjL021062
	for <linux-lvm@redhat.com>; Fri, 5 Nov 2010 00:39:37 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oA54dQmP015387
	for <linux-lvm@redhat.com>; Fri, 5 Nov 2010 00:39:27 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id oA54dQhL004592
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 5 Nov 2010 00:39:26 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id oA54dPH0031173
	for <linux-lvm@redhat.com>; Fri, 5 Nov 2010 00:39:26 -0400
Date: Fri, 5 Nov 2010 00:39:25 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4CD35D3E.5030200@cfl.rr.com>
Message-ID: <Pine.LNX.4.64.1011050022550.31032@bmsred.bmsi.com>
References: <4CD35D3E.5030200@cfl.rr.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM + raid + san
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 4 Nov 2010, Phillip Susi wrote:

> I was wondering about using LVM to manage disks on a SAS SAN with one or more
> multi disk enclosures and multiple host servers.  It looks like LVM has the
> capability to manage all of the disks as PVs and coordinate between the hosts
> to allow any given host to mount any given lv at any time, but I could not
> figure out how raid would fit into the picture.

I would run LVM on the SAN server, exporting LVs as SAN units, and each host
would get a virtual SAN disk to do with as it pleased, including running
LVM on it.  Then you don't have to deal with locking issues for a shared
volume group.  If your SAN server is embedded, it must already have some sort
of management interface to parcel out disk space as virtual disks.
If you don't like its interface, then consider replacing it with a 
general purpose host running LVM as described above.  That said, many
do use shared volume groups with no problem.

Generally, your SAN (whether embedded or a dedicated general purpose host)
already has the raid built in.  The exported virtual disks are raid
reliable.  If not, replace the SAN.  The whole point of SAN is to not
worry about physical disks anymore on the client systems.  If you had multiple
SANs on separate physical LANs, you could stripe them for super speed, but
otherwise raid is already built in.  And you can bond multiple 1000BT 
interfaces with a gigabit switch to get really fast transfer from 
the SAN anyway.

If the SAN server is a general purpose host, I would run raid10, or linux md
extensions to it that get most of the benefits with fewer disks:

http://en.wikipedia.org/wiki/Non-standard_RAID_levels

raid5 has the read/modify/rewrite problem.

I would not use the device-mapper raid, as you note.

Caveat: I've never actually setup a SAN, just used them.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
