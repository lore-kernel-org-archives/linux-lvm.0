References: <20180410084730.GA9920@redhat.com>
	<20180410140016.GB9920@redhat.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <54d81d24-576e-17d4-8092-aa3d99eb69ff@redhat.com>
Date: Tue, 10 Apr 2018 17:01:03 +0200
MIME-Version: 1.0
In-Reply-To: <20180410140016.GB9920@redhat.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] "Data alignment must not exceed device size."
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
To: linux-lvm@redhat.com, "Richard W.M. Jones" <rjones@redhat.com>

Dne 10.4.2018 v 16:00 Richard W.M. Jones napsal(a):
> On Tue, Apr 10, 2018 at 09:47:30AM +0100, Richard W.M. Jones wrote:
>> Recently in Fedora something changed that stops us from creating small
>> LVs for testing.
>>
>> An example failure with a 64 MB partitioned disk:
>>
>> # parted -s -- /dev/sda mklabel msdos mkpart primary 128s -128s
>> Warning: The resulting partition is not properly aligned for best performance: 128s % 65535s != 0s
>> # lvm pvcreate --force /dev/sda1
>>    /dev/sda1: Data alignment must not exceed device size.
>>    Format-specific initialisation of physical volume /dev/sda1 failed.
>>    Failed to setup physical volume "/dev/sda1".
> 
> Interestingly the alignment properties of the virtio-scsi virtual disk
> has changed.  On the working system:
> 
> ==> /sys/block/sda/queue/minimum_io_size <==
> 512
> 
> ==> /sys/block/sda/queue/optimal_io_size <==
> 0
> 
> On the new / broken system:
> 
> ==> /sys/block/sda/queue/minimum_io_size <==
> 33553920

What is actually this /dev/sda  as device ?
scsi-0QEMU_QEMU_HARDDISK_drive-scsi0-0-0-0

Is this some qemu emulated storage ?

This reported value (33553920) doesn't really make sense - and testing over 
loop device doesn't seem to give same result either.

Regards

Zdenek
