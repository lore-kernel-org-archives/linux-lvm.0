Return-Path: <diedvdyk@jedi.van-dijk.net>
From: Diederick van Dijk <diedvdyk@jedi.van-dijk.net>
Subject: Re: [linux-lvm] Problem with UUID, vgscan, vgcfgrestore
Date: Tue, 3 Apr 2001 07:34:50 +0200
References: <200104022100.f32L0jL13101@webber.adilger.int>
In-Reply-To: <200104022100.f32L0jL13101@webber.adilger.int>
MIME-Version: 1.0
Message-Id: <01040307345000.00915@darkvader>
Content-Transfer-Encoding: 8bit
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Monday 02 April 2001 23:00, you wrote:
> Diederick van Dijk writes:
> > I've a LVM of 8 physical volumes that I've created with LVM 0.9.1 beta 2.
> > I've the know problem that vgscan reports that it can't find my VG.
> > So I upgraded to LVM 0.9.1 beta 6 (tools and kernel) and runned on each
> > physical disk a vgcfgrestore. Unfortunately I didn't solve the problem.
> > Attached is the output of the commands vgdisplay -v and a pvdata -U for
> > each physical disk. Debug logs a very huge so I won't attach them.
>
> OK, I have figured out why vgcfgrestore doesn't work properly with broken
> UUIDs.  It is because vgcfgrestore only restores the backup VGDA data to
> each disk separately.  This means it is not possible to have consistent
> UUIDs generated for all PVs in a VG when vgcfgrestore is run.
>
> You can try the following (experimental) procedure to fix the UUIDs:
>
> Check each PV with "pvdata -PP /dev/hdX" to ensure it has a valid
> UUID assigned.  Also get the PV numbers (starting with 1) for each of
> the PVs.  Finally, check the pv_uuidlist_on_disk.base for each PV.
> It will normally be 6144, but it does not have to be.
>
> for each PV (in PV# order)
>     dd if=/dev/hdX bs=1 skip=44 count=128 >> /tmp/uuids
>
> This should create a file /tmp/uuids which has all of the PV UUIDs in it.
> Make sure there are as many UUIDs in the file ("od -a /tmp/uuids" is good)
> as you have PVs (8 in your case).
>
> Now, we want to write the UUID list back to the PVs so vgscan is happy:
>
> for each PV (in any order)
>     dd if=/tmp/uuids of=/dev/hdX bs=1 seek=<pv_uuidlist_on_disk.base for
> hdX>

Unfortunately this doesn't work. I get on of=/dev/hda2 an invalid argument. 
Can you write to a partition with dd ? Or has it to be a disk such as 
/dev/hda ?

>
> example:
>     dd if=/tmp/uuids of=/dev/hda2 bs=1 seek=6144
>
> Now vgscan should be able to detect all of the disks and work properly.
>
> Cheers, Andreas
