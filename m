From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Changing the PE on an existing VG
Message-Id: <20020204115331.C29233@sistina.com>
References: <001201c1ac41$f5767f40$6402000a@slartibartfast>
MIME-Version: 1.0
In-Reply-To: <001201c1ac41$f5767f40$6402000a@slartibartfast>;
    from ha@dvdtrade.net on Sun, Feb 03, 2002 at 12:33:03AM +0100
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
Date: Mon Feb  4 04:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Feb 03, 2002 at 12:33:03AM +0100, Henric Andersson wrote:
> Just wondering if and when LVM will support changing the PE of an existing
> VG? I just realized that I had painted myself into a corner by not setting
> my PE bigger than 4MB :-(  (And shuffling 212 gig of data between drives &
> tapes is no happy thought)

This limit will fall with LVM2 and its new metadata format (so-called format2).
LVM1 (format1) has the restriction of ~64k logical extenents maximum per
logical volume which can't be worked around without a metadata format change.

We have released LVM2 Beta1 last week on Wednesday (which supports format1 on
disk format). That means that you are able to switch bac and force between LVM1
and LVM2 because they just use the same on-disk format!

Format2 is being implemented right now and will be in one of the next Betas.

You will be able to migrate from LVM1 format to LVM2 format2.

As long as you stay within the limits of the LVM1 format you will be
even able to migrate form format2 back to format1.

Please be aware that LVM2 BetaX is not meant to be production ready!
We hope to get there in a couple of weeks.
If you can wait that long... :-)

> 
> /Henric
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
