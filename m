Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2NFA9j04748
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 10:10:09 -0500
Received: from sbbmail1.sbb.ch (sbbmail1.sbb.ch [193.192.251.19])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2NFA7WA018017
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 10:10:08 -0500
Received: from intmail1.sbb.ch (intmail1.sbb.ch [10.104.27.189])
	by sbbmail1.sbb.ch (Switch-3.1.4/Switch-3.1.0) with ESMTP id
	i2NF9tS3016347
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 16:09:55 +0100
Received: from gmx.net (i34390.sbb.ch [147.78.17.245])
	by intmail1.sbb.ch (Switch-3.1.4/Switch-3.1.0) with ESMTP id
	i2NF9shO015869
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 16:09:55 +0100
Message-ID: <40605340.625224A7@gmx.net>
Date: Tue, 23 Mar 2004 16:09:52 +0100
From: Thomas Meller <thomas.meller@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to associate two paths for each EMC device?
References: <OF2EB2F204.F8A111CC-ON85256E5C.00683842@db.com>
Content-Transfer-Encoding: 7bit
Reply-To: thomas.meller@gmx.net,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I had to solve a similar problem lastly.

For me, there is some more complicated stuff to get rid of. We are using SRDF mirroring.
This leads to seeing the same disk_content_ on a different physical disk. This disk is
readonly. LVM1 searches all disks in descending order and uses the readonly instead of the
writeable copy.

To find out which disk is which LUN, you can use scsi_info from the
kernel-pcmcia-cs-3.1.31-9 RPM.
Of course this is only valid for RH.

I solved the problem by vgscanning the SAN from initrd. On the ramdisk image, I included the
device files for the devices to scan only.
The Emulex SAN driver I use creates scsi devices sorted by Symmetrix, then LUN. So, the
first 4 devices are on Symmetrix-A, starting from 0-0-0, followed by the devices on
Symmetrix-B, starting form 0-0-0.
I recommend to use static bindings, not only to change the device's order.

The RedHat functions create all devicenodes on the initrd. So, scanning has to take place
before it starts doing so. Afterwards I copy the lvmtab to the mounted real-root-device,
overwriting the last active fileset.
I have set up a HA cluster. Scanning the LVMs at bootup is vital for me. If you are not in
need for updating the lvmtab frequently, you can do vgscans manually. You will have to
remove the unneeded devicenodes before doing so.
With LVM2, you can specify limits for vgscan. If the QLogic driver works in a similar way,
this may be handy.

BTW: you do failover within the driver?
I tried to do so, but up to now I failed.
Can you tell me more about how the QLogic driver can be configured to failover?
This is a bit off topic. Could you reply to this question by using my real address?

Good luck

Thomas


Shan Jing wrote:
> 
> The very basic way to identify the pair is to lvm each of the first 22 luns in a sequence and see which lun in the other 22 set is also lvm'ed.
> 
> However, there must be a more technical way to resolve this and eventually make the disk represent only once.  Any guru out there can help?
> 
> Regards,
> Shan Jing
> 
> Unix Group - Americas
> Deutsche Bank
> 2 Gatehall Drive, 3rd Floor
> Parsippany, New Jersey, USA
> shan.jing@db.com
> 973.682.3463
> 
>
