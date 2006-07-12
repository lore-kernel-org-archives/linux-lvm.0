Received: from [192.168.1.2] (vpn-68-1.surrey.redhat.com [10.32.68.1])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6C9lO6C007610
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 10:47:24 +0100
Message-ID: <44B4C52B.7080000@redhat.com>
Date: Wed, 12 Jul 2006 10:47:23 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Whats happens? -> remove first phy disk from lvm
References: <1152697054.5934.3.camel@localhost.localdomain>
In-Reply-To: <1152697054.5934.3.camel@localhost.localdomain>
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

Denny Schierz wrote:
> hi,
> 
> i created a lvm volume over two partitions, hda8 and hdc8. Now hda8 is
> broken and have to replace the disk. 
> 
> on the lvm where several files. My questions, if i create a volume over
> more than one partition, is that a stipe? Or does lvm use the first
> partition, than the second?
> 


By default LVM will use the first PV, then the next. Striping has to be
specified when you create the LV.

Depending on the filesystem (and luck) you might get some files back off the
remaining disk :)


-- 

patrick
