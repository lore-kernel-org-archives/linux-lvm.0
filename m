Date: Tue, 11 Sep 2001 11:30:54 +0000
From: Tomas Edwardsson <tommi@tommi.org>
Message-ID: <20010911113054.B16588@hp.is>
References: <20010911112241.A16588@hp.is>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010911112241.A16588@hp.is>; from tommi@tommi.org on Tue, Sep 11, 2001 at 11:22:41AM +0000
Subject: [linux-lvm] Re: Problem with vgscan "only found 626 of 625 LEs for LV"
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

I had already tried the vgcfgrestore, it didn't seem to help but I discovered
that the UUID for one of my PVs was missing so I ran the uuid-fixer and now
they all have UUIDs again (don't know if that is relevant). 

I have run the pvdata on all my PVs although I think the right one is the
following file run with pvdata -avP /dev/hdd1:
  http://vefur.hp.is/lvm/pvdata-hdd1.txt

I also documented a few more commands:

  pvdata -avP /dev/hdb2,	http://vefur.hp.is/lvm/pvdata-hdb2.txt
  pvdata -avP /dev/hdc2,	http://vefur.hp.is/lvm/pvdata-hdc2.txt
  pvscan,			http://vefur.hp.is/lvm/pvscan.txt
  vgscan,			http://vefur.hp.is/lvm/vgscan.txt

On Tue, Sep 11, 2001 at 11:22:41AM +0000, Tomas Edwardsson wrote:
> On Sep 07, 2001  10:35 +0000, Tomas Edwardsson wrote:
> > Hmm, anyone able to help with this? All my data is currently offline and
> > I really need it back so if anyone could help please!
> >
> > - Tommi
> >
> > On Thu, Sep 06, 2001 at 12:32:45PM +0000, Tomas Edwardsson wrote:
> > > Here is what vgscan shows:
> > >
> > > vgscan -- reading all physical volumes (this may take a while...)
> > > vgscan -- found inactive volume group "vg00"
> > > vgscan -- only found 626 of 625 LEs for LV /dev/vg00/lvol1 (0)
> > > vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data of volume group "vg00" from physical volume(s)
> > > vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating "/etc/lvmtab" and "/etc/lvmtab.d"
> 
> It looks like the PE table does not match what is in the LV table for
> that LV (i.e. the PE table has 626 PEs that claim to be part of the LV,
> but the LV says it has only 625 LEs allocated). Two possibilities: you recently added an LE to the LV and you had a crash
> (or an LVM bug), or somehow you had an error writing to disk.  You can try
> restoring a copy of the metadata with vgcfgrestore to see if it helps. Failing that, check pvdata -avP <disk> to see what is wrong. Cheers, Andreas
> --
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
