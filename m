Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1FKaFO17817
	for <linux-lvm@redhat.com>; Tue, 15 Feb 2005 15:36:15 -0500
Received: from mail.mindstorm.com (visual.mindstorm.com [66.166.235.10])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j1FKaEhU029162
	for <linux-lvm@redhat.com>; Tue, 15 Feb 2005 15:36:15 -0500
Received: from [10.0.15.197] (unknown [65.118.120.94])
	by mail.mindstorm.com (Postfix) with ESMTP id 15CF64B30
	for <linux-lvm@redhat.com>; Tue, 15 Feb 2005 11:37:59 -0800 (PST)
Message-ID: <42124F96.2090607@mindstorm.com>
Date: Tue, 15 Feb 2005 11:37:58 -0800
From: Nicholas Veeser <nicholas@mindstorm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Seem to be in trouble
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
To: linux-lvm@redhat.com

So I have been converting my Suse 9.1 fileserver to use lvm2. (2.6.4)
Seems I have have run into trouble and not sure what to do to get out of it.

All of my physical volumes are Raid 1 mirros.  (/dev/md0, /dev/md1)

I was just converting /dev/md1 to a PV.
I was then moving all of the PE's in /dev/md0 to /dev/md1.
Just about the point that it finished, the machine hung. 

I could log in, but then just about everything I could do with the 
filessystem would cause a process to hang.
So after about 10 minutes, I rebooted the machine. 
Then I got a whole bunch of errors and the fsck was being run on all  
the filesystems.
Then I got an oops.  So I rebooted without those disks and upgraded the 
kernel to 2.6.10.

Things seem to be mostly ok now except:
One of my logical volumes is messed up.
I have a new logical volume called /dev/system/pvmove0 which is huge.
I don't want to delete it in case I can use it to recover.

When I run pvmove, it detects the move in progress, but says there are 
problems:
# pvmove
Number of segments in active LV pvmove0 does not match metadata
Number of segments in active LV pvmove0 does not match metadata
ABORTING: Mirror percentage check failed.

Any ideas on what to do now?
Is there anyway to recover?

Nicholas
