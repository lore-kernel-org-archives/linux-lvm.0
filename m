Date: Sat, 17 Jun 2000 17:58:54 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@Sistina.com>
Subject: Re: [linux-lvm] vgscan fails to find vg
Message-ID: <20000617175854.A7641@hmsysv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
References: <20000613072910.A9094@bar.nowhere>
Mime-Version: 1.0
In-Reply-To: <20000613072910.A9094@bar.nowhere>; from zoo1@corecomm.net on Tue, Jun 13, 2000 at 07:29:10AM -0400
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: zoo1@corecomm.net
Cc: linux-lvm@msede.com

On Tue, Jun 13, 2000 at 07:29:10AM -0400, zoo1@corecomm.net wrote:
> On Tue, Jun 13, 2000 at 12:07:12PM +0200, Heinz J. Mauelshagen wrote:
> >On Mon, Jun 12, 2000 at 07:08:24PM -0400, zoo1@corecomm.net wrote:
> 
> >> i've got a 32KB debug output file of vgscan failing; what would be
> >> the best way of submitting it to whom?
> 
> >Send it to the list please.
> 
> okay, here it comes... the vg is on /dev/hda11 with no other pv's on the
> disk.
> 

<SNIP vgscan utput>

The output shows, that the Volume Group is exported.
Have you tried to import it again with for eg. "vgimport vg /dev/hda11"?

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
