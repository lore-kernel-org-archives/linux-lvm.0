From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] help with quota and LVM
Message-ID: <20020808225943.GA22974@localhost>
References: <3D52C578.5030807@jumpline.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3D52C578.5030807@jumpline.com>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Aug  8 17:59:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thursday, 08 August 2002, at 15:24:40 -0400,
Ben Snyder wrote:

> I'm running RedHat6.2 with kernel 2.2.19 and LVM 1.0.4 on ext2 file systems
> I'm having problems with quota and LVM.
> 
As far as I know filesystem quotas have only something to do with
filesystem: it is independent of the underlaying block device (hard disk
partition, or a LVM LV in your setup).

I remember having set up a LV (LVM version 1.0.4 if I recall correctly), 
built an ext3 filesystem on it, configured quotas as usual and it worked.
Kernel version is 2.4.19-pre7aa2, with no other patches applied.

I have just tried to setup ext2 quotas over a LVM version 1.0.3 Logical
Volume, and is working as expected. Kernel version here is
2.4.19-pre6aa1, and quota package is version 3.04-1. The procedure to
set quotas is exactly as done with filesystems on normal disk
partitions. In fact, the greatest problem for me has been a quota format
mismatch between "quotacheck", "quotaon" and compiled kernel.

Hope it helps.

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Woody (Linux 2.4.19-pre6aa1)
