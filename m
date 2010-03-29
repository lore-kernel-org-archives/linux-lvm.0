Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2TLfi11022880
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2010 17:41:44 -0400
Received: from n24.bullet.mail.ukl.yahoo.com (n24.bullet.mail.ukl.yahoo.com
	[87.248.110.141])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o2TLfQuM002190
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2010 17:41:26 -0400
Message-ID: <426304.90637.qm@web87107.mail.ird.yahoo.com>
References: <4BB0D44A.1F8D.00A2.0@cegepsth.qc.ca>
Date: Mon, 29 Mar 2010 21:41:25 +0000 (GMT)
From: chris procter <chris-procter@talk21.com>
In-Reply-To: <4BB0D44A.1F8D.00A2.0@cegepsth.qc.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Reduce an LVM volume split on two physical disks
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>


>Hi,
> 
>I have an LVM volume of 1.8TB split on two physical disk that have a 900 someting GB partition on each of them.
> 
>I need to change the second disk, and only 396GB og the 1.8TB is used...so can I reduce the size of the LVM volume to only the first disk, change the second disk and expand after the LVM volume to the second disk?


You should be able to do this.

You'll need to reduce the size of the filesystem (using resize2fs if its ext3) so it will fit on the one disk, it will probably need to be unmounted for this bit, and its not entirely risk free so make sure you have a good backup before you start.

Then you can use lvreduce to shrink the lv down so its small enough to fit on the one disk. 

vgdisplay should then show how many PE are in use on each disk, if you're lucky then the whole lv will be on the right disk already, if not then you can use pvmove to migrate all the used pe on the 2nd disk onto the first disk. This should leave the second disk completly empty (i.e. all of its pe free)

Once the lv is entirely on the disk you want to keep then you can use vgreduce to remove the unused second disk from the vg.

Then replace the disk and use vgextend to add the replaced disk into the volume group, lvextend the lv back up to the original size, and extend2fs will expand the filesystem to file the newly resized lv.


But its late so you probably want to read the appropriate man pages and check my logic before you do anything  :)

chris



      
