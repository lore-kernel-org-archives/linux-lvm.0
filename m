Received: from dhcp80-228.msp.redhat.com (dhcp80-228.msp.redhat.com
	[10.15.80.228])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q6JGO8Om029106
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2012 12:24:08 -0400
Mime-Version: 1.0 (Apple Message framework v1084)
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <5006BF05.9090305@tempest.sk>
Date: Thu, 19 Jul 2012 11:24:09 -0500
Message-Id: <6D198F92-64E3-434D-A080-ABD40898784F@redhat.com>
References: <5006BF05.9090305@tempest.sk>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Replacing failed disk in raid volume without hot
	spare
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


On Jul 18, 2012, at 8:49 AM, Tomas Vanderka wrote:

> 
> Tried all of theese, nothing seems to work
> 
> [root@lvm ~]# lvconvert --repair test/raid6
>  Couldn't find device with uuid jnGEwl-EVqs-yQ0M-rUxa-gLqD-fHNU-AJUKjl.
> Attempt to replace failed RAID images (requires full device resync)? [y/n]: y
>  Insufficient suitable allocatable extents for logical volume : 87 more required
>  Failed to allocate replacement images for test/raid6
>  Failed to replace faulty devices in test/raid6.

could you perhaps attach the verbose output from this command?
e.g.> echo  y | lvconvert --repair test/raid6 -vvvv >& output.txt

 brassow
