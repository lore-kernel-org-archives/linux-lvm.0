Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7RBpQ9A008773
	for <linux-lvm@redhat.com>; Sun, 27 Aug 2006 07:51:26 -0400
Received: from rwcrmhc15.comcast.net (rwcrmhc15.comcast.net [204.127.192.85]
	(may be forged))
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7RBpIVE027260
	for <linux-lvm@redhat.com>; Sun, 27 Aug 2006 07:51:18 -0400
Received: from [192.168.1.3] (marvin.localnet [192.168.1.3])
	by furio.localnet (8.13.7/8.13.6) with ESMTP id k7RBp9ng001588
	for <linux-lvm@redhat.com>; Sun, 27 Aug 2006 07:51:10 -0400
Message-ID: <44F1872D.9030408@mattgillen.net>
Date: Sun, 27 Aug 2006 07:51:09 -0400
From: Matthew Gillen <me@mattgillen.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Best way to image devices in an LVM environment
References: <20060827044208.GL1011@strugglers.net>	<7.0.1.0.2.20060827131640.00fdf818@myrealbox.com>
	<20060827061642.GN1011@strugglers.net>
In-Reply-To: <20060827061642.GN1011@strugglers.net>
Content-Transfer-Encoding: 7bit
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

Andy Smith wrote:
> On Sun, Aug 27, 2006 at 01:20:26PM +0800, Jim Morgan wrote:
>> At 27/08/2006 12:42, you wrote:
>>> So how would you accomplish the task of replacing sda and sdb with
>>> larger disks in the least amount of effort?  Downtime is not a
>>> problem, taking backups of the data is not a problem, booting off a
>>> live cd is not a problem; the goal is to find the least
>>> labour-intensive way to do this.
>> As I understand it -- and as I've proved before in this list, my 
>> understanding is fundamentally flawed :-) -- there is a way to do this.
>>
>> Basically you have to force one disk to fail using the raid 
>> administration software. You then remove the disk, replace it with 
>> the bigger disk, and rebuild it from the first one. The partition 
>> sizes may need adjusting. Then you force the other disk to fail, and 
>> replace it with the larger one, and then rebuild it from the other large 
>> disk.
> 
> Well I would then be left with two large disks where sd[ab]5 (and
> the sd[ab]4 primary partition that sd[ab]5 is the only logical
> partition within) does not extend all the way to the end of the
> disk.  I wasn't aware that you could resize RAID-1 md arrays though,
> I thought it was restricted to RAID-5.  Is this not the case?

To add another "I'm not an expert" opinion:
Supposing you can get all 4 disks in the server at the same time, you could
add your new disk's large partition to your existing logical volume, then do
a pvmove.  The advantage over the previous suggestion is that you don't need
to resize your RAID device when you're done (although you'd still want to
resize your filesystem to take advantage of all the new space).

Although now that I look at the instructions for doing this
(http://tldp.org/HOWTO/LVM-HOWTO/removeadisk.html; section 13.5.1), it seems
that is a dangerous operation.  If it worked though, it would probably be
the least labor intensive.

Matt
