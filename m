Message-ID: <3F83BB32.7060308@webhackande.se>
From: Rickard Olsson <richie@webhackande.se>
MIME-Version: 1.0
Subject: Re: [linux-lvm] removing a bad HD
References: <20031004210122.S14777@crusaders.no> <3F8105B3.1040506@webhackande.se> <20031007175710.B25658@crusaders.no>
In-Reply-To: <20031007175710.B25658@crusaders.no>
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
Date: Wed Oct  8 02:24:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Trond Michelsen wrote:

> Thanks, but is it really necessary to copy the PE at all? It's broken,
> and I don't care about that 8MB of data. Isn't it possible to just
> reassign the LE that's mapped to the broken PE to a completely empty PE
> at some other disk?

It's possible that Heinz or one of the other gurus know of a way, but I 
don't. If pvmove -i can't get past the read errors... Theoretically, you 
could be able to hexedit the LVM metadata but I really don't want to 
read about that in the news afterwards, if you know what I mean.

> At the moment I'm a bit tempted to just set up a new VG, and migrate
> data from the old VG file by file, disk by disk.

If you have a spare disk to start the new VG with, that's probably a 
good idea for several reasons (fresh filesystem, fresh metadata, the 
ability to check disks offline before adding them to the VG and so on).

I did this too since my old extents were rapidly becoming too small. New 
LVs default to a max size of 2TB, when I originally created mine I 
believe they were 250GB unless specified otherwise.

    / Rickard Olsson,IT-Konsult/
   / Telefon: +46 70 635 01 42/
  / http://www.webhackande.se/
