Subject: Re: [linux-lvm] Error with 2.5.50-dm-2; vanilla OK
Message-ID: <20021209144918.GA22740@reti>
References: <3DF4A591.8010109@starhub.net.sg>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3DF4A591.8010109@starhub.net.sg>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Mon Dec  9 08:49:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Dec 09, 2002 at 10:15:45PM +0800, Richard Chan wrote:
> Hi, I'm getting an error with 2.5.50-dm2 but vanilla 2.5.50 is OK.
> 
> When I try lvm vgchange -ay I get the error messages
> 
> Dec  9 21:49:54 dyndns12 kernel: device-mapper: allocating minor 0.
> Dec  9 21:49:54 dyndns12 kernel: device-mapper: device /dev/hdb7 too 
> small for target
> Dec  9 21:49:54 dyndns12 kernel: device-mapper: internal error adding 
> target to table
> Dec  9 21:49:54 dyndns12 kernel: device-mapper: destroying table
> 
> 3 of 4 LVs in the VG are OK

Weird, the patch that is causing you the problem will be:

http://people.sistina.com/~thornber/patches/2.5-stable/2.5.50/2.5.50-dm-2/00005.patch

Though it still looks sane to me.  Can you send me the lvm2 log from
this vgchange along with the size in sectors of hdb7 please ?

- Joe
