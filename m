Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0EMFfr31498
	for <linux-lvm@redhat.com>; Fri, 14 Jan 2005 17:15:41 -0500
Received: from postfix3-1.free.fr (postfix3-1.free.fr [213.228.0.44])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0EMFZWE021408
	for <linux-lvm@redhat.com>; Fri, 14 Jan 2005 17:15:35 -0500
Received: from scorpion (unknown [82.227.230.101])
	by postfix3-1.free.fr (Postfix) with ESMTP id 148AC1734C6
	for <linux-lvm@redhat.com>; Fri, 14 Jan 2005 23:15:34 +0100 (CET)
Date: Fri, 14 Jan 2005 23:15:50 +0100
From: Stephane Dupuis <hoper@free.fr>
Message-ID: <1042776283.20050114231550@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: RAID, LVM and dm_crypt, please confirm setup
Reply-To: hoper@free.fr,
	LVM general discussion and development <linux-lvm@redhat.com>
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


Hi,

> I have (at home) the following setup for my data discs:
> 
2x 40  GB RAID1 -->> /dev/md0
2x 80  GB RAID1 -->> /dev/md1
2x160 GB RAID1 -->> /dev/md2
> 
> These are part of volume group vg00, consisting of 9 logical volumes 
> lv00...lv09
> 
> Now i set up crypt devices with cryptsetup and named these crypt devices 
> clv00...clv09.

Well I found this post really interesting :)

First, I'm sorry cause I can't help you here and say for sure "you are
doing the right thing" or "take care, what you are doing is dangerous".

But I want to make something like this at home and so have the same
concern about the good way to resize the files systems.

I don't know if it will help but I thought about another way of
mixing raid, lvm and dmcrypt.
Instead of crypting the logical volume, why not crypt the raid device?
So you can have :

Physical drives -->> /dev/mdX
using dmcrypt on it -->> /dev/mapper/mdX_crypt
And after make your LVM physical volume :
pvcreate /dev/mapper/mdX_crypt   ******* NOTE, SEE UNDER
vgcreate testvg /dev/mapper/mdX_crypt
and so on...

In this way, you will never have to resize the crypted device.
You will just have to resize the logical volume and the filesystem
as usual.

****** To be abble to do this, you need to edit the /etc/lvm/lvm.conf
file and change the "type" line to :
types = [ "device-mapper", 16 ]

Another advantage of this "crypted md" architecture (compare to
crypt the logical volume) is that the whole volume group are crypted,
included all the lvm metadata.

With your implementation, anybody can have access to the volume group
metadata, the logicals volumes names and so on...
(naming a logical volume "mpeg3_and_warez_fuck_riaa_lv" may not be a
good idea here ;o)

With all lvm metadata crypted, nobody can even know that you are
using lvm...

Of course, there are some drawback :(
First, It's mean that the same key will be use for a whole /dev/dm.
So, if you make a volme group on it, and.. let's say 10 logical
volume, it's mean than theses 10 lvs will be crypted with the same
key and that you can't choose to mount only 9 and think the last
one is "secure"

I did'nt decide wich way I will choose yet... but I need to have
a logical volume that don't have the same key as the other.
So I can't choose my way. I will surely make as you did... or mix the two ways.
(crypt the /dev/dm, make a vg, make lvs and for one particular lv,
crypt it again :o) Of course, I guess I will need cpu power here ;o)

So, I can't answer to your questions, I just also wonder about the
better way of putting all theses tools together...

Any comments are welcome...

Stephane Dupuis
-- 
()  ascii ribbon campaign
/\      - against html e-mail 
        - against microsoft attachments
