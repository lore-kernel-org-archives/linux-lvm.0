From: Terje Kvernes <terjekv@math.uio.no>
Message-Id: <wxx3d0d2czp.fsf@nommo.uio.no>
MIME-Version: 1.0
Subject: [linux-lvm] using 160GB IDE drives under linux with LVM.
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
Date: Thu Feb  7 15:34:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

  first, I'm sorry for asking here, but I'm close enough on topic (I
  hope :) and I know there are bright heads who deal with linux at
  this level out there.  I've also looked through google, and at the
  kernel IDE-documentation.  and the little thing that lingers is
  128GiB.

  fdisk is only able to address 128GiB, that's rather obvious.  if I
  make one partition, it's about that size, and if I make two
  partitions, the first one 100GiB, the last one will only be about
  28GiB.  if I pvcreate the device itself it helps a little, but not
  much.  /proc/lvm/global then returns the size as 134152192KB.

  now, I've added SCSI-devices that where > 500GiB with ease into LVM,
  but here I stumble.  is there some easy solution out there that I've
  missed?

  the box currently runs vanilla 2.4.16, only patched with LVM-1.0.1
  from 26/11.  patches or anything people want to toss at this will be
  highly appreciated.  we have two of these beasts from Maxtor, and
  stand to loose about 60GiB of space, which isn't all that neat.

-- 
Terje
