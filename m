Message-ID: <4D4978D2.20508@redhat.com>
Date: Wed, 02 Feb 2011 16:31:30 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <4D41B887.2050507@lakedaemon.net>
In-Reply-To: <4D41B887.2050507@lakedaemon.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] guruplug 2.6.37 lvm2 problem
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Jason <lvm@lakedaemon.net>

On 01/27/2011 07:25 PM, Jason wrote:
> I have a small problem that's I've been beating my head against for two 
> days.
> 
> I've installed debian onto an sdcard according to [1].  This required a 
> new U-boot [2].  For grins, I chose encrypted LVM.  It works fine with 
> the 2.6.33.3flipflip kernel [3].  However, I'm trying to get 2.6.37 
> vanilla to work.
> 
> I think I'm almost there except that lvm2 segfaults every time right 
> after I enter the password.  So, I jumped into initramfs and ran 'lvm 
> pvscan -v -v -v -v' for both kernels.  Here's the output:

GuruPlug is ARM arch, right?

Can you recompile lvm without O_DIRECT support (--disable-o_direct)
and try it again?

I know that ARM had wrongly implemented direct-io (it was kernel problem),
so let's try this first.

Milan
