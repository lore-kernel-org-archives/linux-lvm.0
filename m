From: Anders Widman <andewid@tnonline.net>
Message-ID: <1287210484.20020628153939@tnonline.net>
Subject: Re: [linux-lvm] Unknown command in kernel-log
In-Reply-To: <20020628114424.B24660@sistina.com>
References: <637850703.20020627182114@tnonline.net>
 <20020628114424.B24660@sistina.com>
MIME-Version: 1.0
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
Date: Fri Jun 28 08:39:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> Anders,
> those messages show, that LVM1.1 tools access a pre 1.1 driver.

> If you downgrade the tools as well, those should be gone.

It seemes as I forgot to apply the lvm kernel patch when I upgraded
the kernel. The error message is now gone. ;)

Thanks!

//Anders

> On Thu, Jun 27, 2002 at 06:21:14PM +0200, Anders Widman wrote:
>> 
>>    I am running kernel-2.4.19-rc1. I get an error in the dmesg log
>>    that looks like this:
>> 
>>    lvm -- lvm_chr_ioctl: unknown command 0x8004fe97
>>    lvm -- lvm_chr_ioctl: unknown command 0x8004fe97
>>    lvm -- lvm_chr_ioctl: unknown command 0x8004fe97
>>    lvm -- lvm_chr_ioctl: unknown command 0x8004fe97
>> 
>>    What do you think this can be? Is it dangerous?
>> 
>>    Thanks,
>>    Anders Widman
>> 
>> 
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@sistina.com
>> http://lists.sistina.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
