Date: Mon, 23 Jan 2006 10:40:51 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Difference in LVM and LVM2 and their strength/weakness
Message-ID: <20060123094051.GW2801@redhat.com>
References: <E8AFFEFDBE97C94E9297963F0527A07B07AC77@pmi00exf00.us.packetmotion.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E8AFFEFDBE97C94E9297963F0527A07B07AC77@pmi00exf00.us.packetmotion.com>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Chen <achen@packetmotion.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, mauelshagen@redhat.com

On Sun, Jan 22, 2006 at 06:16:33PM -0800, Alex Chen wrote:
> Heinz, thanks for the information/
>  
> The main intention of our interest of LIME to use it for snapshots.
> I am told that it is a very quick way to make backups.  Is that true? Is there any measuring number for this?

Hi Alex,

yes, using logical volume snapshots for backups is one of their main purposes.

The creation of a snapshot happens instantly (ie. just some allocation for
snapshot internal store and some lvm metadata updates which is *fast*).

The performance of accessing logical voluems (aka origins) with snapshots
largely depends on your io patterns to the origin (ie. heavy writes to the
origin slow access to the snapshot down). See remarks below as well.


>  
> >From the recent discussion on snapshots, it seems there are still some issues, and even a kernel patch.
> Does RHEL 4 contain such patch?  Or is there a downloadable patch if we buy one?

We're working on fixes and they'll show up ASAP.

>  
> >From what I've read from the Web regarding LIME is that LVM1 is a read/only while LVM2 is read/write.

Correct.

> The read/only mode, if I understand correctly, is that the PE where the data resides is first copied to an exception table, (is this the COW table?)
> before the destination PE is changed.  Is this correct?  If so, does the copy involves actual data movement or only a manipulation of
> of the FAT table?  

The exception table holds the information about which chunks (smaller than PEs)
have been read off the origin and stored in the exception store before a write
to the origin was allowed.

That happens at the block devive level and therefore below any filesystem
or arbitrary application on top.

> The LVM2's read/write mode seems to simply mark the PE in the snapshot but the change is not copied from the changed PE to the snapshot, right?

No, any change to the origin leads to a copy *before* the change happens.
That's why lots of writes to the origin lead to lots of exceptions and slow
down access.
If a change to the snapshot is carried out, no copy from the origin is needed,
just the expcetion table is updated.

>  
> In either way, the snapshot seems to be keeping tracks of only the changes, i.e. delta.

Yes.

> Do we need to first create a full copy of the file system as the base, or we only need to keep the deltas, if we want to use snapshot for system backups?

The snapshot covers that for you. No user initated copy or anything needed,
just create a snapshot, mount (or let your arbitrary application access)
it and run your backup on it.

>  
> Sorry of all the questions, some of them may be pretty basic or ignorant.  If you feel I should get the answers from other sources, I would really apprecaite it if you can give me the pointer.

NP.

Heinz

>  
> Alex 
> 
> ________________________________
> 
> From: linux-lvm-bounces@redhat.com on behalf of Heinz Mauelshagen
> Sent: Sat 1/21/2006 09:08
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] Difference in LVM and LVM2 and their strength/weakness
> 
> 
> 
> On Fri, Jan 20, 2006 at 05:54:12PM -0800, Alex Chen wrote:
> > Greetings,
> 
> Hi.
> 
> >
> >   I am tasked to investigate the differences between LVM and LVM2.  I am
> > new to LVM so it would be greatly appreciated if someone can explain or
> > point me to the right direction for the following questions:
> >
> > 
> >
> > 1.    What does LVM2 have that is not available in LVM?
> 
> It has command line extensions beyond lvm (eg, vgs, lvs, pvs commands).
> 
> It's configurable in various regards (eg, device name filters)
> 
> The limits of 256 grand total logical volumes and ~64k extents per logical
> volume are gone.
> 
> Logical volume snapshots are asynchronous rather than synchronuous
> and gain better performance.
> 
> pvmove (online data relocation) is based on temporary, restartable mirrors
> which wasn't the case in LVM1.
> 
> 
> > Or is it a
> > only better architectured implementation of LVM?
> 
> I'ld not say 'only', but yes, it is :)
> 
> 
> > 2.    Which version of Red Hat enterprise system uses which LVM?  And
> > does the user need to do any configuration during installation?
> 
> RHEL3 comes with LVM, RHEL4 with LVM2.
> 
> > 3.    If LVM2 is definitely better than LVM, how stable is it?
> 
> It is stable with the exception of rare snapshot issues,
> we're fixing right now.
> 
> >
> > 
> >
> > Thanks.
> >
> > Alex
> >
> 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> --
> 
> Regards,
> Heinz    -- The LVM Guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Cluster and Storage Development                   56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
