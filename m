Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oABGkonk010132
	for <linux-lvm@redhat.com>; Thu, 11 Nov 2010 11:46:50 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oABGkcrD017449
	for <linux-lvm@redhat.com>; Thu, 11 Nov 2010 11:46:39 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id oABGkcBo022113
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 11 Nov 2010 11:46:38 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id oABGkbkA012421
	for <linux-lvm@redhat.com>; Thu, 11 Nov 2010 11:46:38 -0500
Date: Thu, 11 Nov 2010 11:46:37 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4CDB01F8.6090202@gmail.com>
Message-ID: <Pine.LNX.4.64.1011111140550.12331@bmsred.bmsi.com>
References: <4CDAAE84.5060806@gmail.com>
	<Pine.LNX.4.64.1011101235510.1807@bmsred.bmsi.com>
	<4CDB01F8.6090202@gmail.com>
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

> > Tell us exactly what you mean by "put a LVM on it".  Did you run
> > pvcreate?  vgcreate?  lvcreate? You might find the output of "pvs"
> > enlightening.  That will tell us what PVs you have created.
> > And list /dev/mapper so we know what dm-0 is, and include the output of
> > "lvs".
> >
> 	Let me put this way, I thought I did. I mean, after creating the
> partition, setting it to LVM (8e), then running
> 
> pvcreate /dev/sdc1
> vgcreate export /dev/sdc1
> lvcreate -L 400G --name vms export
> 
> I used mkfs.ext4 to create partition (on /dev/mapper/export-vms) and off I
> went. Do you think I missed a step?

Great.  Now include output of "lvs"

BTW, if you really suspect a disk error, test for it directly.
E.g., you can run

# dd if=/dev/sdc1 of=/dev/null bs=256k

to read through the partition or

# smartctl -t long /dev/sdc

To initiate a long self test of the disk (need smartmontools installed).

A brand new disk that flunks self test is indeed defective.

However, for real physical I/O errors, there would be errors logged
in /var/log/messages referencing sdc (as opposed to dm-0), so I still
think it is a logical error.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
