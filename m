Message-ID: <534BAD14.6060908@redhat.com>
Date: Mon, 14 Apr 2014 11:40:36 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <murxfqtymobkgufwnwhr@kvwl>
In-Reply-To: <murxfqtymobkgufwnwhr@kvwl>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] GRUB boot problem with lvm mirror type raid1
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
Content-Type: text/plain; charset="us-ascii"
To: gk180984@interia.pl
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 04/14/2014 10:42 AM, gk180984@interia.pl wrote:
> Hi
> I want to ask it is possible boot root file system (via GRUB) from LVM RAID1 volume?
> I can boot root file system (with /boot) from linera LVM volume and from mirror volume, but when I create raid1 mirror GRUB can't boot from it:
> 
> lvconvert --type raid1 -m1 gsys/vsys
> 
> LVM mirror is work:
> lvconvert -m1 gsys/vsys
> 
> I have two disk and use only LVM, not other raid software. GRUB have lvm module.

Grub doesn't support LVM RAID1 (it supports only RAID 4/5/6 type IIRC).

However, I don't recommend using /boot on LVM at the moment since
grub support for LVM is limited and unofficial. There's a plan to add
official and more robust support though - there are ongoing discussions
between grub and LVM team...

-- 
Peter
