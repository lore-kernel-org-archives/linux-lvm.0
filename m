From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pvcreate & pvscan error on MD device
Message-ID: <20020919120146.B32578@sistina.com>
References: <20020919033059.36563.qmail@web10409.mail.yahoo.com>
Mime-Version: 1.0
In-Reply-To: <20020919033059.36563.qmail@web10409.mail.yahoo.com>; from mooasun@yahoo.com on Wed, Sep 18, 2002 at 08:30:59PM -0700
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
Date: Thu Sep 19 05:04:13 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Which LVM version are you using?
Maybe an older one is causing you trouble.

Regards,
Heinz    -- The LVM Guy --


On Wed, Sep 18, 2002 at 08:30:59PM -0700, BOIK MOON wrote:
> Hello, I do not have any error on PVCREATE, but
> I do not have more than one MD device registred on my PVSCAN.
> However, it is OK for the regular devices. Please help me, any clues?
> 
> The following are console message:
> 
> root# cat /proc/mdstat
> Personalities : [linear] [raid0] [raid1] [raid5]
> read_ahead 1024 sectors
> md1 : active raid1 hdd4[1] hdb4[0]
>       2048192 blocks [2/2] [UU]
> 
> md0 : active raid1 hdc4[1] hda4[0]
>       2048192 blocks [2/2] [UU]
> 
> unused devices: <none>
> root# pvcreate /dev/md1
> pvcreate -- physical volume "/dev/md1" successfully created
> 
> root# pvcreate /dev/md0
> pvcreate -- physical volume "/dev/md0" successfully created
> 
> root# pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/md0"  is in no VG  [1.95 GB]
> pvscan -- inactive PV "/dev/hdg4" is in no VG  [1000.12 MB]
> pvscan -- inactive PV "/dev/hdh4" is in no VG  [1000.12 MB]
> pvscan -- total: 3 [3.91 GB] / in use: 0 [0] / in no VG: 3 [3.91 GB]
> 
> root# pvdisplay /dev/md1
> pvdisplay -- ERROR "pv_read(): pv_create_name_from_kdev_t" no VALID physical
> volume "/dev/md1"
> 
> 
> root# pvdisplay /dev/md0
> pvdisplay -- "/dev/md0" is a new physical volume of 1.95 GB
> 
> root# pvdata /dev/md1
> --- NEW Physical volume ---
> PV Name               /dev/md1
> VG Name
> PV Size               1.95 GB
> PV#                   0
> PV Status             NOT available
> Allocatable           NO
> Cur LV                0
> PE Size (KByte)       0
> Total PE              0
> Free PE               0
> Allocated PE          0
> PV UUID               Ke5PpL-bWgO-GTkR-E6Wt-QOzz-pRhy-cJQcPW
> 
> 
> 
> 
> ---------------------------------
> Do you Yahoo!?
> New DSL Internet Access from SBC & Yahoo!

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
