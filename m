From: Ewen McNeill <lvm@ewen.mcneill.gen.nz>
Subject: Re: [linux-lvm] Drive failure 
In-Reply-To: Message from "B. J. Zolp" <bjzolp@wisc.edu> 
   of "Thu, 15 May 2003 09:17:21 EST." <200305150917.21504.bjzolp@wisc.edu> 
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2608.1053031148.1@basilica.la.naos.co.nz>
Message-Id: <20030515203908.66A9CAE4F5@basilica.la.naos.co.nz>
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
Date: Thu May 15 15:39:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

In message <200305150917.21504.bjzolp@wisc.edu>, "B. J. Zolp" writes:
>On Thursday 15 May 2003 03:14, Ewen McNeill wrote:
>> - make sure you do the dd with an option to replace unreadable sectors
>>   with blank sectors (otherwise nothing will be written out for the
>>   unreadable sectors, causing everything to be "out of alignment" after
>>   the first bad block)
>
>I plan on using the noerror switch for dd, what else would I need to use to 
>make sure it replaces with blank sectors.  I could not find anything in info 
>dd or man dd.

The option I was thinking of is conv=noerror,sync

The "noerror" is "continue reading after read errors", and the "sync"
is "pad each input block with zero bytes to block size".  Possibly GNU
dd is better behaved, but my recollection is that at least some "dd"s
will happily skip over blocks they can't read given "conv=noerror" (by
assuming they just read 0 bytes that time), but result in effectively
fewer blocks written out than read in, effectively shuffling everything
after the blocks with errors down a bit.  This is, suffice to say,
a bad thing to have happen to your file system.

You might want to practice a little with copying from the disk into some
temporary location (eg outputting to /dev/null will do for this
purpose), and watch the "input blocks" and "output blocks" counts that
are reported -- if they're not the same, you're going to have a problem.

Ewen
