Message-ID: <3FE0E57A.9010509@tupshin.com>
From: Tupshin Harper <tupshin@tupshin.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] weird duplicate pv problem
References: <3FE0C0CA.6050400@tupshin.com>
In-Reply-To: <3FE0C0CA.6050400@tupshin.com>
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
Date: Wed Dec 17 17:25:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Tupshin Harper wrote:

> I have an lvm2 volume group composed of about 8 different pvs. 
> Recently, most lvm commmands started displaying errors like below. Not 
> that it is claiming duplicate PVs, but the duplicates are contained in 
> /dev/nbd/*, and I'm not actually using any network block devices. I 
> have NBD comiled into the kernel, and I'm about to compiling a kernel 
> with nbd not compiled in and see if that helps, but it seems extremely 
> odd that lvm would detect duplicate pvs on unused nbd devices.
>
> The effects of the problem (in addition to getting these warnings, are 
> that any change to a lv(resizing, for example), will render that lv 
> inactive or suspended (have seen both), until I do a magic incarnation 
> that involves first "vgcfgrestore" and then "lvchange -a y" on the 
> affected lv. Note that vgcfgrestore does not make the warnings go 
> away, but it does allow the lvchange command to succeed.
>
> Any thoughts? FWIW, I am using devfs, and I'm still curious about a 
> reasonable migration strategy to move an lvm2 setup to non-devfs. 
> Kernel 2.6.0-test11, lvm tools that come with debian sid(lvm version 
> 2.00.05, library version 1.00.05-ioctl-cvs, driver version 4.0.0).
>
> -Tupshin
>
As I suspected, running a kernel with nbd compiled as a module and not 
loading it at startup avoids this probem. But this doesn't bring me any 
closer to an understanding of why lvm would see duplicate pv id's on nbd 
devices that I never used.

-Tupshin
