Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j27Dsrn02031
	for <linux-lvm@redhat.com>; Mon, 7 Mar 2005 08:54:53 -0500
Received: from smtp.itanets.com (smtp.itanets.com [216.12.200.84])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j27DspgV021782
	for <linux-lvm@redhat.com>; Mon, 7 Mar 2005 08:54:51 -0500
From: Delian Krustev <krustev@krustev.net>
Subject: Re: [linux-lvm] Reducing the Linux LVM(8e) partition itself (not PV,
	VG or LV)
Date: Mon, 7 Mar 2005 15:54:48 +0200
References: <1110115850.4677.216665923@webmail.messagingengine.com>
In-Reply-To: <1110115850.4677.216665923@webmail.messagingengine.com>
MIME-Version: 1.0
Message-Id: <200503071554.48408.krustev@krustev.net>
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

On Sunday 06 March 2005 15:30, Ajeet Nankani wrote:
> I have a /dev/hda6 partition as Linux LVM(8e), its size is around 8GB.
> I have one PV(no free PEs in it all are allocated) in this partition.
> This PV has a total size of around 7GB.
> I have also made sure that this PV is contiguous from the start of the
> LVM partition hence it is confirmed that the free 1GB is at the end of
> LVM partition.
> I want to reduce this Linux LVM(8e) partition and recover this 1GB free
> space to create a fat32 partition.
> When i tried to print partition table of this /dev/hda6 through gnu
> parted, it gave error "Error: Could not detect file system." and so
> qtparted does not work either.

There's no partition table or filesystem on a LVM partiton.

>
> Is there anyway to reduce this linux LVM (8e) partition safely?

Here are the steps. I hope I won't miss one:

lvreduce ..(if You don't have enough free PE)
pvmove ..
vgreduce ..
repartition(fdisk, cfdisk, parted .. )
possible reboot(reread the partition table)
pvcreate ..
vgextend ..
possibly lvextend ..
mkdosfs ..


Cheers,
Delian
