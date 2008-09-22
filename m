Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8MLV9hM014188
	for <linux-lvm@redhat.com>; Mon, 22 Sep 2008 17:31:10 -0400
Received: from e1.ny.us.ibm.com (e1.ny.us.ibm.com [32.97.182.141])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8MLUvi5017514
	for <linux-lvm@redhat.com>; Mon, 22 Sep 2008 17:30:57 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e1.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m8MLUuI7027477
	for <linux-lvm@redhat.com>; Mon, 22 Sep 2008 17:30:56 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	m8MLUujA048928
	for <linux-lvm@redhat.com>; Mon, 22 Sep 2008 17:30:56 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m8MLUuWd019778
	for <linux-lvm@redhat.com>; Mon, 22 Sep 2008 17:30:56 -0400
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	m8MLUurY019767
	for <linux-lvm@redhat.com>; Mon, 22 Sep 2008 17:30:56 -0400
Date: Mon, 22 Sep 2008 14:30:55 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Problems growing a logical volume with LVM tools.
Message-ID: <20080922213055.GB19145@us.ibm.com>
References: <Pine.OSX.4.62.0809201012250.31987@kaiso.biophysics.mcw.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.OSX.4.62.0809201012250.31987@kaiso.biophysics.mcw.edu>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

vinai [vroopcha@mcw.edu] wrote:
> - And finally (or so I thought) I ran lvextend to resize the logical 
> volume.  But here's where I ran into issues.  Here's the command I've been 
> trying and the output:
>
> # lvresize -d -v -l 1668910  /dev/array2/rd2
>     Finding volume group array2
>     Archiving volume group "array2" metadata (seqno 4).
>   Extending logical volume rd2 to 6.37 TB
>     Creating volume group backup "/etc/lvm/backup/array2" (seqno 5).
>     Found volume group "array2"
>     Found volume group "array2"
>     Loading array2-rd2 table
>   device-mapper: reload ioctl failed: Invalid argument
>   Failed to suspend rd2

Does de-activating the volume group and then re-activating and then
resizing the lv (or shutdown the machine in the worst case) work? Looks
like there is a known issue with block device resize. I am not sure if
you are hitting that though.

--Malahal.
