References: <CADMzvUosd-YX99qpabH7UUZARNvJiBJXR6k7kVUjVSniYLty1Q@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5702217A.9090206@redhat.com>
Date: Mon, 4 Apr 2016 10:10:34 +0200
MIME-Version: 1.0
In-Reply-To: <CADMzvUosd-YX99qpabH7UUZARNvJiBJXR6k7kVUjVSniYLty1Q@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM Performance issues when creating many Volume
	groups
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
To: linux-lvm@redhat.com, syed1.mushtaq@gmail.com

Dne 1.4.2016 v 19:30 Syed Mushtaq napsal(a):
> Hi linux-lvm,
>
> In my setup I am trying to map a backend ISCSI storage volume to a volume
> group. I am using that volume group as a Disk for VMs in Xen. However, If I
> create many volume groups, future volume group creates are slowing down. In my
> test I have about 600 VGs. Each VG has a single LV. Here are the commands that
> are taking a lot of time
>
> create volume group ( 4.8s ): /usr/sbin/vgcreate VG_XenStorage-1fe15110-61f6-
> 856f-8ae2-8e42e45a4316 /dev/disk/by-id/scsi-36f47acc1000000007931637600000523
>
> list lvs inside volume group ( 2.4s ): /usr/sbin/lvs --noheadings --units b -o
> +lv_tags /dev/VG_XenStorage-1fe15110-61f6-856f-8ae2-8e42e45a4316
>
> check if LVM volume group exisits (2.5s) : /usr/sbin/vgs
> VG_XenStorage-1fe15110-61f6-856f-8ae2-8e42e45a4316
>
> I am using LVM 2.0.88. Is this a known issue? Any workarounds?
>
> Thanks for you help.
> -Syed


Hi


Lvm2 upstream is now working on release 2.02.150.
Your version 2.02.88 is from Aug 2011.

If you want to get some fixes for your version I'm afraid you will
need to bother your distro maintainer.

You may use '-vvvv' debug to see where it is delayed.
Also 'strace -ttt' is helpful.

Common problems are:

- Users do not set 'correct' lvm.conf filters, so lvm2 with each command has 
to unnecessarily scan all devices in your system and some might be pretty slow 
to read...

- Very long set of files stored in /etc/lvm/archives  (or wherever your distro 
has this directory).

- Of course using 5 years old software is out-of-radar of upstream developers...

Regards

Zdenek
