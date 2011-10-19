Date: Wed, 19 Oct 2011 10:24:13 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20111019142412.GA15290@redhat.com>
References: <6198ad06f8735602ebb56546ec3469b6.squirrel@webmail.ocsa-data.net>
	<1319033348.1827.41.camel@deela.quest-ce.net>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1319033348.1827.41.camel@deela.quest-ce.net>
Subject: Re: [linux-lvm] LVM blocks discard for remove commands
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: Yann Droneaud <yann@droneaud.fr>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Oct 19 2011 at 10:09am -0400,
Yann Droneaud <yann@droneaud.fr> wrote:

> Le mercredi 19 octobre 2011 � 12:45 +0200, Yann Droneaud a �crit :
> > Hi,
> > 
> > Does lvremove, vgremove, pvremove issue discard (eg. TRIM) commands
> > in order to release LE/PE/metadata blocks from the underlying devices (SSD) ?
> > 
> 
> It seems the discard feature was added to LVM2 since version 2.02.85
> (released on 29th April 2011), in WHATS_NEW:
> 
>   Add "devices/issue_discards" to lvm.conf.
>   Issue discards on lvremove and lvreduce etc. if enabled and supported.
> 
> But the documentation is unclear about it. In example.conf.in /
> lvm.conf.5.in:
> 
> "
> Issue discards to a logical volumes's underlying physical volume(s) when
> the logical volume is no longer using the physical volumes' space (e.g.
> lvremove, lvreduce, etc).  Discards inform the storage that a region is
> no longer in use.  Storage that supports discards advertise the protocol
> specific way discards should be issued by the kernel (TRIM, UNMAP, or
> WRITE SAME with UNMAP bit set).  Not all storage will support or benefit
> from discards but SSDs and thinly provisioned LUNs generally do.  If set
> to 1, discards will only be issued if both the storage and kernel
> provide support.
> "
> 
> 
> Does it apply for the blocks holding meta data,
> e.g. will pvremove issue discard requests for the PV meta data ?

The discards are only issued for the physical extents that were used in
a volume's data area.  PV metadata isn't discarded, and really there
would be little benefit to doing so.
