From: d.levitin@gmx.de
MIME-Version: 1.0
References: <12313315195.20020804003345@wanadoo.nl>
Subject: Re: [linux-lvm] vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group
Message-ID: <5294.1028457719@www22.gmx.net>
Content-Type: text/plain; charset="us-ascii"
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
Date: Sun Aug  4 05:41:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

We should simply take an example: 
a VG vg00 resides on 10 PVs (sda...sdj) and has 4 LVs in it: lvol1...lvol4.
Only lvol4 resides on sdaj and sdi, and they become unavailable. For the
other LVs in the vg00 are all PVs still OK, so I should be able to use them, such
as HP-UX or Veritas Volume Manages do. Indeed I have now a situation, that
the entire vg00 ist not available!

Help! (F1! F1!  ;-))  )

Dmitri

> (Response to message from d.levitin@gmx.de, d.levitin@gmx.de on Saturday,
> August 03, 2002 2:05:30 PM)
> 
> Hello,
> 
> Couldn't that have possibly disastrous results, since files or
> directories may have their PE's mapped partly on an available disk and
> partly on one that's missing?
> 
> -- 
> 
> Regards,
> sander
> 
> Saturday, August 03, 2002, 2:05:30 PM, you wrote:
> 
> 
> > The 2 disks are for us temporarily unavailable (problem with a
> controller)
> > and I can't wait untill I can use them (so no pvmove :-(  ). Can I tell
> LVM it
> > have only with the other 8 disks to go on ?
> 
> > Dmitri
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 

-- 
GMX - Die Kommunikationsplattform im Internet.
http://www.gmx.net
