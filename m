Received: from [172.16.45.98] (dhcp-98.brisbane.redhat.com [172.16.45.98])
	by pobox.brisbane.redhat.com (8.13.1/8.13.1) with ESMTP id
	m1D8a9Mv010225
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 18:36:09 +1000
Message-ID: <47B2AC45.6030901@redhat.com>
Date: Wed, 13 Feb 2008 18:37:25 +1000
From: Mark Huth <mhuth@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvcreate problem
References: <b646832c0802130013x2081fe55y10f6e2c079134acf@mail.gmail.com>
In-Reply-To: <b646832c0802130013x2081fe55y10f6e2c079134acf@mail.gmail.com>
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

Yajith Ajantha Dayarathna | ????? ????? ??????? wrote:
> Hi all,
> Forgive me if this is the wrong list to ask this question.
> I'm quite new to LVM(-and to this list) and one of my friends brought 
> this question up to me..
>
> There is an error coming up when they try to "pvcreate"
>
> Below is the "fdisk -l" output.
>
> [root@lwlsvr bin]# fdisk -l
>
>
> Disk /dev/cciss/c0d0: 145.6 GB, 145667358720 bytes
> 255 heads, 32 sectors/track, 34866 cylinders
> Units = cylinders of 8160 * 512 = 4177920 bytes
>
> Device Boot Start End Blocks Id System
> /dev/cciss/c0d0p1 * 1 25 101984 83 Linux
> /dev/cciss/c0d0p2 26 7554 30718320 83 Linux
> /dev/cciss/c0d0p3 7555 8068 2097120 82 Linux swap
> /dev/cciss/c0d0p4 8069 34866 109335840 5 Extended
> /dev/cciss/c0d0p5 8069 10578 10240784 83 Linux
> /dev/cciss/c0d0p6 10579 10587 36704 83 Linux
> /dev/cciss/c0d0p7 10588 10596 36704 83 Linux
> /dev/cciss/c0d0p8 10597 10725 526304 83 Linux
> /dev/cciss/c0d0p9 10726 10988 1073024 83 Linux
> /dev/cciss/c0d0p10 10989 11251 1073024 83 Linux
> /dev/cciss/c0d0p11 11252 11776 2141984 83 Linux
> /dev/cciss/c0d0p12 11777 12301 2141984 83 Linux
> /dev/cciss/c0d0p13 12302 12826 2141984 83 Linux
> /dev/cciss/c0d0p14 12827 13351 2141984 83 Linux
> /dev/cciss/c0d0p15 13352 13876 2141984 83 Linux
> /dev/cciss/c0d0p16 13877 34866 85639184 8e Linux LVM
>
> When a pvcreate is attempted on "/dev/cciss/c0d0p16" it produces the 
> below output.
>
> [root@lwlsvr informix]# pvcreate /dev/cciss/c0d0p16
> pvcreate -- can't open physical volume "/dev/cciss/c0d0p16" to get its 
> size
>
AFAIK, the major/minor numbering scheme for block devices limits you to 
15 partitions per device.

Mark
