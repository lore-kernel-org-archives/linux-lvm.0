Received: from ns3.rdu.redhat.com (ns3.rdu.redhat.com [10.11.255.199])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8CGmacd017359
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2008 12:48:36 -0400
Received: from localhost.localdomain (dhcp-0-147.brq.redhat.com [10.34.0.147])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id m8CGmZZt010315
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2008 12:48:35 -0400
Message-ID: <48CA9D5F.8090502@redhat.com>
Date: Fri, 12 Sep 2008 18:48:31 +0200
From: Jaroslav Stava <jstava@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Recovering LVM partition after OS reinstallation
References: <3d847d110809120248r796de032u29b08d41278c6299@mail.gmail.com>
In-Reply-To: <3d847d110809120248r796de032u29b08d41278c6299@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

hanocri wrote:
> After root filesystem failure my "/" was all messed up so i had to
> install system from scratch (Debian Unstable). /home is on separate
> LVM partition and (i hope so) intact. However pvscan and vgscan gives
> no result. According to fdisk partition is marked as "8e  Linux LVM".
> I have LVM metadata backup which you can find here:
> http://pastebin.com/m5a13d266
> At line 23 there is: 'device = "/dev/dm-7"    # Hint only ', but there
> is no such device as /dev/dm-7. I think it should be rather /dev/dm-6
> (I'm using dmraid), again according to fdisk - the size and type is
> correct.
> Should I change dm-7 into dm-6 or simply ignore it and do
> vgcfgrestore? And what does ' #Hint only' mean? Or maybe there is
> other way to recover LVM config?
>
> Thanks for any help.
>
>   
Check dmraid. Twice.

If *scan can't find a lvm pv, than there is something wrong.
(unless you are filtering out /dev/dm* - check filter= in lvm.conf)

Did you (or the Debian installation) change the partition layout?
Where did you install the system to? I assume not to the old
"lvroot" logical volume.

Partition type (fdisk) means quite nothing.
If the device/partition is a lvm PV, then there should be an lvm
label at the beginning. That's what vgscan is looking for (see -vvv).
If there is no label at the beginning, then:
- we are looking at the wrong place - partition layout changed or
  perhaps dmraid changed it's mapping
- we are looking at the correct place, but the label is not there
 
You could try looking for the label at other places - man pvck.

Either way provide some info:
"lvmdump -m -a" can automate that
or at least post dmsetup table, vgscan -vvv
dmraid information

Regards,
Jaroslav Stava
