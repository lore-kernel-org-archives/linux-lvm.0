Date: Tue, 27 Jul 1999 11:47:37 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] RAID and LVM?
Message-ID: <19990727114737.E8908@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <Pine.LNX.4.10.9907261949360.14960-100000@hibernia.spin.ie> <Pine.LNX.3.96.990726222206.21028A-100000@chiara.csoma.elte.hu>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.3.96.990726222206.21028A-100000@chiara.csoma.elte.hu>; from Ingo Molnar on Mon, Jul 26, 1999 at 10:25:50PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Mon, Jul 26, 1999 at 10:25:50PM +0200, Ingo Molnar wrote:
> (rather flame me for it ;) The new RAID driver will likely not go into
> 2.2.11, but into 2.2.12. Anyway, the new RAID 0723 release is much more
> merging-friendly wrt. LVM.

ok, you asked for it ;)
there is still some idiosyncrasye wrt HSM and it doesn't build.
*joking*
2.2.11 or 2.2.12 does not seem to be a big problem to me.

> > or ideally for raid to be fully integrated into LVM, and create
> > RAID-5 VG's. 
> or, considering the relative complexity of the two drivers (and the
> conceptual background), to integrate LVM into the concepts of RAID :) Or
i dont understand your last sentence
> let them live side by side as now.

i believe useful integrating raid and lvm
it means a user can dcide the different raid policy
for each type of data.
eg. striping for /var/spool/junk
3 way raid1 for /very/important/stuff
raid5 for /other/data

Leaving things as now is still very useful, and i will be very 
happy to have this arrangement finalized.
we really need to fix LILO (or another boot loader, grub already
can read ext2 filesystems) to be able to understand raid and lvm.

as a side question, how does LVM autodetect works
(if it exists, that is)?

Regards
Luca

-- 
Luca Berra -- bluca@comedia.it
    Communications Media & Services S.r.l.
