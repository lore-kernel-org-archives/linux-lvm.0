Message-ID: <4D9B853C.9040506@redhat.com>
Date: Tue, 05 Apr 2011 23:10:20 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <20110329124814.7fd059c7@bettercgi.com>	<784dab.9d29.12f01ad2e6f.Coremail.ooolinux@163.com>	<5fe2faea.20827.12f07068fe6.Coremail.ooolinux@163.com>	<20110330132837.07e8d0ea@bettercgi.com>	<alpine.LRH.2.00.1103302019060.412@bmsred.bmsi.com>	<4D947048.8060006@redhat.com>
	<20110405112527.367a0bff@bettercgi.com>
In-Reply-To: <20110405112527.367a0bff@bettercgi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] copy lv from lv?
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
To: Ray Morris <support@bettercgi.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 5.4.2011 18:25, Ray Morris napsal(a):
>> Isn't this already done in a better way by 'dd' using 'zero' copy
>> mechanism ?? (assuming it is already using either  'mmap()' ->
>> 'write()' or 'splice()'  as your proposed piped copy is doing a lot
>> of pointless memory copies and cache trashing.
> 
> No, with directio there isn't "a lot of pointless memory copies 
> and cache trashing". There are in fact fewer mempoy copies than 
> there would be with a simple:
> dd if=thing of=thing
> 
> See:
> http://www.ukuug.org/events/linux2001/papers/html/AArcangeli-o_direct.html
> 

Seem like 10 years old paper for 2.4.6 kernel - so I do not think it still
applies to upstream 2.6.38 - thought I've not made any recent measuring myself.

> The proof of the pudding is in the eating, and in fact that 
> recipe is extremely fast, for this application (sequential 
> copy of GBs from one device to another). I spent a couple 
> of hours testing before spending hundreds of hours copying.
> My bottom line was speed, so I didn't even look at memory
> usage or CPU.  I would't mind using an extra 64 MB in order
> to get my copying done 30 hours faster.

The kernel should be able to use as much free memory as you have - and
when it's properly configured - disk flushing running in separate thread
should ensure maximal throughput.

If you are experiencing significant performance degradation with usage of
single  'dd'  with two different driver compared with 2 piped 'dd' - you
should probably make a report on lkml list - There is something broken if you
gain 'hours' like you said by piping 2 dd commands.

(I don't have fast enough arrays myself for such playing)

Zdenek
