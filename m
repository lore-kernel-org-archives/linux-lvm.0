Return-Path: <miles@megapathdsl.net>
Message-ID: <3ADF5E3B.6070309@megapathdsl.net>
Date: Thu, 19 Apr 2001 14:52:59 -0700
From: Miles Lane <miles@megapathdsl.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: [repost] Announce: Linux-OpenLVM mailing list
References: <E14qKeF-0007wb-00@the-village.bc.nu>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: AJ Lewis <lewis@sistina.com>, linux-lvm@sistina.com, Jes Sorensen <jes@linuxcare.com>, linux-kernel@vger.kernel.org, linux-openlvm@nl.linux.org, Arjan van de Ven <arjanv@redhat.com>, Jens Axboe <axboe@suse.de>, Martin Kasper Petersen <mkp@linuxcare.com>, riel@conectiva.com.br

Alan Cox wrote:

>>As far as getting patches into the stock kernel, we've been sending patches
>>to Linus for over a month now, and none of them have made it in.  Maybe
>>someone has some pointers on how we get our code past his filters.
>>
> 
> Has it occured to you that some of this might be because the code does stuff
> like hide flags in the low bits of addresses and do unchecked kmallocs ?
> Things people have tried to send patches for ..
> 
> The best way to get stuff to Linus is to feed him changes one at a time and
> make them all clean and clearly correct. When I have a big set of changes I
> normally start by feeding Linus all the 'fluff' - spelling checks and small
> warning fixes. After that its normally easy to pick out changes one at a time
> and feed them on.
> 
> Given 500 lines of mixed up diff it is very hard to verify the correctness of
> anything. 


The IrDA folks have had a similar struggle.  AJ, perhaps it would be
helpful for you to read the discussion that took place regarding getting
a bunch of IrDA code merged into the 2.4 tree:

http://www.pasta.cs.uit.no/pipermail/linux-irda/2000-November/001923.html

Dag Brattli <dagb@fast.no> eventually had a discussion with Linus and
hashed out what he needed to do to get Linus to accept his big patch. 
It all
worked out very well, IIRC.

	Miles
