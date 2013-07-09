Message-ID: <51DBFFC4.6070501@redhat.com>
Date: Tue, 09 Jul 2013 14:19:16 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <CAKAA-nmORsWxeOX1O0Hnv6nFx_1nM41CUULk15biAfuderXmGg@mail.gmail.com>
	<51DBDDE8.3010206@redhat.com>
	<CAKAA-nnZUvBuHmRaD9mn19gC51GfiihmweaJXTDRfRN92mstag@mail.gmail.com>
In-Reply-To: <CAKAA-nnZUvBuHmRaD9mn19gC51GfiihmweaJXTDRfRN92mstag@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Very slow i/o after snapshotting
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
Cc: Zdenek Kabelac <zkabelac@redhat.com>, Micky <mickylmartin@gmail.com>

On 07/09/2013 01:51 PM, Micky wrote:
>> Is this supposed to be a bug report ?
>
> Sorry for bashing the info. I was just answering the questions. LOL!
>
>> So far I've no idea about disks/tables in use, system/kernel in use, lvm
>> version in use....
>
> RHEL 6.4 kernel-2.6.32-358.el6 (also tested with self compiled 3.8)
> lvm2-2.02.98-9.el6.x86_64
> Disk on external mega raid controller with ext4

How does it perform without snapshot? I have seen a sluggish RAID array 
when run out of battery.

Is there a reason to use that big chunks?
If the origin is seeing a lot of small dispersed writes using big chunk 
may multiply it manyfold (actually worst case 128-times: every 4k write 
generating 512k read from origin and then written to snapshot.)

-- Marian

> Running Xen hypervisor but tested without it as well
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
