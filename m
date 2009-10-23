Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9NFfmGu009157
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 11:41:48 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9NFfcZ7026235
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 11:41:38 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n9NFfbx9006706
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 11:41:37 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n9NFfbah025792
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 11:41:37 -0400
Date: Fri, 23 Oct 2009 11:41:37 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] How do I use free PE?
In-Reply-To: <f6d6a910910230803g54c095bbwe1c4df66573f8678@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0910231130350.25657@bmsred.bmsi.com>
References: <f6d6a910910230803g54c095bbwe1c4df66573f8678@mail.gmail.com>
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

On Fri, 23 Oct 2009, Rod Rook wrote:

> I've installed Fedora 10 on a 250GB SATA hard drive.
> I want to use the unused portion (free PE= 4378, about 140GB), but I don't
> know how I go about doing it.
> I don't want to add it to VolGroup00, but I want it made accessible as a
> general storage space.
>   PV Name               /dev/sdb2
>   VG Name               VolGroup00
>   PV Size               232.69 GB / not usable 4.58 MB
>   Total PE              7446
>   Free PE               4376
>   Allocated PE          3070

It already *is* part of VolGroup00.  To use it, you can:

1) increase the size of an existing filesystem, e.g. / on LogVol00.

  or
   
2) allocate another LV and create a filesystem on that.  

I don't use the GUI tools, but here is how you could do (2) on
the command line:

# lvcreate -L 100G -n data VolGroup00
# mke2fs -j -L/data /dev/VolGroup00/data
# mkdir /data

Edit /etc/fstab and add a line like the following:

LABEL=/data             /data                   ext3    noexec,nodev    1 0

# mount /data


Be sure to leave a gig or two of free space on VolGroup00 so that you
can make a snapshot of LogVol00 (or data) for backup:

# lvcreate -s -L1G -n LogVol00_snap VolGroup00/LogVol00
# mkdir /mnt/LogVol00
# mount -r /dev/VolGroup00/LogVol00_snap /mnt/LogVol00
# rsync -ravHX /mnt/LogVol00/ /path/to/directory/on/large/backup/disk
# lvremove VolGroup00/LogVol00_snap

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
