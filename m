Date: Fri, 27 Aug 1999 11:37:15 -0400 (EDT)
From: "S. Ryan Quick" <ryan@phaedo.com>
Subject: Re: [linux-lvm] Revised petition WAS: LVM in stock kernel!?
In-Reply-To: <199908270338.VAA23939@webber.adilger.net>
Message-ID: <Pine.LNX.3.96.990827113200.23961B-100000@aristotle.phaedo.com>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@enel.ucalgary.ca>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

-----BEGIN PGP SIGNED MESSAGE-----

On Thu, 26 Aug 1999, Andreas Dilger wrote:

> Shane writes:
> > - Integration with IBM's ADSM backup allows Linux machines to be backed up
> >   "snapshot" style by simply syncing volumes and grabbing volume data.
> 
> I would like to learn specifically what this is before we post this list
> anywhere.  I don't know of any "integration" with ADSM and Linux LVM.  I
> don't think the current LVM supports mirrored LVs, so there is no possibility
> of a snapshot of a filesystem...

I've been able to succesully mirror lvs using the raid0 implmentation along with LVM since I started using it.
As for the snapshot backup, in a nutshell, you simply mark a stale mirror (or break the mirror temporarily),
and set ADSM to back up the logical volume directly (works fine, and quickly)  Again, I've been using the Linux
adsm client for almost 2 years now (pays to be an insider with IBM hehehe), and once LVM came out I immediately
began testing LV backups.  True, a data restore requires a complete rebuild of the mirror, but the client will
get it.  In some situations this is not optimal (e.g. if you have a filesystem using the LV), but in the case
of raw LV access (e.g. Sybase/Oracle/DB2), it works well.

> 
> > - The ability to add a sort of volume log allows almost instant volume
> >   resyncing while maintaining an active data volume.
> 
> I don't think this is currently possible either with Linux LVM...  Let's
> stick with what works before we go talking about features that don't
> exist yet.


This is not yet, but I'm working on it ;-)

> 
> You can add me as a strong supporter of LVM for Linux.  I think any OS
> that doesn't have LVM these days is a pain in the a**.

Ditto.  Glad to see my name high up on the list.


> 
> Cheers, Andreas
> -- 
> Andreas Dilger  University of Calgary \ "If a man ate a pound of pasta and
>                 Micronet Research Group \ a pound of antipasto, would they
> Dept of Electrical & Computer Engineering \  cancel out, leaving him still
> http://www-mddsp.enel.ucalgary.ca/People/adilger/      hungry?" -- Dogbert
> 

%                                                       %%%%%%%%%%
%%           S. Ryan Quick                               %%%%%%%%%
%%%           UNIX Systems Engineer                       %%%%%%%%
%%%%           Phaedo Consulting, Inc. -- Exec VP          %%%%%%%
%%%%%                                                       %%%%%%
%%%%%%         www.phaedo.com/ryan/  ryan@phaedo.com         %%%%%
%%%%%%%       ------------ PGP FingerPrint -------------      %%%%
%%%%%%%%  CF 19 6B BA 31 8E B8 8E  20 DF 4F 2B 2E 69 81 F5     %%%
%%%%%%%%%     ------------------------------------------        %%
%%%%%%%%%%                                                       %

-----BEGIN PGP SIGNATURE-----
Version: 2.6.3a
Charset: noconv

iQCVAwUBN8awrvUYDAQiV+tNAQEl5QP/WUQ+eVnMvso5k2gX3sl1+w74W9frkJq5
Zif1KaRd49O+f3WSh/rBLX4wUdK0fk7p5Z4lSjFj45HdrgHPRFqTdhksCAQ+eV2O
s02/XcfzWgyM3gnckR8JNvFV9lsNQ+ZZOK0bv6e+crpT+aZaufZRa5caiQXAzEVp
rArNfC62Ceg=
=wK8R
-----END PGP SIGNATURE-----
