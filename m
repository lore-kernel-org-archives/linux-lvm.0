Return-Path: <root@srv.sistina.com>
Date: Mon, 28 May 2001 10:56:53 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM success story
Message-ID: <20010528105653.E26710@sistina.com>
References: <200105242255.f4OMtUN02394@dixie.dyndns.org>
Mime-Version: 1.0
In-Reply-To: <200105242255.f4OMtUN02394@dixie.dyndns.org>; from scott@dixie.dyndns.org on Thu, May 24, 2001 at 06:55:31PM -0400
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

Scott,

thanks for your nice feedback!

Kind regards,
Heinz    -- The LVM Guy --


On Thu, May 24, 2001 at 06:55:31PM -0400, scott@dixie.dyndns.org wrote:
> I know this list gets quite a few complaints and bug reports, so I figured
> a success story would be a welcome post :)  After fighting a bit with the
> BIOS and lilo, it was good to see how quickly and seamlessly LVM caught its
> breath and kept moving.  I had LVM 0.9.1b6 on 2.2.19 for quite some time
> when I decided I was sick of having to boot off of floppy due to BIOS
> incompatibilities, so I flipped the primary and secondary chains such that
> hda became hdc and hdb became hdd.  The only disk that gave -any- problem
> was the root disk, which wasn't LVM anyway so I expected problems.  As far
> as the other 3, which were LVM'd into several LV's under a single VG, I
> just had to remove the lvm files from /etc and do a vgscan.
> 
> One weirdness I did see while fighting with lilo was a few times was that
> it would see my scsi vg and detect its name but vgdisplay subsequentally
> would see 2 identical vg's, both the ide/internal disk vg.  It is entirely
> possible that it was just a weirdness with my lvm files in /etc, however,
> as a complete clean and rescan fixed it.
> 
> Great job on a much-needed volume manager for linux!
> --------------------------------------------------------------------------
> Scott Denton
> smdenton@bellsouth.net
> EFNet Handle: SteelWyng
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
