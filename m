From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] trouble of reduce pv
Message-ID: <20011029231427.A18988@sistina.com>
References: <200110250515.OAA15476@center01.shooting-star.ne.jp> <20011025014038.X23590@turbolinux.com> <20011030032905.93E1.APPENDIX@hatsune.cc>
Mime-Version: 1.0
In-Reply-To: <20011030032905.93E1.APPENDIX@hatsune.cc>; from appendix@hatsune.cc on Tue, Oct 30, 2001 at 03:45:29AM +0900
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
Date: Mon Oct 29 16:17:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

You need to restore the metadata formerly stored on md10 to a valid device
using the LVM vgcfgrestore(8) command.
Then you can run vgscan and "vgchange -ay".

On Tue, Oct 30, 2001 at 03:45:29AM +0900, YouMizuki wrote:
> I've a LVM one physical volume "vg0" that created on 10 RAID devices.
> It worked still the day.
> But one day, I have problem about vgscan reports that it can't find my VG.
> 
> My VG structure was this.
> 
> | /dev/md1,md2,md3,md4,md5,md6,md7,md8,md9,md10 => vg0
> 
> But md10 was broken.
> I need to restruct VG like this.
> 
> | /dev/md1,md2,md3,md4,md5,md6,md7,md8,md9 => vg0
> 
> But vgscan is can't find VG
> 
> |vgscan
> |vgscan -- reading all physical volumes (this may take a while...)
> |vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> |vgscan -- WARNING: This program does not do a VGDA backup of your volume group
> 
> 
> I tried uuid_fixer. but I get only error.
> 
> |uuid_fixer  /dev/md1 /dev/md2 /dev/md3 /dev/md4 /dev/md5 /dev/md6 /dev/md7 /dev/md8 /dev/md9 
> |Error: number of PVs passed in does not match number of PVs in /dev/md2's VG
> |       9 PVs were passed in and 10 were expected.
> 
> I tried pvmove...
> 
> |pvmove --force -v /dev/md9 /dev/md10
> |pvmove -- checking name of source physical volume "/dev/md9"
> |pvmove -- locking logical volume manager
> |pvmove -- reading data of source physical volume from "/dev/md9"
> |pvmove -- checking volume group existence
> |pvmove -- ERROR: can't move physical extents: volume group vg0 doesn't exist 
> 
> How do I carry out the restructuring of it and can I reconstruct it?
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
