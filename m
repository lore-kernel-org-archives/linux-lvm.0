Date: Mon, 19 Jun 2000 10:32:35 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@Sistina.com>
Subject: Re: [linux-lvm] vgscan fails to find vg
Message-ID: <20000619103235.A1397@hmsysv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
References: <20000613072910.A9094@bar.nowhere> <20000617175854.A7641@hmsysv.t-online.de> <20000617141344.A2117@bar.nowhere>
Mime-Version: 1.0
In-Reply-To: <20000617141344.A2117@bar.nowhere>; from zoo1@corecomm.net on Sat, Jun 17, 2000 at 02:13:44PM -0400
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: zoo1@corecomm.net
Cc: linux-lvm@msede.com


Could you delete line 103 containing "continue;" in vgscan.c, recompile/install
and retry please?

Regards,
Heinz

On Sat, Jun 17, 2000 at 02:13:44PM -0400, zoo1@corecomm.net wrote:
> On Sat, Jun 17, 2000 at 05:58:54PM +0200, Heinz J. Mauelshagen wrote:
> 
> ><SNIP vgscan utput>
> >The output shows, that the Volume Group is exported.
> 
> yes; i'm sorry, this was a side effect of my working around the problem
> with vgexport / vgimport.
> 
> i shut down without exporting the vg, only deactivating it, and
> restarted again with the following commands in rc.sysinit:
> 
>     /sbin/vgscan -v -d > /root/vgscan.1 2> /root/vgscan.2
>     /sbin/vgchange -v -d -a y > /root/vgchange.1 2> /root/vgchange.2
> 
> this failed to come up, so i then had to restart again with my usual
> vgexport / import, but at least i think i've got good logfiles this
> time. since they became longish, i've tarred and gzipped them and
> attached the tarfile to this email; i hope the mailing list software
> doesn't dislike mime attachments. :-/
> 



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
