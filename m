Message-ID: <3FDE4126.4050508@tupshin.com>
From: Tupshin Harper <tupshin@tupshin.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM and devfs
References: <20031215194252.GA30671@percy.comedia.it> <20031215195720.84933.qmail@web13505.mail.yahoo.com> <20031215224841.GA7977@percy.comedia.it>
In-Reply-To: <20031215224841.GA7977@percy.comedia.it>
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
Date: Mon Dec 15 17:19:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Luca Berra wrote:

> On Mon, Dec 15, 2003 at 11:57:20AM -0800, Stuart Felenstein wrote:
>
>>   I  think  you may be off here.  It was RedHat9 that gave me the option
>>   of using LVM.
>
>
> i said _devfs_ is not supported,
> _lvm_ is.
>
>>   I've  gone  to  the  2.4.23 kernel with devfs and lvm support.  I know
>>   there  is alot or a good amount of controvery around devfs but I think
>>   I'll ride it out and see how it works for me.
>>
> lvm1 tools do have a problem with switching from devfs to non-devfs,
> and vice-versa since they use /proc/partitions to find pvs, and do write
> the pv name in the metadata. (read the list archives for the gory
> details)
>
> L.
>
>
I have looked for this info, and haven't foud a conclusive answer. Is 
there a recipe (no matter how convoluted) for migrating from a devfs+lvm 
system to a non-devfs lvm system?

-Tupshin
