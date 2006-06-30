Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5UArxja024070
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 06:53:59 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5UArv6V007468
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 06:53:58 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id 162C91F421C
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 12:53:52 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 00459-08 for <linux-lvm@redhat.com>;
	Fri, 30 Jun 2006 12:53:38 +0200 (CEST)
Message-ID: <44A502B0.7090708@conterra.de>
Date: Fri, 30 Jun 2006 12:53:36 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LV's have "disapeared"
References: <20060630083916.GO20554@vwclub.ro>
In-Reply-To: <20060630083916.GO20554@vwclub.ro>
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

Cristian Livadaru wrote:
> I have created some new lv's for some tests.
> What I did was based on this howto:
> 
> http://www.tldp.org/HOWTO/LVM-HOWTO/recipethreescsi.html
> 
> pvcreate /dev/hdk 
> pvcreate /dev/hdi
> 
> vgcreate vhostvg /dev/hdk /dev/hdi
> 
> lvcreate -L1G -nvm01lv vhostvg 
> ok and here I thinkg I made a big mistake!
> since I had no partitions on my disks and I assumed that I needed one so
> that it matches the LVM that was created by debian automaticaly I
> created on both disks a partition and changed the type to 8e  Linux LVM.
> I actualy worked with the lv's and everything is ok ( except my speed
> problem but this is a other topic )
> now after a rebbot, I only see the lv created by debian, not the one
> that I kind of screwed up with my partitioning.
> 
> Is there a simple way to recover it? It's not that important that I
> would wast to much time with it, it was just for testing anyway and I
> could recreate them.

You created the partitions, but as long as you did not write any data
to the created partition, nothing bad happened so far. Just delete
the partition again. The partition table resides in the first sector
of the disk, which is fortunately unused by LVM.

Dieter.
