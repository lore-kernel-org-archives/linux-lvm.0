Return-Path: <torsten@pclab.ifg.uni-kiel.de>
From: Torsten Landschoff <torsten@pclab.ifg.uni-kiel.de>
Date: Mon, 7 May 2001 14:02:56 +0200
Subject: Re: [linux-lvm] Removing a disk from the system
Message-ID: <20010507140256.B1469@pclab.ifg.uni-kiel.de>
References: <20010430160732.I19810@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010430160732.I19810@sistina.com>; from Mauelshagen@sistina.com on Mon, Apr 30, 2001 at 04:07:32PM +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Apr 30, 2001 at 04:07:32PM +0000, Heinz J. Mauelshagen wrote:
> > Seems like I should have used vgexport/import in the first time.
> 
> Actually not.
> vgscan *should* have cut it.

Thanks, so I did not do anything wrong. Of course given that the data is
still there it seems I was at least careful enough ;)

> It would be rather helpful, if you could provide the VGDA of the problematic
> configuration and the vgscan output with option "-d" in order to investigate
> searching for any bugs better.
> 
> In case you are able to reproduce the situation, where vgscan just finds
> one but not both of the VGs, please send that data to me.

Of course that system is again running production and I guess to reproduce
the problem I had to switch disks once again. I guess the real problem
was that /dev/hdb1 became /dev/hda1 after removing the old disk. 

I'll try to reproduce the problem at my home machine but I can't promise 
anything.

Greetings

	Torsten
