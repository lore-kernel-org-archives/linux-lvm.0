From: Benjamin Scott <bscott@ntisys.com>
Subject: Re: [linux-lvm] LAZY MODE: Exchanging a LVM'ed disk
In-Reply-To: <87wv0lu1rw.fsf@papadoc.bayour.com>
Message-ID: <Pine.LNX.4.33.0111201025540.2520-100000@dragon.inside.ntisys.com>
MIME-Version: 1.0
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
Date: Tue Nov 20 09:30:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On 20 Nov 2001, Turbo Fredriksson wrote:
> I currently have a disk in my LVM set which is only 1Gb. It's also quite
> old, so I'd like to replace that with a newer/bigger one..
>
> How would I go about doing this?

http://tech.sistina.com/lvm/doc/lvm_howto/Removing_an_old_disk.html

  1. Backup the existing filesystem(s)
  2. Verify the backup
  3. Create a PV on the new disk (pvcreate)
  4. Add the new PV to the existing VG (vgextend)
  5. Move the data from the old PV to the new PV (pvmove)
  6. Remove the old PV from the VG (vgreduce)
  7. Extend the LV to use the entire new PV (lvextend)
  8. Resize the filesystem to use the entire LV

> Bare in mind that all the SCSI id's will change when i remove the old
> disk, will that complicate issues?

  It will (it always does), but "vgscan" should handle most of it.

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |
