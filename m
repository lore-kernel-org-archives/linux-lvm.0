Return-Path: <Fabian.Herschel@suse.de>
Message-ID: <3AE6F9A7.55D45D84@suse.de>
Date: Wed, 25 Apr 2001 18:21:59 +0200
From: Fabian.Herschel@suse.de
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgscan does not found my VG, but pvscan does...
References: <200104251553.f3PFr1j7031199@webber.adilger.int>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

Andreas Dilger wrote:
> 
> Fabian Herschel writes:
> > I tried some things last night...
> >   - First I have saved the heder blocks (VGDA) with dd (dd if=/dev/sda1   \
> >      of=/root/HEAD_sda1 count=4596 bs=512)
> >   - Then I called a vgcfgrestore -n sysvg /dev/sda1.
> >   - Now pvscan tells me both PVs are in the VG sysvg.
> >   - "vgchange -ay sysvg" activated the VG and the LVs could me mounted
> >
> > BUT
> >   - vgscan does NOT find the sysvg!!!
> >   - After a reboot the sysvg is not available.
> >   - Every time I have to call a vgcfgrestore :((
> 
> Can you post "pvdata -PPU <dev>" for each PV in the VG?  Also, can you
> look through "vgscan -v -d" output to see why it is not finding all of
> the PVs it wants?  This sounds like the old UUID problem.

Yes I will post that. I have to collect this data at home :)).
I also will have a look up, if the tips about the UUID problem fit to
my problem /reading the several pvdata cmd outs.

Thanks,
Fabian

> 
> Cheers, Andreas
> --
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 
Fabian Herschel                                 SuSE Linux Solutions AG
Tel:    +49-6196-50951-23                       Mergenthalerallee 45-47
Fax:    +49-6196-409-607                        D-65760 Eschborn
mailto: Fabian.Herschel@suse.de                 http://www.suse.de
