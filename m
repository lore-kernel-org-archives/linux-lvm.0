References: <20180726004154.xcdjyqv7tkdfpvca@merlins.org>
	<20180726072440.372sthb6accswcr4@merlins.org>
	<85e59b54-fb8f-67a9-13cc-6466f097f06a@redhat.com>
	<20180726154951.jupwdd3rzqznwcks@merlins.org>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <ff569799-46a4-402c-02fc-fb3cc87df586@redhat.com>
Date: Fri, 27 Jul 2018 14:43:21 +0200
MIME-Version: 1.0
In-Reply-To: <20180726154951.jupwdd3rzqznwcks@merlins.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Can't create thin lv
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Marc MERLIN <marc@merlins.org>

Dne 26.7.2018 v 17:49 Marc MERLIN napsal(a):
> On Thu, Jul 26, 2018 at 10:40:42AM +0200, Zdenek Kabelac wrote:
>> What are you trying to achieve with 'mkdir /dev/vgds2/' ?
>> You shall never ever touch  /dev  content - it's always under full control
>> of udev - if you start to create there your own files and directories you
>> will break whole usability of the system.
>> It's always udev having full control over all the symlinks there.
>   
> Yes, I know udev manages it, but given that things weren't working, I
> randomly tried that (and yes I have udev)
> 
>> However I can't image in which todays distribution you would want to use it..
>>
>> Anyway - the best 'debugging' you will get with  'lvcreate -vvvv'
>> it will always tell you what is failing.
> 
> Looks like my problem was that udev was too old, and there was no
> dependency for the newer package.  I upgraded from udev 232 from 239
> 
> It's looking better now:
> gargamel:~# lvcreate -L 14.50TiB -Zn -T vgds2/thinpool2
>    Using default stripesize 64.00 KiB.
>    Thin pool volume with chunk size 8.00 MiB can address at most <1.98 PiB of data.
>    semid 1376260: semop failed for cookie 0xd4d162f: incorrect semaphore state
>    Failed to set a proper state for notification semaphore identified by cookie value 223155759 (0xd4d162f) to initialize waiting for incoming notifications.
>    Logical volume "thinpool2" created.
>    semid 1441796: semop failed for cookie 0xd4dad79: incorrect semaphore state
>    Failed to set a proper state for notification semaphore identified by cookie value 223194489 (0xd4dad79) to initialize waiting for incoming notifications.


Hi

These messages are informing you that your udev system and SysV semaphores 
support do not work properly together at all.

In practice lvm2 detected semaphores are useless on your system and fallback 
to actually ignore them to not stay blocked endlessly  waiting on udev work to 
get finished.

So I'm unsure what are you trying to reach - are you building your own 
linux-from-scratch system -  I doubt that any widely usable modern distro has 
such broken SysV support built-in in their mainstream kernel.

IMHO if you are trying to build your own linux system yourself and you do not 
need udev otherwise at all - you could probably better build lvm2 without 
udev_sync support - so you will not see those ugly error messages with every 
creation command you will run.


Zdenek
