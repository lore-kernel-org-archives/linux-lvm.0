Return-Path: <juergens@muon.de>
Date: Fri, 26 Jan 2001 21:46:47 +0100
From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] Keeping swap in the middle of the disk
Message-ID: <20010126214647.A19035@guldukat.muon>
References: <Pine.SOL.4.21.0101261903030.19267-100000@green.csi.cam.ac.uk>
Mime-Version: 1.0
In-Reply-To: <Pine.SOL.4.21.0101261903030.19267-100000@green.csi.cam.ac.uk>; from cdw22@hermes.cam.ac.uk on Fri, Jan 26, 2001 at 07:18:23PM +0000
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, 26.01.01, Chris Wilson <cdw22@hermes.cam.ac.uk> wrote:
> 

[cut some stuff]

> Each disk is partitioned as follows:
> 
>   hda1     hda2      hda3     hda4
> <32 meg> <22 gig> <256 meg> <22 gig>
> 
> The two drives are hda and hdc. I'd hoped it might be possible to create a
> Logical Volume from hda2 and hda4, and one from hdc2 and hdc4. Then use
> them as Physical Volumes to create an 88gig Logical Volume for my reiser
> filesystem. It would appear that I cannot do this with LVM (pvcreate
> appears to check that the devices are not logical volumes).

I suppose the hda3 and hdc3 are to be the swap devices, so all you
have to do is:

(1) 	turn hda2, hda4, hdc2 and hdc4 into _physical volumes_, using
	partition id 8e and pvcreate, eg

	"pvcreate /dev/hda2 /dev/hda4 /dev/hdc2 /dev/hdc4"

(2)	create a _volume group_ out of these PV's

	"pvcreate <name of VG> /dev/hda2 /dev/hda4 /dev/hdc2 /dev/hdc4"

(3)	create a _logical volume_. This is where the filesystems are
	put on :)

	"lvcreate -n <name of LV> -L 88G /dev/<name of VG>"

(4) 	make filesystem

	"mkreiserfs /dev/<name of VG>/<name of LV>

that should be it.

good luck,

Nils

-- 
 >   Nils Juergens  | nils@muon.de | icq 7090774   <
 >  If we all work hard, we can turn this company  <
 >      around 360 degrees -- gruntbert(LOTD)      <
