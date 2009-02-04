Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n141YnfN015566
	for <linux-lvm@redhat.com>; Tue, 3 Feb 2009 20:34:49 -0500
Received: from mckesson.com (mailgw02.mckesson.com [143.112.144.28])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n141YXa3022851
	for <linux-lvm@redhat.com>; Tue, 3 Feb 2009 20:34:33 -0500
From: "Allen, Jack" <Jack.Allen@mckesson.com>
Content-class: urn:content-classes:message
In-Reply-To: <20090204011132.GK20668@agk.fab.redhat.com>
References: <4905EFD192EEDF4A9A19EEE98C32B7F70EC28F06@DBQV3005.na.corp.mckesson.com><4905EFD192EEDF4A9A19EEE98C32B7F70EFB49CC@DBQV3005.na.corp.mckesson.com>
	<20090204011132.GK20668@agk.fab.redhat.com>
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] What causes this type of messages
Date: Tue, 3 Feb 2009 19:33:21 -0600
Message-ID: <4905EFD192EEDF4A9A19EEE98C32B7F70EFB4B52@DBQV3005.na.corp.mckesson.com>
In-Reply-To: <20090204011132.GK20668@agk.fab.redhat.com>
References: <4905EFD192EEDF4A9A19EEE98C32B7F70EC28F06@DBQV3005.na.corp.mckesson.com><4905EFD192EEDF4A9A19EEE98C32B7F70EFB49CC@DBQV3005.na.corp.mckesson.com>
	<20090204011132.GK20668@agk.fab.redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

 

-----Original Message-----
From: Alasdair G Kergon [mailto:agk@redhat.com] 
Sent: Tuesday, February 03, 2009 8:12 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] What causes this type of messages

On Tue, Feb 03, 2009 at 05:29:03PM -0600, Allen, Jack wrote:
>         What causes this type of messages when you do "vgdisplay -v"? 
>     Fixing up missing size (10.00 GB) for PV /dev/sdb1 

Incompatibilities between LVM2 versions to deal with a bug.
- Did you mix two versions of LVM2 (e.g. upgrade)?

The message is pretty harmless and should disappear after the metadata
is next
updated.  (If it doesn't, try updating to a newer version.)

Alasdair
-- 
agk@redhat.com
=====================================================================

Thanks for the reply.

This is at a customer and as far as I can tell LVM2 has not been updated
in a while. There is a hdr file in /var/spool/up2date with a date of Feb
2007. So I have to assume that was the last time LVM2 was updated. I ran
up2date -l and it does not show any updates for LVM2.
/etc/redhat-release indicates it is RH AS 4.7.

What would need to be done to cause the metadata to be updated?

-----
Thanks
Jack Allen
