Return-Path: <mauelshagen@sistina.com>
Date: Thu, 28 Jun 2001 11:44:30 -0500
From: Heinz Mauelshagen <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pb with activating VG after rebooting
Message-ID: <20010628114430.B26111@sistina.com>
References: <3B3B3AB9.C4A492D6@atix.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B3B3AB9.C4A492D6@atix.de>; from julien@atix.de on Thu, Jun 28, 2001 at 04:10:01PM +0200
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

Julien,

you didn't mention the LVM version you are using.

I assume, you are going with LVM 0.9.1 Beta 7 which can cause that problem.
We are working on a fix right now (likely available in a couple of days :-()

What you could do in the meantime as a try to help you:
- dd the first megabyte of every PV to a save place (in order to recover)
- restore a backup metadata file with vgcfgrestore(8) which doesn't include
  the change for the added PV
- vgscan;vgchange -ay

Sorry for the incenvenience.

Regards,
Heinz    -- The LVM Guy --
 

On Thu, Jun 28, 2001 at 04:10:01PM +0200, Julien Baboud wrote:
> in the world of bugs&errors:
> i've obtained the following msg at kernel booting and with the vgscan
> command :
> 
> %vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "vg1"
> vgscan -- found inactive volume group "vg2"
> vgscan -- found inactive volume group "vg3"
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> groups
> 
> and when i try to activate the inactive VGs, i get this :
> 
> %vgchange -a y vg2
> vgchange -- ERROR "parameter error" setting up snapshot copy on write
> exception table for "/dev/vg2/lv2_1_snap"
> 
> %vgchange -a y vg3
> vgchange -- ERROR "parameter error" setting up snapshot copy on write
> exception table for "/dev/vg3/lv3_1_snap"
> 
> what is the matter since the same operations have been doing on the 3 VG
> (except that the 3rd VG was extended...) ?
> and how to repare this ?
> 
>  julien4atix
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
