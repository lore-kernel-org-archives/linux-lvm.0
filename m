Date: Fri, 27 Aug 1999 11:13:58 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Revised petition WAS: LVM in stock kernel!?
Message-ID: <19990827111358.D25840@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <199908270338.VAA23939@webber.adilger.net>
Mime-Version: 1.0
In-Reply-To: <199908270338.VAA23939@webber.adilger.net>; from Andreas Dilger on Thu, Aug 26, 1999 at 09:38:37PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM mailing list <linux-lvm@msede.com>

I completely agree with Andreas, snapshots and volume logs
are a feature of veritas vxfs (journaled filesystem)
not veritas LVM. 
On Thu, Aug 26, 1999 at 09:38:37PM -0600, Andreas Dilger wrote:
> Shane writes:
> > - Integration with IBM's ADSM backup allows Linux machines to be backed up
> >   "snapshot" style by simply syncing volumes and grabbing volume data.
> 
> I would like to learn specifically what this is before we post this list
> anywhere.  I don't know of any "integration" with ADSM and Linux LVM.  I
> don't think the current LVM supports mirrored LVs, so there is no possibility
> of a snapshot of a filesystem...
> 
> > - The ability to add a sort of volume log allows almost instant volume
> >   resyncing while maintaining an active data volume.
> 
> I don't think this is currently possible either with Linux LVM...  Let's
> stick with what works before we go talking about features that don't
> exist yet.
> 
> You can add me as a strong supporter of LVM for Linux.  I think any OS
> that doesn't have LVM these days is a pain in the a**.
> 
> Cheers, Andreas
> -- 
> Andreas Dilger  University of Calgary \ "If a man ate a pound of pasta and
>                 Micronet Research Group \ a pound of antipasto, would they
> Dept of Electrical & Computer Engineering \  cancel out, leaving him still
> http://www-mddsp.enel.ucalgary.ca/People/adilger/      hungry?" -- Dogbert
> 

-- 
Luca Berra -- bluca@comedia.it
    Communications Media & Services S.r.l.
