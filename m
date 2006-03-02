Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k22HxeQ22405
	for <linux-lvm@redhat.com>; Thu, 2 Mar 2006 12:59:40 -0500
Received: from bluewhale.planbit.co.uk (82-71-36-240.dsl.in-addr.zen.co.uk
	[82.71.36.240])
	by mx2.redhat.com (8.12.11/8.12.11) with ESMTP id k22Hxcl0015405
	for <linux-lvm@redhat.com>; Thu, 2 Mar 2006 12:59:38 -0500
Received: from wolverine (unknown [192.168.0.5])
	by bluewhale.planbit.co.uk (Postfix) with ESMTP id D241F12ED4
	for <linux-lvm@redhat.com>; Thu,  2 Mar 2006 17:58:20 +0000 (GMT)
From: "Roger Lucas" <roger@planbit.co.uk>
Date: Thu, 2 Mar 2006 17:58:20 -0000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <4405BE75.5040401@telecyl.com>
Message-Id: <20060302175820.D241F12ED4@bluewhale.planbit.co.uk>
Subject: [linux-lvm] Flushing a device
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Hi,

I have a question regarding how to ensure that all data is flushed to a
logical volume before a snapshot is taken.  The exact scenario is as
follows:

I have the logical volume "/dev/mapper/userfiles" which is formatted with
Reiser3.  The volume has been created using "dmsetup ... crypt ..." on top
of a logical volume "/dev/storage/cryptdisk".

My aim is to be able to write a set of files to the "/dev/mapper/userfiles"
volume, then take a snapshot of the "/dev/storage/cryptdisk" as a backup,
knowing that the contents of the backup are encrypted.

I don't have a problem setting up the above scenario or creating the
snapshot volume, but I want to be sure that the files I have written will be
in the backup.  My concern is that if all file writes have not been flushed
through all the layers of LVM then I will not get all the files in the
snapshot of then encrypted volume.  I have tried issuing the "sync" command,
but I am not confident that this has worked.

Is it necessary to forcibly flush the data through each layer of the above
volume "stack" so that I know it is all on the snapshot, or is this taken
care of automatically when the snapshot command is issued and I am just
being paranoid...

Thanks,

Roger.
