Message-ID: <3E27EFD4.9060002@inrialpes.fr>
From: Frederic Tronel <Frederic.Tronel@inrialpes.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Unable to mount root fs after kernel upgrade
References: <004a01c2be1e$2f73cdd0$240b892c@pe1mhp.ampr.org>
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
Date: Fri Jan 17 05:57:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com, JanVG@Knoware.NL

>>I'm not really sure of why this problem occurs but I've been able to 
>>solve it in the past doing a rdev on the linux kernel image to 
>>indicate that the root fs is /dev/vg00/root. man rdev should 
>>help you finding the 
>>accurate syntax. By the way I thought the problem was due to 
>>grub (since I'm using grub instead of lilo), but it seems 
>>that's not the reason.
>>
>>Fred.
> 
> 
> Fred do I understand you correct that this is a lilo issue ?
> Lilo is not using the option "root=/dev/vg00/root" when booting ?

To be honest I'm not really sure of the real source of this problem.
I would rather say that it's related to the way the parameter 
/dev/vg00/root is passed to the kernel. Indeed /dev/vg00/root must be 
translated into a (major,minor) number before be usable by the kernel.
This should be done at the time you ran lilo. With grub the problem is a 
little bit different since you can change all the parameters at boot 
time. But I'm pretty sure it is not due to lilo, since I had the same 
problem using grub instead.

However, each time I've been able to solve the problem by rebooting on a 
previous working kernel (lvm enabled), and writing the root fs inside 
the new kernel image using rdev.

BTW, have you been able to boot your new kernel ?

Frederic
