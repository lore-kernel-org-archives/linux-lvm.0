Date: Fri, 16 Jun 2000 14:38:13 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@Sistina.com>
Subject: Re: [linux-lvm] Problems activating VG (2.4.0-test1 / raid 0.9)]
Message-ID: <20000616143813.B2560@hmsysv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
References: <20000616002606.A9103@hmsysv.t-online.de> <200006160531.HAA26810@musashi.stan.de>
Mime-Version: 1.0
In-Reply-To: <200006160531.HAA26810@musashi.stan.de>; from stk@rmi.de on Fri, Jun 16, 2000 at 07:31:34AM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: stk@rmi.de
Cc: linux-lvm@msede.com


Hi Stefan,

please change vgchange.c line 346 to line 354 that they looks like:

            if ( ( ret = vg_check_online_all_pv ( vg, &pv_offl, &pv_incons)) < 0
                 &&  ret != -LVM_EPV_READ_MD_DEVICE) {
               if ( ret == -LVM_EPV_READ_PV_CREATE_NAME_FROM_KDEV_T) {
                     fprintf ( stderr, "%s -- ERROR: can't get name(s) of "
                                       "physical volumes\n"
                                       "%s -- Please check, if /proc "
                                       "is mounted\n",
                                       cmd, cmd);
               } else {

and test again.

Regards,
Heinz

On Fri, Jun 16, 2000@07:31:34AM +0200, stk@rmi.de wrote:
> On 16 Jun, Heinz J. Mauelshagen wrote:
> > 
> > Please provide the stdout/stderr of "vgscan -d" and "vgchange -day" to the list.
> > 
> > Regards,
> > Heinz
> > 
> > On Thu, Jun 15, 2000 at 09:23:49PM +0200, stk@rmi.de wrote:
> >> Hello everyone,
> >> 
> >> at the moment im experimenting with lvm on top of raid1 (v0.9)
> >> but ran into a problem with the pv and vg activation. That is
> 
> attached are first the output vgscan -d and after that vgchange -day
> 
> regards
> Stefan
> 
> 
<SNIP output>
-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
