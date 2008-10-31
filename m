Message-ID: <91b13c310810301947x6c268b7bp9df8d4376be72011@mail.gmail.com>
Date: Fri, 31 Oct 2008 10:47:02 +0800
From: "rae l" <crquan@gmail.com>
Subject: Re: [linux-lvm] How to make lvm error handling robust?
In-Reply-To: <49098ACA.9000409@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <91b13c310810300015j25be4feeqdab86d28ecfb0866@mail.gmail.com>
	<49098ACA.9000409@redhat.com>
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
To: bmr@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Oct 30, 2008 at 6:22 PM, Bryn M. Reeves <bmr@redhat.com> wrote:
> rae l wrote:
>> How to make lvm error handling robust?
>>
>> Steps:
>> 1. create pv,vg,lv on multiple disks, one group (sda,sdb,sdc), other
>> groups (sdd, sde, ...);
>> 2. unplug one disk (sda, one pv);
>>
>> then all LVM broken, even other unrelated groups of lvm cannot work
>> from then on,
>
> Not been the case when I've encountered this situation. The affected VG
> can only be activated in partial mode but all other VGs should continue
> to operate just fine.

The real problem is:

1. When one PV corrupted, the information of VG and LV on this VG will
remain in the Linux Kernel and keep until rebooting;

Steps:
1. pvcreate /dev/sd[a-c]
2. vgcreate vg1 /dev/sd[a-c]
3. lvcreate -n lv1 -L 200G vg1

now the PV/VG/LV all looks good, lvs will display them all;

Then one PV corrupted (hard disk fail, or some program does stupid
thing), do like this:
1. dd if=/dev/zero of=/dev/sda

then pvs/vgs/lvs will all report errors, cannot find the required information,

  Couldn't find all physical volumes for volume group vg1.

Even I cannot remove it:
1. lvremove /dev/mapper/vg1-lv1
2. vgremove vg1

Only after rebooting, the stupid error message will go.

So the real problem is how to strip the stupid error message without a reboot?

Thank you.

>
>> all lvm commands report error and stops executing.
>>
>> How to solve this?
>
> Plan your storage better. If you're placing VGs on single disk devices
> then you should use LVM2's redundancy features - by creating mirrored
> LVs you would avoid a single disk becoming a single point of failure.
>
> Alternately, address redundancy further down the stack by using hardware
> or software RAID to add redundancy and fault tolerance to the storage
> being managed by LVM2.
>
> Regards,
> Bryn.


-- 
Cheng Renquan, Shenzhen, China
George Carlin  - "The other night I ate at a real nice family
restaurant. Every table had an argument going."
