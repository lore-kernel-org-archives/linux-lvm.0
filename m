From: "Unixcafe" <Unixcafe@charter.net>
Subject: RE: [linux-lvm] Physical volume size changed
Message-ID: <001001c20189$8ceb3f90$0a01a8c0@osiris>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20020522121144.G6806@deepthought.hausboot.org>
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
Date: Wed May 22 07:08:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello, I work for HP, the developer of LVM... I am a Unix support
engineer...  LVM will allow you to vgextend up to 255 disks/devices into
a vg and create up to 255 lvols. You can lvextend a lvol as long as you
have free pe available in the vg. However, if you modify an existing
lun, extend it, etc, I do not believe lvm will recognize it, at that is
the case in HP Unix. The best course of action when using lvm and vg's
is to vgextend another disk/lun into the vg and lvextend the lvol to the
needed size.... Hope this helps.... Nicholas 

-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]
On Behalf Of Jens Hoffrichter
Sent: Wednesday, May 22, 2002 6:12 AM
To: linux-lvm@sistina.com
Subject: [linux-lvm] Physical volume size changed


Hi!

We are using the LVM here in our company to manage our partitions and
are really satisfied with the software, its really great to change
partition sizes on the fly and similar :)

We are using two VG, system and data. data consists of one physical
volume, /dev/scsi/host2/bus0/target1/lun0/disc, which is the logical
volume of a IBM ServeRaid SCSI Controller with 4 disks and a raid 5.
This logical volume has 101.7 GB.

Now we have extended the logical volume on the IBM ServeRaid by using 3
36 GB disks, so the logical volume on the raid controller now has 203.4
GB. 

I have issued a SCSI reset on the bus hoping that the LVM notices on the
fly that the physical volume size has changed, but it doesn't recognize
it.

I have not rebooted yet, that is the other hope that the LVM recognizes
the additional free space after the reboot, but I'm not sure.

Are there other possibilities that the LVM recognizes that the PV size
has changed? Or is there no hope at all?

I would be really glad if somebody could give me some hints where to
look.

CU all,
Jens
-- 
GPG: 1024D/CF884D50  F2E8 F7FC F823 6464 4E9D  EFAB 6EE9 8B9C CF88 4D50
------------------------------------------------------------------------
  Jens Hoffrichter / joho@hausboot.org / Joho@IRC / Fon: 0172/5376989
    A dream is a wish your heart makes. 
                               (Seen on a parade in Walt Disney World)

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
