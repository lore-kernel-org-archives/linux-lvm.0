Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p5LFZr9N001577
	for <linux-lvm@redhat.com>; Tue, 21 Jun 2011 11:35:53 -0400
Received: from cdptpa-omtalb.mail.rr.com (cdptpa-omtalb.mail.rr.com
	[75.180.132.120])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p5LFZpQq031940
	for <linux-lvm@redhat.com>; Tue, 21 Jun 2011 11:35:51 -0400
Message-ID: <4E00BA55.1000506@cfl.rr.com>
Date: Tue, 21 Jun 2011 11:35:49 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <1308260745.12257.1464013973@webmail.messagingengine.com>	<alpine.LRH.2.00.1106170004310.20086@bmsred.bmsi.com>
	<1308326398.9219.1464298109@webmail.messagingengine.com>
In-Reply-To: <1308326398.9219.1464298109@webmail.messagingengine.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Help to mount ext3 boot partiton which reports it's
 LVM2_member when I try to mount it
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Lee Gold <leegold@operamail.com>

On 6/17/2011 11:59 AM, Lee Gold wrote:
> In my opinion LVM2 should of flagged me when it went about changing my
> config - which it did - the boot partition's location and spec could not

/It/ did not do anything.  /You/ ran pvcreate on the wrong partition, 
probably because when you connected the second disk, it became sda 
instead of sdb as you probably expected, and you ran pvcreate /dev/sdb1, 
which was your boot partition.
