From: Andreas Dilger <adilger@turbolabs.com>
Date: Fri, 7 Sep 2001 10:59:29 -0600
Subject: Re: [linux-lvm] Re: Problem with vgscan "only found 626 of 625 LEs for LV"
Message-ID: <20010907105929.C32553@turbolinux.com>
References: <20010906123245.B28532@hp.is> <20010907103515.B32257@hp.is>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010907103515.B32257@hp.is>
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

On Sep 07, 2001  10:35 +0000, Tomas Edwardsson wrote:
> Hmm, anyone able to help with this? All my data is currently offline and
> I really need it back so if anyone could help please!
> 
> - Tommi
> 
> On Thu, Sep 06, 2001 at 12:32:45PM +0000, Tomas Edwardsson wrote:
> > Here is what vgscan shows:
> > 
> > vgscan -- reading all physical volumes (this may take a while...)
> > vgscan -- found inactive volume group "vg00"
> > vgscan -- only found 626 of 625 LEs for LV /dev/vg00/lvol1 (0)
> > vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data of volume group "vg00" from physical volume(s)
> > vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating "/etc/lvmtab" and "/etc/lvmtab.d"

It looks like the PE table does not match what is in the LV table for
that LV (i.e. the PE table has 626 PEs that claim to be part of the LV,
but the LV says it has only 625 LEs allocated).

Two possibilities: you recently added an LE to the LV and you had a crash
(or an LVM bug), or somehow you had an error writing to disk.  You can try
restoring a copy of the metadata with vgcfgrestore to see if it helps.

Failing that, check pvdata -avP <disk> to see what is wrong.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
