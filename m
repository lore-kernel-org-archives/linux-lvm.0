From: Ewen McNeill <ewen@naos.co.nz>
Subject: Re: [linux-lvm] Re: LVM writes on raw disk of ATA RAID Mirror 
In-Reply-To: Message from Goetz Bock <bock@blacknet.de> 
   of "Wed, 30 Apr 2003 01:13:44 +0200." <20030430011344.N16789@zealot.blacknet.de> 
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8033.1051658631.1@basilica.la.naos.co.nz>
Message-Id: <20030429232352.DC21EAE4F5@basilica.la.naos.co.nz>
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
Date: Tue Apr 29 18:23:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

In message <20030430011344.N16789@zealot.blacknet.de>, Goetz Bock writes:
>during my last/first/only time i had to deal with ataraid, and IIRC,
>the promise IDE driver had a compile time flag where it would not touch
>initialised raid arrays.
>aktivating this flag would simply remove the offending disks from the
>list of ide disks and make it available via ataraid only.

It would be nice if it were possible to do this.  Is this perhaps the
CONFIG_PDC202XX_FORCE flag (turned off, or on)?  

The Linux kernel configure help for it isn't very enlightening.  And as
best I can tell it affects only the flags passed to some of the Promise
cards during setup.  But interestingly _not_ the PDC20271 which is on
the Promise TX2000 card I have.  (Or the PDC20268, PDC20269, PDC20275,
or PDC20277.  It does affect the PDC20270 and PDC20276 though, and most
of the older PDC chipsets (in pdc202xx_old.h).)

Ewen
