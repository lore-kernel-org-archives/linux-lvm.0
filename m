Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l099Txdx019842
	for <linux-lvm@redhat.com>; Tue, 9 Jan 2007 04:30:00 -0500
Received: from smtp-out1.berkeley.edu (smtp-out1.Berkeley.EDU [128.32.61.106])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l099TxTc028522
	for <linux-lvm@redhat.com>; Tue, 9 Jan 2007 04:29:59 -0500
Received: from adsl-75-18-230-253.dsl.pltn13.sbcglobal.net ([75.18.230.253]
	helo=[192.168.42.3])
	by fe5.calmail with esmtpsa (TLSv1:AES256-SHA:256) (Exim 4.65)
	(auth plain:stevenschlansker@berkeley.edu)
	(envelope-from <stevenschlansker@calmail.berkeley.edu>)
	id 1H4DIo-0007yN-HH
	for linux-lvm@redhat.com; Tue, 09 Jan 2007 01:29:54 -0800
Message-ID: <45A36071.2040803@calmail.berkeley.edu>
Date: Tue, 09 Jan 2007 01:29:21 -0800
From: Steven Schlansker <stevenschlansker@calmail.berkeley.edu>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove ioctl errors
References: <20070106161048.GA18619@kallisti.us>
In-Reply-To: <20070106161048.GA18619@kallisti.us>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Indeed I had the same error.  Nothing I tried worked until I upgraded 
the device mapper tools/libraries and the lvm stuff (not sure which one 
fixed it, but doing both did)

Then it worked like a charm.

Ross Vandegrift wrote:
> Hi everyone,
>
> Judging by the archives, a few others have seen this issue, but I'm
> getting errors when I try to pvmove off a PV to remove it from my VG:
>
> root@turalyon:~# pvmove -v /dev/hda2
>     Wiping cache of LVM-capable devices
>     Finding volume group "vg0"
>     Archiving volume group "vg0" metadata (seqno 16).
>     Creating logical volume pvmove0
>     Moving 33769 extents of logical volume vg0/home
>     Found volume group "vg0"
>     Creating vg0-home
>     Loading vg0-home table
>     Resuming vg0-home (253:0)
>     Updating volume group metadata
>     Creating volume group backup "/etc/lvm/backup/vg0" (seqno 17).
>     Found volume group "vg0"
>     Found volume group "vg0"
>     Suspending vg0-home (253:0)
>     Found volume group "vg0"
>     Creating vg0-pvmove0
>     Loading vg0-pvmove0 table
>   device-mapper: reload ioctl failed: Invalid argument
>   ABORTING: Temporary mirror activation failed.  Run pvmove --abort.
>     Found volume group "vg0"
>     Loading vg0-pvmove0 table
>   device-mapper: reload ioctl failed: Invalid argument
>     Loading vg0-home table
>   device-mapper: reload ioctl failed: Invalid argument
> root@turalyon:~# 
>
>
> I noticed one post that indicated pvmove requires snapshot support,
> which I don't normally use.  Before running this pvmove, I modprobed
> all of the dm-* modules just to make sure.
>
> The box in question is running Ubuntu Edgy Eft on i386.  I've been
> able to recover just fine from this by rebooting, running pvmove
> --abort, and then rebooting again.
>
> Obviously this prevents me from removing the volume though.  Thanks in
> advance for any help!
>
>
>   
