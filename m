From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] questions
Message-ID: <20011108091932.A12401@sistina.com>
References: <20011106000923.B3409@bunuel.tii.matav.hu> <20011108021452.B5485@tiger.bigcats.invalid>
Mime-Version: 1.0
In-Reply-To: <20011108021452.B5485@tiger.bigcats.invalid>; from weissel@netcologne.de on Thu, Nov 08, 2001 at 02:14:52AM +0100
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
Date: Thu Nov  8 02:23:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Nov 08, 2001 at 02:14:52AM +0100, Wolfgang Weisselberg wrote:
> Hi, Magosanyi!
> 
> Magosanyi Arpad (mag@bunuel.tii.matav.hu) wrote 14 lines:
> 
> > What would you check on disk related to snapshots? 
> 
> There shall be no snapshot of a snapshot.  (Yes, I have that
> right here on my disk.  Can't remove the snapshot-of-snapshot
> (segfault), can't remove the snapshot (under snapshot)).

Wolfgang,

with which LVM version do you have trouble removing snapshots?
Which compiler did you use to compile LVM? With or without optimization?

> 
> Does the snapshot point to the correct device?  (Happened to
> me, too.  Usually after an (unrelated?) crash.  No idea how
> to check -- but all Devices Under Snapshot shall have at
> least 1 snapshot.)

Do you mean, that a snapshot didn't refer to the correct device after
a crash any longer?

> 
> Does the persistent snapshot-map look like it could work on
> that device claims to be against? (bigger than the device
> in question?)

?

> 
> Ability to turn persistent snapshots into non-persistent ones
> (cleaned up after reboot) -- so that rogue ones can be
> removed during a reboot.

Well, this wouldn't make a difference because just the copy on write
exception tables would be removed but the rest of the snapshots metadata
where still in place making it most likely still impossible to remove it
in case we have a real bug related here.

> 
> -Wolfgang
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
