From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvscan and df result differs
Message-ID: <20021028100325.B16452@sistina.com>
References: <1035675002.11490.15.camel@sleep>
Mime-Version: 1.0
In-Reply-To: <1035675002.11490.15.camel@sleep>; from magnus@switchbeat.com on Sun, Oct 27, 2002 at 01:30:01AM +0200
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
Date: Mon Oct 28 03:07:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Oct 27, 2002 at 01:30:01AM +0200, Magnus Sandberg wrote:
> 
> I have just installed lvm on my debian testing server.
> 
> I have finally managed to create a PV on a maxtor 
> 120G disk, the 'pvcreate' command complained about 
> a partitiontable being present even if there is no 
> table there.
> --8<--
> server:~# pvcreate --version
> pvcreate: Logical Volume Manager 1.0.4
> Heinz Mauelshagen, Sistina Software  02/05/2002 (IOP 10)
> --8<--
> I managed to get around that by using a v2 lvm command.
> Is there a bug in 1.0.x's pvcreate?

Did you zero the partition table?
i.e. "dd if=/dev/zero of=/dev/YourWholeDisk count=1 bs=512"

v1 "pvcreate /dev/YourWholeDisk" should work fine then.

> 
> I have also managed to create a VG a and a LV and that
> seems to work. I have formatted the LV with ext3 and now
> the strange thing is that lvscan reports:
> --8<--
> server:~# lvscan 
> lvscan -- ACTIVE            "/dev/vg/lg" [114.49 GB]
> lvscan -- 1 logical volumes with 114.49 GB total in 1 volume group
> lvscan -- 1 active logical volumes
> --8<--
> But when using the filesystem df reports:
> --8<--
> Filesystem             Size   Used  Avail Use% Mounted on
> /dev/hde1             123GB  121GB  2.4GB  99% /store
> /dev/vg/lg            122GB  121GB      0 100% /store2
> --8<--
> 
> /dev/hde1 is also a 120G disk but with resierfs, ext3
> takeing up more size is probably normal. But the actual
> size on the lvm is 122G and as you can see I can fit 
> 121G on the disk, so why is lvscan reporting ~115G? 
> Can i safetly use my lvm setup without running the risk
> of losing data?

Can't reproduce that with df 4.1 here :(
That's probably just the old divide by 1k or 1024 thing.

What does "df -k" say and how does it compare to the lvscan output?

> 
> 
> Thanks,
> 
> /Magnus
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
