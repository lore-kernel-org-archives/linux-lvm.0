From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgchange -a y /dev/System fails
Message-Id: <20020128104258.A24830@sistina.com>
References: <20020125233533.GK26045@merlins.org>
MIME-Version: 1.0
In-Reply-To: <20020125233533.GK26045@merlins.org>; from
    marc_lvm@merlins.org on Fri, Jan 25, 2002 at 03:35:33PM -0800
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
Date: Mon Jan 28 03:47:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Marc,

I am afraid you need to figure out the last metadata backup in /etc/lvmconf/
which *doesn't* contain the flaky snapshot(s).

You didn't mention the name of you VG so let's say it was 'A'.

You can do that with "vgcfgrestore -f /etc/lvmconf/A.conf.1.old -n A -ll".
Replace the '1' in the metadata backup filename above with 2, 3 and so on
(you should have a default of up to 9).
After you found one (say #3), remember all you PVs belonging to that VG and run

pvcreate -yff /dev/AllYourPVsBelongingToA
for pv in /dev/AllYourPVsBelongingToA
do
   vgcfgrestore -f /etc/lvmconf/A.conf.3.old -n A $pv
done
vgscan
vgchange -ay A

That should be it (crossing fingers ;-)


On Fri, Jan 25, 2002 at 03:35:33PM -0800, Marc MERLIN wrote:
> It fails and says:
> parameter error setting up snapshot copy on write exception
> 
> So yes, I have  snapshots in there, but I can't delete  the snapshots if the
> volume isn't active, and I can't activate the volume because of a snapshot.
> 
> To make things worse, /dev/System contains /usr and /var.
> 
> The snapshots were created with 1.0.1rc4 on 2.4.14 and I now run 2.4.17 with
> 1.0.1rc4-ish
> 
> What's the magic override I need to use to make the volume active again?
> 
> Thanks
> Marc
> -- 
> Microsoft is to operating systems & security ....
>                                       .... what McDonalds is to gourmet cooking
>   
> Home page: http://marc.merlins.org/   |   Finger marc_f@merlins.org for PGP key
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
