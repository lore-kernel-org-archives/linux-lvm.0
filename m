From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] writable snapshots ? (a la timefinder BCV)
Message-ID: <20020522104026.B9107@sistina.com>
References: <20020519112259.A23704@newt.stes.be>
Mime-Version: 1.0
In-Reply-To: <20020519112259.A23704@newt.stes.be>; from stes@pandora.be on Sun, May 19, 2002 at 11:22:59AM +0200
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
Date: Wed May 22 03:44:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, May 19, 2002 at 11:22:59AM +0200, David Stes wrote:
> 
> Hello,
> 
> There is an option --snap to the lvcreate utility to create a read-only snapshot(frozen image) of a volume.
> 
> Is there a possibility to quickly create a rw (read/write) snapshot of a logical volume ?

Beside other enhancements this is in 1.1-rcX which you can find
in CVS at www.sistina.com.

*** This is still in stabilization! Don't use it on production systems! ***

> 
> I'm thinking here of applications in the style of EMC Timefinder BCV's (bcv = business continuance volumes).
> 
> For example, I want to create a snapshot of a mounted volume running Informix.
> 
> The snapshot of the mounted logical volume will be inconsistent, but it appears then to contain a 'crashed' instance of Informix, and when mounting the snapshot, I'd like to replay logfiles (do a recovery on the crashed instance) for which I need read/write access to the snapshot ...

You can do this and other things (for eg.: full fsck on the writable snapshot
to check a filesystems integrity).

> 
> Thank you,
> David Stes.
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
