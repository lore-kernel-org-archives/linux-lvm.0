Return-Path: <joe@66bassett.freeserve.co.uk>
Date: Sat, 17 Feb 2001 15:48:56 +0000
From: Joe Thornber <joe@66bassett.freeserve.co.uk>
Subject: Re: [linux-lvm] Newbie question: ERROR "pv_move_pe(): PE lock" pv_move_pe
Message-ID: <20010217154855.B337@66bassett.freeserve.co.uk>
References: <20010217111625.B32060@colombina.comedia.it> <E14U4vX-0006ka-00@whittlesey.cl.cam.ac.uk>
Mime-Version: 1.0
In-Reply-To: <E14U4vX-0006ka-00@whittlesey.cl.cam.ac.uk>; from Piete.Brooks@cl.cam.ac.uk on Sat, Feb 17, 2001 at 10:49:19AM +0000
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

On Sat, Feb 17, 2001 at 10:49:19AM +0000, Piete Brooks wrote:
> >> # pvmove /dev/hda9 
> >> pvmove -- moving physical extents in inactive volume group "vg01"
> >> pvmove -- WARNING: moving of active logical volumes may cause data loss!
> >> pvmove -- do you want to continue? [y/n] y
> >> pvmove -- ERROR "pv_move_pe(): PE lock" pv_move_pe
> >> 
> >> pvmove -- ERROR "pv_move_pe(): PE lock" moving physical extents 
> > i believe the vg should be active....
> 
> Sigh -- it warns that data loss can occur if they are active, so I assumed 
> that they should be inactive.  If it has to be active, why does it quietly say 
> `extents in inactive volume' and not warn that they should be active ?

I think the warning is just telling you that if you loose power whilst
the move is in progress bad things could happen.  Heinz can you
clarify please.

- Joe
