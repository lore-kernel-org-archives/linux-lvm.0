From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] what happes to VG when disks are added/removed?
Message-Id: <20020311162737.A13418@sistina.com>
References: <200203110826.g2B8Q6v17961@mailgate5.cinetic.de>
MIME-Version: 1.0
In-Reply-To: <200203110826.g2B8Q6v17961@mailgate5.cinetic.de>;
    from gunther.kuhlmann@web.de on Mon, Mar 11, 2002 at 09:26:06AM +0100
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
Date: Mon Mar 11 09:30:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Mar 11, 2002 at 09:26:06AM +0100, gunther.kuhlmann@web.de wrote:
> Hello!
> 
> I had two hard disks, the first with three VG's, the second
> with one VG (vg2). When the second hard disk started to fail, I
> installed a third with VG vg4 and copied the data over. Then,
> without deleting vg2, I unplugged hd 2. After reboot, the volume
> on vg2 mounted cleanly, although the disk was not available. It
> correctly accessed the LV on vg4 on the new disk. Is that correct?
> Can I now use either of the two vg2/vg4 to access the LV on the
> new disk? How do I get rid of one (and which) without risking my
> data? Can I just vgremove vg2 away?

Gunther,

the result depends on *how* you copied vg2 over to your new hard drive.

If you used for eg. dd to do an image copy of the partitions, which contained
vg2 on the flaky drive or a whole disk copy keeping sizes, you've got duplicated
content and can unplug the flaky device.
If you ran vgscan, you saw your 'old' vg2 in the new drive, which is
perfectly fine.

BTW: your configuration is a little bit extraordinary in terms of how to use
drives as PVs. Typically you shouldn't have multiple VG's on a single drive
as you seem to have it.
Much rather you should have multiple drives in one VG.

> 
> Thanks for your help!
> 
> Gunther
> 
> 
> ________________________________________________________________
> Keine verlorenen Lotto-Quittungen, keine vergessenen Gewinne mehr! 
> Beim WEB.DE Lottoservice: http://tippen2.web.de/?x=13
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
