From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] shrink lvm without harddisk ?
Message-ID: <20011022094230.A5688@sistina.com>
References: <55159047260.20011020155124@gmx.de> <20011021155622.A9367@btconnect.com> <12725665012.20011021174357@gmx.de> <E15vLep-00079E-00@hermes.sistina.com>
Mime-Version: 1.0
In-Reply-To: <E15vLep-00079E-00@hermes.sistina.com>; from fejf@gmx.de on Sun, Oct 21, 2001 at 06:42:48PM +0200
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
Date: Mon Oct 22 02:44:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Oct 21, 2001 at 06:42:48PM +0200, FEJF wrote:
> hi,
> i've got a harddisk that crashed... (again :( ) - and so i can't even xs the 
> lvm anymore... i want to ask if there's a way to mount the lvm with one 
> harddisk missing (of corse there will be dataloss - but i think loosing only 
> 40gigs is better than loosing the whole lvm...) ?

Well, this only makes sense if there is LV(s) which don't have *any* PEs
alocated on the crashed disk. If not so you'ld end up in an filesystem mess
(assuming that the LV(s) contain(s) filesystems) anyway, because fs metadata
and data will be missing.

If you still want to go for it you need a replacement drive, vgcfgrestore
the LVM metadata to it and restart LVM.
In order to avoid such problems you might consider to go for soft/hard RAID
as PV storage.

> fejf
> 
> -- 
> Backups are usefull. Most often when you don't have one ;)
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
