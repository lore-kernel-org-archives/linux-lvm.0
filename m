Message-ID: <20040107092415.A28215@cs.mcgill.ca>
From: Navindra Umanee <navindra@cs.mcgill.ca>
Subject: Re: [linux-lvm] setting VG UUID
References: <20040107065801.A27995@cs.mcgill.ca>
Mime-Version: 1.0
In-Reply-To: <20040107065801.A27995@cs.mcgill.ca>; from Navindra Umanee on Wed, Jan 07, 2004 at 06:58:01AM -0500
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
Date: Wed Jan  7 08:26:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> After figuring out that my all my PVs were lacking UUIDs, I used this
> hack from Heinz to correct the situation:
> 
> http://lists.sistina.com/pipermail/linux-lvm/2002-January/010521.html
> 
> (Alasdair also kindly provided a patch to handle the situation in LVM2.)
> 
> Now my VG itself is still lacking a UUID and this causes problems such
> as vgcfgrestore refusing to continue.  Is there any way I can update
> my VG UUID?

For the record, I'm absolutely crazy, but I fixed this by doing:

echo "deadbeefdeadbeefdeadbeefdeadbeef"|dd of=/dev/hda6 obs=1 seek=4096 count=32
echo "deadbeefdeadbeefdeadbeefdeadbeef"|dd of=/dev/hda7 obs=1 seek=4096 count=32
echo "deadbeefdeadbeefdeadbeefdeadbeef"|dd of=/dev/hda8 obs=1 seek=4096 count=32
echo "deadbeefdeadbeefdeadbeefdeadbeef"|dd of=/dev/hda9 obs=1 seek=4096 count=32

So much for universal uniqueness...  but now finally LVM2 is happy to
accept my LVM1 partitions!  Woohoo!!

For the record, I created my LVM1 partitions with Linux Mandrake 9.2.
So I anticipate other people will be having this kind of fun.  :-)

One inconvenience I still seem to have is that /dev/bytepool/ is now
filled with symlinks and when I boot back to Linux 2.4 with LVM1 (no
device-mapper), it fails to mount the partitions because of this.
Cleaning /dev/bytepool/ and rebooting seems to fix this.

Should "vgchange -a n" maybe clean up these symlinks?

Cheers,
Navin.
