From: wbh <W.B.Hill@uea.ac.uk>
Subject: Re: [linux-lvm] LVM ate my data!
In-Reply-To: <20020225192811.A9674@sistina.com>
Message-Id: <Pine.OSF.4.05.10202252007450.18015-100000@cpca7.uea.ac.uk>
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
Date: Mon Feb 25 14:18:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Wahey - I got my data back, thankyou!

> pvcreate -yff /dev/hda[34]
> vgcfgrestore -n YourVGName /dev/hda3
> vgcfgrestore -n YourVGName /dev/hda4
> vgscan
> vgchange -ay

What I did, from .bash_history
rm -rf /etc/lvmtab /etc/lvmtab.d /dev/pvg # I had backed up already.
~/LVM/1.0.3/tools/vgscan
~/LVM/1.0.3/pvcreate -yff /dev/hda[34]
vgcfgrestore -n pvg /dev/hda3
vgcfgrestore -n pvg /dev/hda4
~/uuid_fixer/uuid_fixer /dev/hda3 /dev/hda4
~/LVM/1.0.3/tools/vgscan
~/LVM/1.0.3/tools/vgchange -ay
mount -treiserfs /dev/pvg/1 /mnt/dat

Don't know how much of that was needed...

I had been playing with snapshots recently, but they didn't seem to work
with my ancient (2.4.3) kernel. Could that have been the cause?

Thanks!
    Bill
