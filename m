Message-Id: <199908271023.AA30684@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Revised petition WAS: LVM in stock kernel!?
Date: Fri, 27 Aug 1999 12:20:08 METDST
In-Reply-To: <19990827111358.D25840@colombina.comedia.it>; from "Luca Berra" at Aug 27, 99 11:13 am
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bluca@comedia.it
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com

> 
> I completely agree with Andreas, snapshots and volume logs
> are a feature of veritas vxfs (journaled filesystem)
> not veritas LVM. 
> On Thu, Aug 26, 1999 at 09:38:37PM -0600, Andreas Dilger wrote:
> > Shane writes:
> > > - Integration with IBM's ADSM backup allows Linux machines to be backed up
> > >   "snapshot" style by simply syncing volumes and grabbing volume data.
> > 
> > I would like to learn specifically what this is before we post this list
> > anywhere.  I don't know of any "integration" with ADSM and Linux LVM.  I
> > don't think the current LVM supports mirrored LVs, so there is no possibility
> > of a snapshot of a filesystem...
> > 
> > > - The ability to add a sort of volume log allows almost instant volume
> > >   resyncing while maintaining an active data volume.

Yep.

> > 
> > I don't think this is currently possible either with Linux LVM...

Yes, you are right as far as LVM 0.7 is concerned.

> > Let's
> > stick with what works before we go talking about features that don't
> > exist yet.

I'm working on LV snapshot support right now.

I'ld like to have it in 0.8 because it would be a block device level
feature, which can be used by each and every block device
user (FSes/DBMSes/...).

IMO this conforms to the 'better do things generic' approach.

<SNIP>

Regards,
Heinz
--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
