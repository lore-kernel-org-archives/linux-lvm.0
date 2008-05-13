Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4D1CWo9021402
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 21:12:32 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4D1CMI5007176
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 21:12:22 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m4D1CG1a006192
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 21:12:17 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m4D1CGSS023555
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 21:12:16 -0400
Date: Mon, 12 May 2008 21:12:16 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] lvm partition on ramdisk
In-Reply-To: <1c748a490805121507j1bbf6a13sd03111667eda783f@mail.gmail.com>
Message-ID: <Pine.LNX.4.44.0805122107040.23513-100000@bmsred.bmsi.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 12 May 2008, Larry Dickson wrote:

> OK, I got it to work using your workaround. Thanks, Stuart.
> 
> NEXT QUESTION...
> 
> How do I get LVM to put all the extents of the ramdisk BEFORE any of the
> extents of the raid array? Even if I list the pvs, ramdisk first, in the
> lvcreate command and/or start with the ramdisk in a vgcreate followed by
> adding the raid array in a vgextend... it always ignores the ramdisk and
> only assigns extents from the raid array. (I suppose it is putting the
> ramdisk at the end, where it is useless for my purposes.)

You can specify which PV to use in lvcreate.  

Let me repeat the warning - if the system goes down while the ramdisk
is part of the volume group, LVM will be unhappy and require recovery
of the volume group.  (I.e. your system could be unbootable.)  You had better
not have your root fs on the VG.  

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
