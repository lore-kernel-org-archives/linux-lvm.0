From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Defect in vgchange
Message-ID: <20030523123119.B24103@sistina.com>
References: <000801c3205a$31d69dc0$ebbba5cc@patni.com>
Mime-Version: 1.0
In-Reply-To: <000801c3205a$31d69dc0$ebbba5cc@patni.com>; from sachin.gupta@patni.com on Thu, May 22, 2003 at 05:33:15PM +0530
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
Date: Fri May 23 05:40:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Sachin,

have you tried to reproduce with LVM 1.0.7 already ?

LVM1 from Sistina doesn't support multi-pathing (you need to use MD
multi-pathing additionally to LVM1).

LVM2.2 later this year is planned to have it.


On Thu, May 22, 2003 at 05:33:15PM +0530, Sachin (Patni) wrote:
> hi 
> 
> I am a software engineer working in the area of Storage Area Networks . 
> 
> But whenever I give the following command
> 
> vgchange -l 128 test_vg 
> 
> test_vg being a volume group on physical volumes created on sd device partitions (type 8e) 
> 
> It results in segmentation fault.  (I am working on a multi path system ;  lvm version : lvm-1.0.3-4 )
> 
> Kindly give me the reason for this , whether this version is not suited for multi-path or this is a defect. 
>  
> 
> 
> Thanks and regards 
> 
> 
> Sachin Gupta
> 

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
