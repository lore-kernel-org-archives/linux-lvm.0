Message-ID: <3E6BEB8B.4040802@exavio.com.cn>
From: Peter Yao <peter@exavio.com.cn>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm and md
References: <3E6803F3.5060507@exavio.com.cn> <3E68BDA5.175E6C6C@silicide.dk>
In-Reply-To: <3E68BDA5.175E6C6C@silicide.dk>
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
Date: Sun Mar  9 19:35:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Jon Bendtsen wrote:
> Peter Yao wrote:
> 
>>Should we build lvm volumns on top of soft raid(md) or build md on top
>>of lvm volumns?
>>I prefer to build md on top of lvm volumns because lvm can hide the
>>hardware details from md. Just want to know how do you think about this.
>>Or any URLs? Thanks.
> 
> 
> why would you need to hide the hardware details from md ?
I am using some hot-plugging disks and their device number may change 
after reboot. For example, if i build md with /dev/sda and /dev/sdb, 
after reboot md may cannot start because the two disks' device name 
change to /dev/sdc and /dev/sdd. If i build md on top of lvm this 
problem is avoided. Can you give me some advice for this issue?

> The way i do it is to md 2 disks together into a pair, and
> then pvcreate it and add it to my VG. That way i can get 
> more and more disks into the system. I have thought about
> creating 2 VG's, and then run md ontop of that, but it's more
> work, as you would have to resize 2 LV's, and besides, a harddisk
> failure might trash one of your VG's. Meaning more repair work.
> 
> 
> 
> JonB
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> 


-- 
Peter Yao
