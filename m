Message-ID: <3BA0AE16.1A4F69F@carolina.rr.com>
Date: Thu, 13 Sep 2001 09:01:10 -0400
From: Jason Edgecombe <jedgecombe@carolina.rr.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM
References: <NBBBJHKIOKPKOGOEPEDPAEEJDNAA.stuart@bh90210.net>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

you MUST run lvmcreate_initrd and use the initrd it creates if you run
an LVM root fs.

It doesn't matter if LVM is in the kernel or as a module. If your root
is not in LVM, then I don't think that you have to use initrd.

Sincerely,
Jason Edgecombe


"IT3 Stuart B. Tener, USNR-R" wrote:
>         So for LVM, you do need to use the lvmcreate_initrd program or not? I am still not clear on that.
> 
>         If I need to make an lvmcreate_initrd, does not that mean it cannot be in the kernel?
