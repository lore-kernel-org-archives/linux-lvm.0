Return-Path: <joe@66bassett.freeserve.co.uk>
Date: Sat, 16 Dec 2000 13:28:01 +0000
From: Joe Thornber <joe@66bassett.freeserve.co.uk>
Subject: Re: [linux-lvm] vgextend segfaults (lvm 0.9, kernel test10)
Message-ID: <20001216132801.A381@66bassett.freeserve.co.uk>
References: <20001216075237.21034.qmail@nwcst282.netaddress.usa.net>
Mime-Version: 1.0
In-Reply-To: <20001216075237.21034.qmail@nwcst282.netaddress.usa.net>; from bcorsello@usa.net on Sat, Dec 16, 2000 at 02:52:37AM -0500
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Something like this happens if you are using the latest code from CVS
rather than the 0.9 branch.  Did you checkout the correct code ?

cvs checkout -r LVM_0-9-patches LVM

- Joe


On Sat, Dec 16, 2000 at 02:52:37AM -0500, Brad Corsello wrote:
> The vgextend command segfaults (without core dump) every time, in lvm 0.9 on
> kernel 2.4.0-test10.  Is there an official patch to fix this?
> 
> Typical output is as follows:
> 
> [root@nimrod /root]# vgextend vg1 /dev/hda2
> vgextend -- INFO: maximum logical volume size is 255.99 Gigabyte
> Segmentation fault
> 
> and that's it.
> 
> ____________________________________________________________________
> Get free email and a permanent address at http://www.netaddress.com/?N=1
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
