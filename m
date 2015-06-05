Received: from [10.40.200.41] (ovpn-200-41.brq.redhat.com [10.40.200.41])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5584YF7027218
	for <linux-lvm@redhat.com>; Fri, 5 Jun 2015 04:04:34 -0400
Message-ID: <55715811.8020706@redhat.com>
Date: Fri, 05 Jun 2015 10:04:33 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAAYit8QCcaGvb5QPw_Xuk+oavthHR1c32oB0GsGd+Ypk0rPtRg@mail.gmail.com>	<55704119.4000606@redhat.com>
	<CAAYit8T2YTHCrGf2rPYdQUTQOGn3uZVQkEkJ-DCbj+9iovRw+g@mail.gmail.com>
In-Reply-To: <CAAYit8T2YTHCrGf2rPYdQUTQOGn3uZVQkEkJ-DCbj+9iovRw+g@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] libdm cannot swap names between two child volumes
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 5.6.2015 v 05:32 M.H. Tsai napsal(a):
> 2015-06-04 20:14 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
>> Please provide  sequence of  'ioctl' where you think there is a bug.
>> (or disclose your code using libdm).
>
> Assume that there's a top-level LV "lv1",
> and two sub-LVs "lv1_child1" and "lv1_child2".
> The table of the top-level LV is "0 1234 my-target-type 253:1 253:2",
> as following:
>
> # dmsetup ls --tree
> vg1-lv1 (253:3)
>   ├─ vg1-lv1_child1 (253:1)
>   └─ vg1-lv2_child2 (253:2)


The problem with rename is -

you have device   'lv1'  you rename it to 'lv2' - yet
those who opened device with the name 'lv1' still thinks
the 'lv1' device exits.

So for safety reason before you 'reuse' any existing name in-use,
there should be 'deactivating' such device first - so there is no 'race' in 
name usage.

It's even possible we miss to track full history of active renamed device.

Since you get into strange scenarios when you start to count
with udev event handling and link generating here - it's getting nearly 
impossible to synchronize this properly...

Zdenek
