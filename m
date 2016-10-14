Received: from o.ww.redhat.com (ovpn-204-18.brq.redhat.com [10.40.204.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9ENJOcW022607
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 14 Oct 2016 19:19:25 -0400
References: <CANh6N61D51T9KjYSsh2WdKYPzjrPeVHOkv9JrL9_B4cRHw2USQ@mail.gmail.com>
	<CAE-HYsMjvbBXEoMHPF1gybwC-XVLequ4D7bzmzfmwJRjkGFhAA@mail.gmail.com>
	<CANh6N62PvwaTK4JXUpxmzfSbTY80Yc=f6c7JiKEfVhsXNL=9tw@mail.gmail.com>
	<CAE-HYsNiu1W8Wv9VH5KbPWq04OTyY9e1AkBg=-scb6R399sXrg@mail.gmail.com>
	<CANh6N62PTyFj5FmJz9iZF7f7dAx0CK=2HOovNk1bAWP9wZU4Mw@mail.gmail.com>
	<CAE-HYsPgRQiSQ_hMunSbJJgRkRGZLLEf1K5T2SA_zH8YhrfE8w@mail.gmail.com>
	<CAE-HYsPmC-Qm+bXU-p0L1iF3zEVZ-GZfchrbBSOXFss4BPX=aw@mail.gmail.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <2d717384-f02b-d260-3d06-167b2416dc0c@redhat.com>
Date: Sat, 15 Oct 2016 01:19:24 +0200
MIME-Version: 1.0
In-Reply-To: <CAE-HYsPmC-Qm+bXU-p0L1iF3zEVZ-GZfchrbBSOXFss4BPX=aw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM RAID5 out-of-sync recovery
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 10/12/2016 09:15 AM, Giuliano Procida wrote:
> On 12 October 2016 at 07:57, Giuliano Procida
> <giuliano.procida@gmail.com> wrote:
>>>   array_position=4294967295
>> This should be 1 instead. This is 32-bit unsigned 0xf...f. It may be
>> that it has special significance in kernel or LVM code. I've not
>> checked beyond noticing one test: role < 0.
> http://lxr.free-electrons.com/source/drivers/md/dm-raid.c
>
> Now role is an int and the RHS of the assignment is le32_to_cpu(...)
> which returns a u32. Testing < 0 will *never* succeed on a 64-bit
> architecture.
Well, the result of le32_to_cpu is assigned to a 32 bit int on 64 bit arch.

The 4294967295 reported by parse_rmeta will thus result in signed int 
role = -1
which is used for comparision.

The tool should rather report the array_position signed to avoid iritation.



>   This is a kernel bug. If the code is changed so that
> role is also u32 and the test is against ~0, it's possible that
> different, better things will happen. Please try reporting this to the
> dm-devel people.
>
> I still don't know what wrote that value to the superblock though.

Must have been the position gotten set to -1 indicating failure to hot add
the image LV back in and thus MD has written it to that superblock.

Did you spot any "Faulty.*device #.*has readable super block.\n 
Attempting to revive it."
messages from dm-raid in the kernel log by chance?

Heinz

>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
