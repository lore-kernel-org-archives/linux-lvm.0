Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1SIho9P024837
	for <linux-lvm@redhat.com>; Wed, 28 Feb 2007 13:43:50 -0500
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.238])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1SIhi8A022774
	for <linux-lvm@redhat.com>; Wed, 28 Feb 2007 13:43:44 -0500
Received: by wx-out-0506.google.com with SMTP id s11so201802wxc
	for <linux-lvm@redhat.com>; Wed, 28 Feb 2007 10:43:41 -0800 (PST)
Message-ID: <859a78260702281043u179acc69g21cd1df894820e3f@mail.gmail.com>
Date: Wed, 28 Feb 2007 12:43:41 -0600
From: "Matt P" <slarty.tj@gmail.com>
Subject: Re: [linux-lvm] Help: Mount point does not report full size of LV.
In-Reply-To: <5d25729a0702281007p381e10fas464177acaa614dc2@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <5d25729a0702281007p381e10fas464177acaa614dc2@mail.gmail.com>
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
To: linux-lvm@redhat.com

To be safe unmount the filesystem you want to grow. Then you'll use
the resize2fs command. From what you've provided so far, and assuming
you want to use all the available space on the LV, the command line
will probably look something like:

resize2fs -p /dev/VGforMyth/video

I'd recommending reading the man page for resize2fs before proceeding.

On 2/28/07, Nick Gyma <nickgyma@gmail.com> wrote:
>
>
> Thanks for the reply.  The other two disks are file system ext3.  Is it possible to change this 3rd disk to be ext3 as well from the current state i'm in?  and then resize to fill?
>
> Thanks for helping.  here are the results of vgdisplay:  (the 208.31GB is correct)
>
> nick@ubuntu:~$ sudo vgdisplay -v
> Finding all volume groups
> Finding volume group "VGforMyth"
> --- Volume group ---
> VG Name VGforMyth
> System ID
> Format lvm2
> Metadata Areas 3
> Metadata Sequence No 5
> VG Access read/write
> VG Status resizable
> MAX LV 0
> Cur LV 1
> Open LV 0
> Max PV 0
> Cur PV 3
> Act PV 3
> VG Size 208.31 GB
> PE Size 64.00 MB
> Total PE 3333
> Alloc PE / Size 3333 / 208.31 GB
> Free PE / Size 0 / 0
> VG UUID C8kSGQ-rAw1-GmUi-7oKx-zatX-8D1A-bYuK35
>
> --- Logical volume ---
> LV Name /dev/VGforMyth/video
> VG Name VGforMyth
> LV UUID q6mYAL-6r5u-92bK-xeIc-qttc-Zmxk-00e0rS
> LV Write Access read/write
> LV Status available
> # open 0
> LV Size 208.31 GB
> Current LE 3333
> Segments 3
> Allocation inherit
> Read ahead sectors 0
> Block device 253:0
>
> --- Physical volumes ---
> PV Name /dev/hda4
> PV UUID 9VmJ6M-UxhP-7LRF-SAOE-ix3l-pSWe-a2ueRL
> PV Status allocatable
> Total PE / Free PE 950 / 0
>
> PV Name /dev/hdb1
> PV UUID tCKbgt-nBvc-r8FS-OxEd-u9XW-NiOA-00q0BI
> PV Status allocatable
> Total PE / Free PE 1192 / 0
>
> PV Name /dev/hdd1
> PV UUID KEBtSE-LKcc-l79g-2NSh-6VLQ-HKoG-l0zciX
> PV Status allocatable
> Total PE / Free PE 1191 / 0
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
