Received: from [192.168.1.2] (vpn-6-1.fab.redhat.com [10.33.6.1])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l3OAVb2g005803
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2007 11:31:37 +0100
Message-ID: <462DDC87.5040808@redhat.com>
Date: Tue, 24 Apr 2007 11:31:35 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Configure lvm2 with drbd
References: <462DDAC5.20100@euddene.com>
In-Reply-To: <462DDAC5.20100@euddene.com>
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

Mariano Gonzalvo wrote:
> Hi,
> 
>     I'm trying to configure lvm2 on top of drbd. I've configured drbd
> (/dev/drbd0 and /dev/drbd1) and put them as primary node, but when I try
> to create a physical volume this is what it does happens
> 
>        pvcreate /dev/drbd0
>           Physical volume "/dev/drbd0" successfully created
>        pvdisplay
>             --- NEW Physical volume ---
>           PV Name               /dev/md4
>           VG Name
>           PV Size               129,45 GB
>           Allocatable           NO
>           PE Size (KByte)       0
>           Total PE              0
>           Free PE               0
>           Allocated PE          0
>           PV UUID               MtxjHy-8zfW-i9nq-TJA4-b6F9-jtcW-FkanLB
> 
>     /dev/md4 is the raid device over was configured drbd0.
> 
>     Why /dev/md4 it's taken as PV Name?
> 

It's trying to be helpful! Normally people build MD devices out of other devices
and so LVM uses the MD in preference to other devices it finds with the same UUID.

You'll need to exclude the MD device in the /etc/lvm/lvm.conf filters entry.
something like:

filter =[ "r/md4/" ]


-- 
Patrick

Registered Address: Red Hat UK Ltd, Amberley Place, 107-111 Peascod Street,
Windsor, Berkshire, SL4 ITE, UK.
Registered in England and Wales under Company Registration No. 3798903
