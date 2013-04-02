Message-ID: <515AC642.7000609@redhat.com>
Date: Tue, 02 Apr 2013 13:51:30 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <kjbu7f$5pd$1@ger.gmane.org>
In-Reply-To: <kjbu7f$5pd$1@ger.gmane.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Insufficient free space: 1 extents needed,
 but only 0 available with 32.83g available
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: "Brian J. Murrell" <brian@interlinx.bc.ca>

On 04/01/2013 02:23 PM, Brian J. Murrell wrote:
> I have a VG:
>
>    VG          #PV #LV #SN Attr   VSize   VFree
>    rootvol_tmp   1  26   0 wz--n-  74.40g 32.83g
>
> Which has an LV in it which has a bad disk block on it.  Per previous
> discussions here I have an LV into which I can remap PEs with bad blocks on them:
>
> # lvdisplay --maps /dev/rootvol_tmp/badblocks
>    --- Logical volume ---
>    LV Name                /dev/rootvol_tmp/badblocks
>    VG Name                rootvol_tmp
>    LV UUID                oRCTFY-XNxh-3FA5-8lUG-FsOG-GjaO-giAcIu
>    LV Write Access        read/write
>    LV Status              available
>    # open                 0
>    LV Size                4.00 MiB
>    Current LE             1
>    Segments               1
>    Allocation             inherit
>    Read ahead sectors     auto
>    - currently set to     256
>    Block device           252:2
>
>    --- Segments ---
>    Logical extent 0 to 0:
>      Type		linear
>      Physical volume	/dev/sda2
>      Physical extents	2805 to 2805
>
> As you can see, it has a PE in it already.  I am trying to map another
> PE into it but getting an error:
>
> # lvextend --alloc anywhere /dev/rootvol_tmp/badblocks -l +1 /dev/sda2:2812
>    Extending logical volume badblocks to 8.00 MiB
>    Insufficient free space: 1 extents needed, but only 0 available

>
> Clearly there is something wrong with my syntax but I'm not quite sure
> what it is.  Any ideas?

You said there is a LV containing the bad block. You can not have a 
block belonging to two LVs (for completeness sake: it is possible in 
snapshots but those shared extents can not be created like that ^)

*Is the extent 2812 free?*

*No*
Use something like `pvmove --alloc anywhere /dev/sda2:2812` first.

Known issues: it does not work on mirrors and snapshots.
Workarounds? Split the mirror. Delete snapshot. Or you could try to 
hand-edit the metadata.

Also I am unsure what's the granularity of data it would skip - you may 
try to extract them first with e.g. ddrescue.

*Yes*
Then I have no idea except you may try specifying range /dev/sda2:2812-2812

>
> Much thanks!
>
> b.
>
> P.S. Please, no lectures about replacing the disk.  I understand the risks
> of operating on a disk that is starting to show signs of wear.  All of
> the data on this disk is backed up twice daily and anything lost
> between those backups will not be missed.  It's just not feasible for me
> to replace this disk at this time.  Thanks.

I fully respect your choice, I myself have enough of throw away data 
like VMs...

Except you may want to consider following:

Just for convenience, if you can spare more than 2 blocks be more 
generous and disable larger extent of blocks - those disk errors like to 
spread... (or allocate to LV which loosing will be least )

Sometimes backups are not backups. To check if the backups work, have 
you ever tried to recover *all* data from those backups?

By size of the disk looks like notebook. Are you using disk encryption? 
(Loosing LUKS header could be rather painful! Have you backed up that as 
well? Otherwise you would need to restore everything - which may be 
impractical for example over slow network or with limited data.)

Similar applies to loosing LVM metadata.

And also depending on FS you may loose more than just few files.

-- Marian


>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
