From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Changing PV position
Message-ID: <20031219110923.E18654@sistina.com>
References: <200312181208.49303.benoit.peccatte@enst-bretagne.fr>
Mime-Version: 1.0
In-Reply-To: <200312181208.49303.benoit.peccatte@enst-bretagne.fr>; from benoit.peccatte@enst-bretagne.fr on Thu, Dec 18, 2003 at 12:08:49PM +0100
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
Date: Fri Dec 19 04:15:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Dec 18, 2003 at 12:08:49PM +0100, Benoit wrote:
> Hello,
> 
> I'm currently using lvm on my box and one disk just died.
> Then the second disk (hdb) became the first one (hda). The problem is that now 
> I can't get back the physical volume which is on it. Is it possible to tell 
> lvm to force the reading of a PV even if it isn't on the same disk as 
> before ?

vgscan does whyt you are asking for (before trying "vgchange -ay").

> 
> Thank you for your help.
> Benoit
> 
> 
> Informations :
> 
> peck:/# fdisk -l /dev/hda
> 
> Disk /dev/hda: 122.9 GB, 122942324736 bytes
> 255 heads, 63 sectors/track, 14946 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
> 
>    Device Boot      Start         End      Blocks   Id  System
> /dev/hda1   *           1         898     7213153+   b  W95 FAT32
> /dev/hda2             899        1384     3903795   83  Linux
> /dev/hda3            1385       14946   108936765    5  Extended
> /dev/hda5            1385        1992     4883728+  fd  Linux raid autodetect
> /dev/hda6            1993       14946   104052973+  8e  Linux LVM
> 
> peck:/# pvs /dev/hda6
>   Failed to read physical volume "/dev/hda6"
> 
> 
> I'm currently using linux 2.6-test9, with lvm2 tools. 
> The missing volume was created with lvm1 tools.
> 
> 
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
