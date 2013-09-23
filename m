Message-ID: <523FF01F.4000403@redhat.com>
Date: Mon, 23 Sep 2013 09:39:11 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <CAFrGbuXqastwqEG3J5Vc7LeuiK3_SGr3GDkoaeMAJEW3FUEO+A@mail.gmail.com>
In-Reply-To: <CAFrGbuXqastwqEG3J5Vc7LeuiK3_SGr3GDkoaeMAJEW3FUEO+A@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Mirrored LVM volumes and UUID
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Alessandro MACUZ <alessandro.macuz@gmail.com>

On 09/20/2013 01:30 PM, Alessandro MACUZ wrote:
> I use mirrored volumes and blkid returns the same UUID for the "raid"
> volume and the underlying volumes
> 
> /dev/mapper/lvm01-root_mimage_0:
> UUID="0b88ad6f-34ed-46d6-abe3-eca0d235b353" TYPE="ext4"
> /dev/mapper/lvm01-root_mimage_1:
> UUID="0b88ad6f-34ed-46d6-abe3-eca0d235b353" TYPE="ext4"
> /dev/mapper/lvm01-root: UUID="0b88ad6f-34ed-46d6-abe3-eca0d235b353"
> TYPE="ext4"
> 
> Then such ID is used in fstab to mount root based... on UUID.
> 
> I wonder how fstab knows that it must use /dev/mapper/lvm01-root and not
> the others since the three of them share the same UUID, and if by
> accident the others can be erroneusly used/mounted.

When the mirror volume is activated, only top-level volumes are scanned
by blkid in udev rules (it's coordinated by 11-dm-lvm.rules and 13-dm-disk.rules
which are in /lib/udev/rules.d). In this case, it's the lvm01-root only that
is scanned by blkid within udev processing, not the *_mimage devices. Then we
end up with a symlink created only for the top-level volume in /dev/disk/by-uuid
directory. And this is what is being looked for at boot...

The similar situation happens with snapshot volumes which would end up with
same FS UUID for the origin and all its snapshots. In this case, we always give
priority to the origin volume.

Peter
