Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAAHg0XV021133
	for <linux-lvm@redhat.com>; Wed, 10 Nov 2010 12:42:00 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAAHfmJN017306
	for <linux-lvm@redhat.com>; Wed, 10 Nov 2010 12:41:49 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id oAAHfmUW024249
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 10 Nov 2010 12:41:48 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id oAAHfmVK002410
	for <linux-lvm@redhat.com>; Wed, 10 Nov 2010 12:41:48 -0500
Date: Wed, 10 Nov 2010 12:41:48 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4CDAAE84.5060806@gmail.com>
Message-ID: <Pine.LNX.4.64.1011101235510.1807@bmsred.bmsi.com>
References: <4CDAAE84.5060806@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Bad disk?
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

On Wed, 10 Nov 2010, Mauricio Tavares wrote:

> Those dm-0 messages do not make me happy. dmesg and vgchange make me think the
> problem is on the new drive:

Those dm-0 messages are probably a logical error.  For instance, a snapshot
that is full would give those errors.  You need to tell us what dm-0 is
mapped to.  Look in /dev/mapper for starters.

> [  268.024593] scsi 0:0:0:0: Direct-Access     ATA      ST3500320NS  SN04 PQ:
> 0 ANSI: 5
> [  268.024900] sd 0:0:0:0: [sdc] 976773168 512-byte logical blocks: (500
> GB/465 GiB)
> [  268.024918] sd 0:0:0:0: Attached scsi generic sg2 type 0
> [  268.024996] sd 0:0:0:0: [sdc] Write Protect is off
> [  268.025003] sd 0:0:0:0: [sdc] Mode Sense: 00 3a 00 00
> [  268.025046] sd 0:0:0:0: [sdc] Write cache: enabled, read cache: enabled,
> doesn't support DPO or FUA
> [  268.025377]  sdc: sdc1
> [  268.049853] sd 0:0:0:0: [sdc] Attached SCSI disk

This is normal for your new disk.

> [  335.467482] quiet_error: 3 callbacks suppressed
> [  335.467492] Buffer I/O error on device dm-0, logical block 104857584
> [  335.467540] Buffer I/O error on device dm-0, logical block 104857584
> [  335.467589] Buffer I/O error on device dm-0, logical block 104857598
> [  335.467615] Buffer I/O error on device dm-0, logical block 104857598
> [  335.467647] Buffer I/O error on device dm-0, logical block 0
> [  335.467671] Buffer I/O error on device dm-0, logical block 0
> [  335.467703] Buffer I/O error on device dm-0, logical block 1
> [  335.467734] Buffer I/O error on device dm-0, logical block 104857599
> [  335.467762] Buffer I/O error on device dm-0, logical block 104857599
> [  335.467788] Buffer I/O error on device dm-0, logical block 104857599

Again, this is on dm-0, not sdc.

> raub@strangepork:~$ sudo sfdisk -l /dev/sdc
> 
> Disk /dev/sdc: 60801 cylinders, 255 heads, 63 sectors/track
> Units = cylinders of 8225280 bytes, blocks of 1024 bytes, counting from 0
> 
>    Device Boot Start     End   #cyls    #blocks   Id  System
> /dev/sdc1          0+  60800   60801- 488384001   8e  Linux LVM
> /dev/sdc2          0       -       0          0    0  Empty
> /dev/sdc3          0       -       0          0    0  Empty
> /dev/sdc4          0       -       0          0    0  Empty

This is normal, not sure what is has to do with filesystem desciptors.

Tell us exactly what you mean by "put a LVM on it".  Did you run
pvcreate?  vgcreate?  lvcreate? You might find the output of "pvs"
enlightening.  That will tell us what PVs you have created.
And list /dev/mapper so we know what dm-0 is, and include the output of "lvs".

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
