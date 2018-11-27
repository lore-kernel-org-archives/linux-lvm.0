References: <CAOp5WB5YdUwQ5ieQ558mgFbZ3HDDaUMikORm7TpeAARmitO9=g@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <f8f10925-effb-c73f-7d32-aee3221c79ba@redhat.com>
Date: Tue, 27 Nov 2018 10:43:08 +0100
MIME-Version: 1.0
In-Reply-To: <CAOp5WB5YdUwQ5ieQ558mgFbZ3HDDaUMikORm7TpeAARmitO9=g@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvextend operation results in suspended volume
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Andrew Hall <andyjohnhall@gmail.com>

Dne 26. 11. 18 v 19:24 Andrew Hall napsal(a):

Hi

> Can anyone confirm if the following situation is recoverable or not ?
> Thanks very much.
> 
> 1. We have an LV which was recently extended using a VG with
> sufficient PE available. A filesystem resize operation was included
> with the -r flag :


Let's question this one first...

You say 'sufficient PE available'.

What makes you think that when you forcibly resize your PV to bigger
size - those extents exists and are available ?


> 
> 4. We then see the following in the syslog confirming errors with this
> operation :
> 
> Nov 12 17:05:59 servername kernel: device-mapper: table: 253:2: sdb1
> too small for target: start=35156248576, len=37756928,
> dev_size=35156248576

Clearly you have a in your VG  PV which does NOT have the size you
made it.

> [root@servername ~]# lvchange -ay /dev/vgname/lvname
>    device-mapper: resume ioctl on (253:2) failed: Invalid argument
>    Unable to resume vgname-lvname (253:2)
> 
> [98337.345943] device-mapper: table: 253:2: sdb1 too small for target:
> start=35156248576, len=37756928, dev_size=35156248576

Nope, activation command is really not doing any magic and will not expand nor 
fix your PV.

> [root@servername ~]# pvresize /dev/sdb1
>    /dev/sdb1: cannot resize to 4291534 extents as 4296143 are allocated.
>    0 physical volume(s) resized / 1 physical volume(s) not resized

It's too late to rescue the situation this way - your PV with 'way too big 
size' is already using/allocating those virtual/non existing extents.

You cannot fix the size of your PV, until you first 'release' those extents 
from LVs which have allocated them.


> /dev/sdb1: cannot resize to 4291534 extents as 4296143 are allocated.
> 
> Any thoughts on how to potentially recover from this would be most
> greatly appreciated ! Thanks very much.

Well most likely by restoring archive metadata before you've started to fiddle 
with PV size by using --force options without really knowing what is happening.

If you don't have archive - you will need to think out, how to reduce LVs 
sizes to drop allocation of those nonexisting extents.


Regads

Zdenek
