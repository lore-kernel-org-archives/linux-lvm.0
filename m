From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] How does LVM handle disk failure?
Message-ID: <20020909193716.A17590@sistina.com>
References: <20020909170214.GA6879@amnesiac.homelinux.org>
Mime-Version: 1.0
In-Reply-To: <20020909170214.GA6879@amnesiac.homelinux.org>; from jay@amnesiac.homelinux.org on Tue, Sep 10, 2002 at 03:02:14AM +1000
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
Date: Mon Sep  9 12:56:36 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Sep 10, 2002 at 03:02:14AM +1000, Jay Hap-hang Yu wrote:
> Hi all,
> 
> I know this must be a very common question and has been asked many
> times. I'm evaluating LVM and skimmed the LVM-HOWTO. AFAIK there's no
> info on what the sysadmin should do in case one of the PVs of a VG
> crashes and cannot be remounted. My questions are:
> 
> - will the failure of a single PV take down the whole VG it's in?

Yes, unless you temporarily use LVM1.1 and its PV quorum feature or
vgcfgrestore the metadata of the failed drive to some other drive
(could well be a loop device).
Both ways you can activate your VG and retrieve your still
accessable data.
LVM2 which is our new code base will have quroum support soon too.

> - does the entire VG have to be rebuilt?

No.

>   or are there methods to simply
>   replace the faulty PV with a new HDD and restore the lost data from
>   backup (assume using linear mode)

As mentioned above: use vgcfgrestore and your recent VG metadata archive in
directory /etc/lvmconf/ to restore the metadata to some replacement drive.
Don't forget to pvcreate the replacement drive before running vgcfgrestore.
Run "vgscan ; vgchange -ay" afterwards,

BTW: in case you don't want to loose your valuable data as you do in this
PV replacement case, you want to think about running RAID > 0 devices as
physical volumes either in HW-RAID or using MD.

> 
> Cheers,
> -- 
> 
> - jhy
> 
> "If you are reading this line you've too much time to waste."


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
