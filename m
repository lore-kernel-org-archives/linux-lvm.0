Mime-Version: 1.0 (Apple Message framework v624)
In-Reply-To: <45C8BDE7.5020403@myself.gen.nz>
References: <45C62BB0.6090004@free.fr>
	<abae97f2062bff4699caa277e2faea30@redhat.com>
	<45C8BDE7.5020403@myself.gen.nz>
Message-Id: <df6ea8a84df5faffc829a6033d5edaa6@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] replacing a failling disk on a mirrred VG.
Date: Thu, 8 Feb 2007 02:51:02 -0600
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
To: LVM general discussion and development <linux-lvm@redhat.com>, steve@myself.gen.nz


On Feb 6, 2007, at 11:41 AM, Steve Wray wrote:

> Jonathan E Brassow wrote:
>> This one should be pretty easy...
>> Effectively, you want to keep the primary mirror devices, so do:
>> lvconvert -m0 <vg/lv>
>> to down convert them to linear devices.
>> Then remove PV1 (vgreduce), add a new disk to your system, add it to 
>> your vg (vgextend), and finally, up-convert the linear devices to 
>> mirrors again:
>> lvconvert -m1 <vg/lv>
>
> So you can't just add a new disk and use pvmove to move extents off of 
> the failing disk?
>

You could if it was a linear device, but we are still working on the 
proper stacking of mirrors.

  brassow
