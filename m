Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2UFcYO00675
	for <linux-lvm@redhat.com>; Wed, 30 Mar 2005 10:38:34 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.205])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j2UFcS6m014431
	for <linux-lvm@redhat.com>; Wed, 30 Mar 2005 10:38:28 -0500
Received: by wproxy.gmail.com with SMTP id 68so196141wra
	for <linux-lvm@redhat.com>; Wed, 30 Mar 2005 07:38:23 -0800 (PST)
Message-ID: <c23be1c30503300738690039d8@mail.gmail.com>
Date: Wed, 30 Mar 2005 23:38:16 +0800
From: Andy Sy <andy.sy@gmail.com>
In-Reply-To: <20050330065236.GA18365@percy.comedia.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <mailman.11694.1112144246.19557.linux-lvm@redhat.com>
	<c23be1c305032917022b076064@mail.gmail.com>
	<20050330065236.GA18365@percy.comedia.it>
Subject: [linux-lvm] Re: putting lvm autodetect into the kernel ala md
Reply-To: Andy Sy <andy.sy@gmail.com>,
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

Luca Berra wrote:

> >Just like the kernel is now able to autodetect and
> >autoenable md RAID arrays, are there plans to make

> kernel autodetection of md arrays is almost always a 
> bad idea, it is far better to use mdadm in user space for that.

Why is this necessarily so?   RAID autodetect seems to 
avoid a lot of configuration hassles especially when your 
root partition is involved.  Any horror stories to tell?
 
> >lvm do the same?  (i.e integrate the functionality
> >of vgscan / vgchange -ay,-an into the kernel)

> no, it is an user space task, there is no reason to
> burden the kernel with this.

People have recommended against using an LVM
volume for your root partition citing the hassle of
a rescue disk as being the main reason.  If lvm volume
autodetect and enabling were in the kernel, then
this would no longer be the case.

I have a good reason for wanting my root partition
to be a logical volume: this is because I can
install my distro directly into it one single big
logical volume and only have to worry about how
to repartition it later in the game. 

Being unable to use a logical volume as root
partition is very inconvenient because you have
to make an early decision regarding which of your
top-level directories (i.e. /usr, /home, /var, /opt, /tmp) 
to turn into logical volumes and which ones to 
put on physical partitions.  Worse, as far as I can 
tell, you are forced to allocate one logical volume per
top-level dir.  This means you are unable to share 
logical volume space among directories for which 
it makes sense to (e.g. /opt and /usr), thus you 
might find yourself resizing logical volumes more
often than you wish down the line.

If lvm were stable and mature enough, and if the claism
being made for it as having very low overhead area are 
accurate, the logical conclusion (no pun intended) would 
be for people to eventually stop using physical partitions 
and using volume groups from the get-go.

Unless lvm detect/enable functionality were built into
the kernel though, you will always have to live with a 
physical partition holding /boot - the case today
with LVM and RAID0, but not RAID1 (from which it is
possible to boot directly off of).
