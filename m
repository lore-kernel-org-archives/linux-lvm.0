From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] drive-spindown
Message-ID: <20020925112539.A29192@sistina.com>
References: <200209251011.05774.michael@frotscher.net>
Mime-Version: 1.0
In-Reply-To: <200209251011.05774.michael@frotscher.net>; from michael@frotscher.net on Wed, Sep 25, 2002 at 10:11:05AM +0200
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
Date: Wed Sep 25 04:35:46 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Michael,

that could be either some regular access to extents residing on hdb
or a drive spin down flaw in the IDE driver in case "hdparm -S" went proper.

On Wed, Sep 25, 2002 at 10:11:05AM +0200, Michael Frotscher wrote:
> Hello, all
> 
> I'd like to have the drives of my LVM-system (SuSE 8.0) to spin down 
> when the volume is not used (it's a data-volume only, the system 
> resides somewhere else). The volume consists of one partition of hda 
> and drives hdb and hdc are completely dedicated to it.
> 
> I tried to set a spindown-time in BIOS as well as hdparm -S, but 
> strangely only hdc powers down (checked that with hdparm -C). I don't 
> really expect hda to power down as the system resides on it, but hdb 
> obviously should. Does anyone have an idea why it doesn't? 
> -- 
> cheers,
> 
> Michael
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
