From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vg recovery after PV failure
Message-Id: <20020410160541.A967@sistina.com>
References: <1018291425.21592.7.camel@snifter>
MIME-Version: 1.0
In-Reply-To: <1018291425.21592.7.camel@snifter>; from
    eamonn.hamilton@saic.com on Mon, Apr 08, 2002 at 07:43:44PM +0100
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
Date: Wed Apr 10 09:05:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Eamonn,

in case "a bit odd" means a HW flaw, you need to vgcfgrestore the LVM metadata
back onto a sane device. You can even "vgcfgrestore -i" to a disk with
different size, bacause you loose the data on the old flaky disk anyway
(assuming it is completely inaccessable) :-(

If your friend had all LVs striped onto both PVs, data is lost anyway.

Hint: backups are your friends friends.


On Mon, Apr 08, 2002 at 07:43:44PM +0100, Eamonn Hamilton wrote:
> 
> 
> Hi Folks.
> 
> I'm attempting to recover a VG on a friends system after one of the PVs
> started acting a bit odd. The VG appears to say that it has no PVs
> associated with it, and a vgscan only finds the second PV on the disk. A
> pvdisplay, however, show both physical volumes have what appears to be
> the correct information and extents.
> 
> I'm basically wondering how do I get these two physical volumes
> associated again, and is there any way to determine how they were put
> topgether, i.e. were they striped? Also, is there any way to get the
> information off the non-dodgy disk ( it's ext3, btw ).
> 
> Cheers,
> 
> Eamonn
> 
>  
> 
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
