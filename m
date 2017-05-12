References: <d8bf4829-6136-4f44-68b1-661b3b6f98cb@lasko.pl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <aba0c545-6db4-62ad-34b2-d7768f1017ce@redhat.com>
Date: Fri, 12 May 2017 13:34:56 +0200
MIME-Version: 1.0
In-Reply-To: <d8bf4829-6136-4f44-68b1-661b3b6f98cb@lasko.pl>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Sector size is assumed 512
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Tomasz Lasko <tomasz@lasko.pl>

Dne 11.5.2017 v 12:39 Tomasz Lasko napsal(a):
> Hi,
> 
> I'm not a part of the list or the project, just a random guy dropping by to 
> say I found one suspicious thing:
> 
> after looking for what 's' size stands for, I found that your lvmcmdline.c 
> source code 
> <https://github.com/Jajcus/lvm2/blob/master/tools/lvmcmdline.c#L320> probably 
> assumes that sector size is 512, but there are various sector sizes out in 
> world (both for the hardware sector size and logical disk interfaces like 
> SCSI) especially more and more popular 4096 byte sector size.
> 
> I wonder if apart of lvmcmdline.c above, also other parts of your software 
> assume that sector size will always be 512. If yes, then I suggest rethinking 
> if 4k sectors might break some operations in LVM.
> 
> By the way, I understand that when specifying command line parameter sector 
> size, then it is the same for small 's' as capital 'S', right?  And the same 
> goes for bytes ('b' is the same as 'B'), right?
> 

Hi

Sector size is 'fixed'  for  dm devices for 512b.

If you work with 4K sector disks you need to use/specify size multiplied by 8.

It would get really messy if you would have multiple different PVs in a VG 
with  different sector size and you would want to print i.e. size of LV in 
sectors.

So nope - we can't change this fixed 'base' value.

Normally users do work size in  MiB or GiB eventually TiB.

lvm2 never advises users to go to sector level precision for numerous reason.

If you care about single sector - lvm2 is likely not a tool to be considered 
for usage.


Also note - default alignment is 4MiB - so unless you would override this 
extent-size below 4K, you can't actually hit issues with wrong alignment
(and likely >99% users never change this setting)

And BTW it's explicitly mentioned that 'sector is 512b' it has not attachment 
to physical device sector size...

Regards


Zdenek
