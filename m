From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] How to grow a PV?
Message-ID: <20030612121012.C26918@sistina.com>
References: <3EE83C19.10805@maintech.de>
Mime-Version: 1.0
In-Reply-To: <3EE83C19.10805@maintech.de>; from thomas.kleffel@maintech.de on Thu, Jun 12, 2003 at 10:38:49AM +0200
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
Date: Thu Jun 12 05:23:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jun 12, 2003 at 10:38:49AM +0200, Thomas Kleffel wrote:
> Hi!
> 
> I am running LVM1 ontop of  software-RAID (md). I just added a disk to 
> my raid, so my /dev/md0 is about 120G bigger now.

Sounds like you added a new disk to the end of a linear MD ?

You could have pvcreate'd it directly to add it to a Volume Group
(not adding it to the MD at all).

> 
> Now my question is: How can I tell LVM to include these additional space 
> into the PV that's already there (on /dev/md0)?

LVM2 supports PV resizing.

> 
> I  know it has to be possible because I did it several times (my raid 
> has 9 disks now - it hat 4 disks, some time ago) - I just can't rememer :(((
> Could someone please give me a hint?
> 
> Thanks in advance,
> 
> Thomas Kleffel
> 
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
