References: <3f51904f43c45f8c1259f1b050402358@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5070f4fa-81ad-9c9a-b0a7-8d5463ea09d3@redhat.com>
Date: Tue, 15 Sep 2020 20:34:56 +0200
MIME-Version: 1.0
In-Reply-To: <3f51904f43c45f8c1259f1b050402358@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvmcache with vdo - inconsistent block size
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>

Dne 14. 09. 20 v 23:44 Gionatan Danti napsal(a):
> Hi all,
> I am testing lvmcache with VDO and I have issue with devices block size.
> 
> The big & slow VDO device is on top of a 4-disk MD RAID 10 device (itself on 
> top of dm-integrity). Over the VDO device I created a thinpool and a thinvol 
> [1]. When adding the cache device to the volume group via vgextend, I get an 
> error stating "Devices have inconsistent logical block sizes (4096 and 512)." [2]
> 
> Now, I know why the error shows and what i means. However, I don't know how to 
> force the cache device to act as a 4k sector device, and/if this is really 
> required to cache a VDO device.
> 
> My current workaround is to set VDO with --emulate512=enabled, but this can be 
> suboptimal and it is not recommended.
> 
> Any idea on what I am doing wrong?

Hi

LVM currently does not support mixing devices of different sector sizes within
a single VG as it brings lot of troubles we have not yet clear vision what
to do with all of them.

Also this combination of provisioned devices is not advised - since you are 
combining 2 kind of devices on top of each other and it can be a big problem
to solve recovery case.

On lvm2 side we do not allow to use 'VDO LV' as backend for thin-pool device.

So ATM it's on a user to solve all the possible scenarios that may appear on
such device stack.

Zdenek
