Date: Tue, 22 Aug 2000 01:47:24 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@Sistina.com>
Subject: [linux-lvm] Re: lv_on_disk_size
Message-ID: <20000822014724.B580@srv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
References: <20000819172739.A3218@gondor.com>
Mime-Version: 1.0
In-Reply-To: <20000819172739.A3218@gondor.com>; from list039@gondor.com on Sat, Aug 19, 2000 at 05:27:39PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jan@gondor.com
Cc: linux-lvm@msede.com

On Sat, Aug 19, 2000 at 05:27:39PM +0200, Jan Niehusmann wrote:
> In the BUGS file, one mentioned bug fix is the following:
> 
> > Please change the macro LVM_LV_DISK_OFFSET as below:
> > 
> > #define LVM_LV_DISK_OFFSET(a, b) ( (a)->lv_on_disk.base + \
> >                                    sizeof ( lv_disk_t) * b)
> > 
> 
> Without really understanding what's going on (all these lv_, pe_, ...
> prefixes are really confusing me ;-)) I wonder if the following line
> in vg_setup_for_create.c is correct:
> 
> (Line 94)
>       vg->pv[p]->lv_on_disk.size = ( max_lv + 1) * sizeof ( lv_t);
> 
> Or should it be sizeof( lv_disk_t), too?

Yes, it should.
THX for pinting this out.

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
