From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Can't find LVM partition
Message-ID: <20020618123158.B26268@sistina.com>
References: <C394073E4521D411ABF10006293838D604CA574F@cmh0401mai01.amr.stercomm.com>
Mime-Version: 1.0
In-Reply-To: <C394073E4521D411ABF10006293838D604CA574F@cmh0401mai01.amr.stercomm.com>; from Darryl_Stauffer@stercomm.com on Thu, Jun 13, 2002 at 11:36:38AM -0400
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
Date: Tue Jun 18 05:38:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Darryl,

as Patrick said, vgscan should find your LVM partition fine unless it got
written over.

In case just the LVM metadata at the beginning of that partition (~ < 1MB)
got overwritten during install, backups of /etc/lvmconf/* and vgcfgrestore(8)
are your friends as Sander metioned. If more is gone you probably wont't get
back a whole lot of useful data.

Any progress so far?


On Thu, Jun 13, 2002@11:36:38AM -0400, Stauffer, Darryl wrote:
> Hello,
> 
> I just got done upgrading from Redhat 7.2 to Redhat 7.3.  My home directory
> was setup on its own partition using LVM and reiserFS.  The upgrade was done
> by formatting the original root partition and reinstalling OS which means
> that all the LVM info is gone.  Is there any way to recover my LVM
> partition?
> 
> Thanks,
> Darryl
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
