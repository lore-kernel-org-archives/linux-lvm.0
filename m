Message-Id: <3C71A746.7000707@birddog.com>
From: "Kirby C. Bohling" <kbohling@birddog.com>
MIME-Version: 1.0
Subject: [OT]: Re: [linux-lvm] RH7.2 + kernel 2.4.17(or 16) + LVM 1.0.2
References: <002a01c1b8dd$4a23d4f0$0201a8c0@win2k>
    <19154749406.20020219015232@tnonline.net>
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
Date: Mon Feb 18 19:18:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

	That is a curious remark, on several occasions Alan Cox has said that he 
compiles and runs his kernels using a current RedHat compiler.  His 
kernel releases are generally known for their stability.  There were 
known problems with certain versions, but the recent releases I believe 
both of them from 7.1 and 7.2 are fine.  In fact, as a general rule the 
LKML recommends not using a 3.X compiler (they do it, but not for 
production systems as I recall).

A little googling comes up with this:

http://kltp.kldp.org/eunjea/fun/archive/0000.html

I know there are several better ones, but I don't have time to hunt them 
down right now.

Read that thread and there are several prominate hackers that say 
2.96.XX where XX > 76 work fine (some of them don't work for RH :-).

Take both Anders and my advice with a grain of salt.  We say opposite 
things, the most telling piece of advice is read the Documentation in 
the kernel tree and notice it claims the RH compiler should work but 
that some other random version is the preferred compiler, and 3.0.X 
isn't anywhere on that list as of Nov of last year according to the thread.

The only other question is what does sistina test there code with?  I 
would use that one.  But then again you the original poster didn't ask 
about that.  I doubt your problems involve any of this information.


	Thanks,
		Kirby

Anders Widman wrote:
> You should make sure you do NOT use GCC that comes with RH 7.2 as it is
> broken.
> 
> I am using GCC 3.03 and Kernel 2.4.18-rc1 (though I have tried most
> kernels since 2.4.10) with LVM 1.0.2 with ReiserFS ontop. This is
> working fine.
> 
> 
> //Anders
> 
> 
> 
> 
>>RH7.2 + kernel 2.4.17(or 16) + LVM 1.0.2
>>
> 
>>        Has anyone tried this combo yet? After build of LVM and the new
>>ernel( everything compiled like clock work ) the system hangs on reboot
>> only after creation of a VG and mounting an LV) ...it searches for the boot
>>devices, finds it and then hangs. I thought it could have been the new
>>kernel so I rebuilt the system ( with kernel 2.4.17 + LVM ) prior to
>>creating a VG and LV I rebooted a few times and no problem.
>>
> 
>>        I just wanted to see if anyone else has had the same problem, so I've
>>provided no details. If not, I'll just call it "operator head space" and go
>>back through the docs. If anyone is interested in details for there own
>>knowledge or the project...I will be more than happy to supply them.
>>
> 
> 
>>Thanks,
>>Chris
>>
> 
> 
> 
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@sistina.com
>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>>
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
