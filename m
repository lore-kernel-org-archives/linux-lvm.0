Date: Thu, 7 Sep 2000 16:09:55 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] LVM and I2O (fwd)
Message-ID: <20000907160955.A21633@srv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
References: <39B68DB7.313C9669@marxmeier.com>
Mime-Version: 1.0
In-Reply-To: <39B68DB7.313C9669@marxmeier.com>; from mike@msede.com on Wed, Sep 06, 2000 at 08:32:23PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: j.strohbehn@artstor.de
Cc: linux-lvm@msede.com


Please look at tools/lib/lvm_dir_cache.c and extend the devdir array,
tools/lib/lvm_check_dev + tools/lib/lvm_partition_count and extend the
valid_majors array.

On Wed, Sep 06, 2000 at 08:32:23PM +0200, Michael Marxmeier wrote:
> Forwarded message from Jan Strohbehn ...
> 
> -------- Original Message --------
> Subject: Posting to the LVM Mailing List
> Date: Thu, 07 Sep 2000 01:17:17 +0200
> From: Jan Strohbehn <j.strohbehn@artstor.de>
> Organization: ArtStor AG
> 
> Hello, 
> 
> I'm trying to get the newest lvm working on I2O-devices, but it seems
> that the LVM-tools aren't able to recognize them. Has anyone a hint
> are
> an idea why this problem appears ???
> Are there any workarounds ???
> 
> 
> Thank you very much,
> Jan Strohbehn
> 
> 
> 
> 
> 
> ------------------------------------------------------------------
> Today's Fortune:
> 
> God rest ye CS students now,
> Let nothing you dismay.
> The VAX is down and won't be up,
> Until the first of May.
> The program that was due this morn,
> Won't be postponed, they say.
> 
> 	Oh, tidings of comfort and joy,
> 	Comfort and joy,
> 	Oh, tidings of comfort and joy.
> 
> The bearings on the drum are gone,
> The disk is wobbling, too.
> We've found a bug in Lisp, and Algol
> Can't tell false from true.
> And now we find that we can't get
> At Berkeley's 4.2.
> 
> 	(chorus)

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
