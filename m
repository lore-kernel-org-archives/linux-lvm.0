Message-ID: <4C4D82E6.3080303@redhat.com>
Date: Mon, 26 Jul 2010 13:43:18 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <1279942095.12963.1386480183@webmail.messagingengine.com>	<4C4D4B47.8000201@redhat.com>
	<Pine.LNX.4.64.1007260805250.3000@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.1007260805250.3000@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Disk Partitioning tools, GUI preferably- best for
 LVM Logical Volume Management ; jor
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
Cc: giovanni_re <john_re@fastmail.us>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07/26/2010 01:16 PM, Stuart D. Gathman wrote:
> On Mon, 26 Jul 2010, Bryn M. Reeves wrote:
> 
>> On 07/24/2010 04:28 AM, giovanni_re wrote:
>>> So, I've got that big LV 4th partition, with empty space (2TB drive),
>>> and now I want to create some more linux partitions so I can install
>>> some other distros.
>>
>> If you want VMs then partitioning an LV makes sense. You present the
>> entire LV as a virtual disk to the guest and the emulated devices appear
>> to that OS as a regular partitioned disk. This is a very common technique.
> 
> Using Xen modified OSes, you don't need to partition the LVs.  The 
> xen storage driver presents each mapped block device as a virtual
> partition.

Not used Xen for a long time but that's good to know - iirc it did not
behave like this the last time I used it (with xvda disks).

> Booting multiple LVM supporting OSes works fine with LVM.  Have a LV for the
> root filesystem of each Linux OS, and have them all on the Grub menu.
> Make the /boot partition extra large.  I do this with every laptop
> and desktop as SOP.  Make Fedora upgrades much less fearful.

That's exactly what I was suggesting :-)

Adding nested partitions _inside_ the LVs (which is what the OP seemed
to want) is going to complicate things significantly for bare-metal.

> If every distro sticks to reasonable naming conventions in /boot (so
> that they don't step on each others kernels), then it all works fine.

Yes although you still need to be a little careful during installations
to make sure that there aren't any conflicts (I often want to have a
couple of versions of the same distribution, or even different instances
of the same version of the same distribution installed together). Also
remember never to re-format /boot during an install :)

Regards,
Bryn.



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org/

iEYEARECAAYFAkxNguYACgkQ6YSQoMYUY97YHACfUlBWe2NnmC8ztIZ0ZGa46xKU
ByEAoIfCSb0XUzR+Usy5VE9SGq3AXl2U
=+GcI
-----END PGP SIGNATURE-----
