Message-ID: <3F694264.2080704@webhackande.se>
From: Rickard Olsson <richie@webhackande.se>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvscan showing 0 free on all PV's.
References: <3F676739.13431.C25AFD2@localhost> <3F675CDB.80002@tupshin.com> <20030916143432.H27659@copilotconsulting.com>
In-Reply-To: <20030916143432.H27659@copilotconsulting.com>
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
Date: Thu Sep 18 00:29:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Tracy R Reed wrote:

> Inherently dangerous? Nonsense. It should not be inherently dangerous if
> the resize tool and LVM do their jobs properly. Resizing should be a
> perfectly safe operation when done properly.

While I agree with you on principle, there is an additional element of 
risk inherent in shrinking a filesystem - moving existing data off the 
shrinking part. Interruptions during this phase may severely damage your 
filesystem's structural integrity (and we can't just route more power to 
the structural integrity field yet).

Very early this morning, I even thought of a good, real-life example:

Imagine that the eastern seaboard of the continental US is your LV. Now, 
along comes hurricane Isabel, hell bent on reducing your VG with a PV or 
two. What do you do? You evacuate (lvreduce, pvmove and resize) the data 
to safer ground. During this evacuation, panic and chaos lurks 
underneath the surface at all times. Bits and bytes flee the still 
unseen enemy. You get traffic jams and the buses are filled with ones 
and zeroes. It's almost inevitable that an operation of this magnitude 
may leave behind some dead and wounded, but the alternative is worse and 
that's why we do it.

OK, it all sounded a lot better before I got my first cup of coffee, but 
still. :-)

A transaction-based pvmove and ditto resize_reiserfs (I don't know if it 
already is or if it turns journalling off during a resize) would solve 
this problem, but pvmove is already slow as it is... A pvmove with hooks 
into Reiser4 so it could use R4s fast transactions might however be 
ideal in this particular case. That almost brings me to my wish-list for 
LVM/EVMS/md/R4, but that's a different story.

    / Rickard Olsson,IT-Konsult/
   / Telefon: +46 70 635 01 42/
  / http://www.webhackande.se/
