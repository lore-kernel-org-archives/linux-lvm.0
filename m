From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] *** ANNOUNCEMENT *** LVM 1.1-rc1 available at
    www.sistina.com
Message-Id: <20020320165850.B23233@sistina.com>
References: <20020315205256.GA743@antimony.sistina.com>
    <Pine.LNX.4.44.0203191159380.3608-100000@clapper.digitalpulp.com>
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44.0203191159380.3608-100000@clapper.digitalpulp.com>;
    from charwell@digitalpulp.com on Tue, Mar 19, 2002 at 12:07:16PM -0500
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
Date: Wed Mar 20 10:01:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Mar 19, 2002 at 12:07:16PM -0500, Chris Harwell wrote:
> 
> On Fri, 15 Mar 2002, AJ Lewis wrote:
> > LVM 1.1-rc1 release candidate supports both version 1 and 2 of the metadata.
> 
> 
> 
> thanks! this does fix the pvmove 2GB limit problem i ran into. 
> 
> just a note, it seemed as if the --test feature had changed between the
> two pvmove versions. that is, before with 1.0.3 i was able to run multiple
> pvmove --test multiple times and it continued to work.  now with 1.1rc1 i
> had to run a vgscan in order to run pvmove --test again because i got this
> error on the second invocation:
> 
> pvmove --test /dev/hda14
> pvmove -- no logical volumes on empty source physical volume "/dev/hda14"

Well, probably a dependency on the metadata backups in /etc/lvmtab*
I overlooked.
Will check...

> 
> worked just fine after that vgscan though :>
> 
> i'm not sure if i just needed to run vgscan since i was using a new 
> version of the lvm tools anyway or if that --test does actually change 
> something (like the info in /etc/lvm....?).
> 
> at any rate, lvm is great and continues to power our mp3 player
> wonderfully - thanks LVM :>

LVM welcomes you ;-)

> 
> -- 
> chris
> charwell@digitalpulp.com
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
