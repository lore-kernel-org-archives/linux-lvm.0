Return-Path: <root@srv.sistina.com>
Date: Tue, 13 Feb 2001 10:51:24 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lv nodes in /dev ??
Message-ID: <20010213105124.C32479@srv.sistina.com>
References: <20010212114306.8793.qmail@web10901.mail.yahoo.com> <200102121955.f1CJt0208596@webber.adilger.net>
Mime-Version: 1.0
In-Reply-To: <200102121955.f1CJt0208596@webber.adilger.net>; from adilger@turbolinux.com on Mon, Feb 12, 2001 at 12:55:00PM -0700
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

On Mon, Feb 12, 2001 at 12:55:00PM -0700, Andreas Dilger wrote:
> James (Mr. Penguin) writes:
> > Just noticed that all my LVs have nodes not only in
> > /dev/vg00/ but also /dev !
> > 
> > So I have /dev/vg00/lvol1 and also /dev/lvol1 with the
> > same major and minor numbers. I don't like to think
> > what will happen if I create a new VG called vg01 also
> > with an lvol1...
> > 
> > This seems to be occuring in beta3 and beta4. I'm
> > using 2.4.1 / reiserfs (root on LVM)
> > 
> > Forgot to mention - I am using devfs
> 
> Yes, this is a bug.  I fixed it in my local patches, which I will submit
> to the list today.

It has already been fixed by Patrick Caulfield.

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
