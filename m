Date: Mon, 24 Jul 2000 13:58:18 -0500
From: Heinz Mauelshagen <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Alternate Pathing?
Message-ID: <20000724135818.A26581@mail.sistina.com>
References: <DCBFB8E1BD8BD311A94D00A0C9CA44EA0CCD0E@storeage_nt>
Mime-Version: 1.0
In-Reply-To: <DCBFB8E1BD8BD311A94D00A0C9CA44EA0CCD0E@storeage_nt>; from SVichik@store-age.com on Mon, Jul 24, 2000 at 09:25:19PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergey Vichik <SVichik@store-age.com>
Cc: linux-lvm@msede.com

On Mon, Jul 24, 2000 at 09:25:19PM +0200, Sergey Vichik wrote:
> 
> Hi,
> 
> 
> It seems to be a litle tricky to detect via LVM which HBA has failed or
> disconnected, because the mapping to real disks occurs at lvm_map, and you
> cannot know whether this IO proccess have ended succesfully or not in
> lvm_map.
> 
> The only solutuion I see, is to pass all IO operations via write/read of LVM
> and detect failed HBA by retrying failed IO request, when eliminating every
> time one of HBAs from mapping till IO operation successfull .

That's roughly what i was thinking to do in the future.
But Martin K. Peter already mentioned that he needs to implement it anyway
and he wants to do it in the general block device layer.
This has the major advantage of beeing available for every block device
rather than only for LVM driven ones.

> Not really effective, ugly, may work.

Ugly only in terms of beeing less general.
It would work.
But the preferable place to implement it is in the request handler
which can take care of requeueing the request to the optional device (path).

Open question anyway is the administration interface.
In case of the existing non self identifying disk devices there's the
need of configuration of the alternate pathes.


> Any other idea ?


Basically Peter's.

Regards,
Heinz  --  the LVM guy
