Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5B7rgXi027981
	for <linux-lvm@redhat.com>; Sun, 11 Jun 2006 03:53:42 -0400
Received: from tungsten.msp.technicality.org (tungsten.msp.technicality.org
	[216.250.164.46])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5B7rYGc005224
	for <linux-lvm@redhat.com>; Sun, 11 Jun 2006 03:53:35 -0400
Received: from tungsten.msp.technicality.org (tungsten.msp.technicality.org
	[216.250.164.46])
	by tungsten.msp.technicality.org (8.13.4/8.13.4/Debian-3sarge1) with
	ESMTP id k5B7rOVb010817
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Sun, 11 Jun 2006 02:53:25 -0500
Date: Sun, 11 Jun 2006 02:53:24 -0500 (CDT)
From: Nate Carlson <natecars@natecarlson.com>
Subject: Re: [linux-lvm] lvcreate - race condition creating snapshots
In-Reply-To: <448B01F9.604@solid-soft.at>
Message-ID: <Pine.LNX.4.63.0606110251220.864@tungsten.msp.technicality.org>
References: <448B01F9.604@solid-soft.at>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, 10 Jun 2006, Robert Valentan wrote:
> I think, there is a race condition in lvcreate while makeing a new 
> snapshot.
>
> System: Tyan with 2 Opteron 246
>        xen 3.0.2-3
>        linux 2.6.16.13
>        lvm 2.02.07
>        3ware-Raid 9550 Raid5
>
> Under xen i was unable to create a snapshot, I got always "LV 
> system/snap in use: not deactivating". Without xen, i got occasionally a 
> snapshot.

<..>

> i got always a snapshot (on all 3 systems!). I think, there is an other 
> thread which is creating the new lv, and it will take longer as the 
> lvcreate will "think". I have to less knowledge to make a patch, which 
> is waiting for the correct event (creating lv complete).

Are you running udev, perchance?

Try reading the thread entitled "Problem creating snapshots with 2.6.16.9 
and LVM 2.02.06", and refer to the following Debian bug:

http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=343671

In the bug history, there's debate if it's a problem with LVM or udev, 
although your mail seems to indicate LVM.  :)

(Note that I've also been having this problem for awhile, and the udev 
"hack" seems to resolve it..)

------------------------------------------------------------------------
| nate carlson | natecars@natecarlson.com | http://www.natecarlson.com |
|       depriving some poor village of its idiot since 1981            |
------------------------------------------------------------------------
