From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Interesting LVM Error...
Message-ID: <20030321122434.A15467@sistina.com>
References: <200303202212.h2KMCVIm023600@disgustapated.emc.usi.net>
Mime-Version: 1.0
In-Reply-To: <200303202212.h2KMCVIm023600@disgustapated.emc.usi.net>; from travis@usi.net on Thu, Mar 20, 2003 at 05:12:31PM -0500
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
Date: Fri Mar 21 05:27:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Travis,

looks like you've got corrupted metadata.

Did you run "vgck" to make sure sure that the metadata of "bcvorabackupdg"
really is intact ?


On Thu, Mar 20, 2003 at 05:12:31PM -0500, travis@usi.net wrote:
> Hello,
> 
> 	I am working with EMC drives (Both M1/M2s and BCVs) and encountered
> the following problem with vgexport.  When I try to export a volume group
> which consists of BCVs, I receive the following error:
> 
> [root@sanbox06 root]# vgexport -v bcvorabackupdg
> vgexport -- locking logical volume manager
> vgexport -- checking volume group name
> vgexport -- checking volume group activity
> vgexport -- reading data of volume group "bcvorabackupdg" from disk(s)
> vgexport -- ERROR "lv_read_all_lv(): number of LV" reading data of volume group "bcvorabackupdg"
> 
> vgexport -- unlocking logical volume manager
> 
> 
> Now, the creation of both the BCV volume group and the mirrored EMC volume group
> was identical.  When exporting the BCV volume group I have no issues at all and
> everything runs as exptected.  I have run vgexport on three mirrored groups with
> no issues, but each time I use a BCV group, the same error appears.  Thanks in 
> advance for any feedback!
> 
> Cheers,
> Travis B.
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
