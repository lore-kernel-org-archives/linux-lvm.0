Message-ID: <4538961F.2030902@redhat.com>
Date: Fri, 20 Oct 2006 10:25:51 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Question about Physical volume
References: <45388202.7070305@nethinks.com>
In-Reply-To: <45388202.7070305@nethinks.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: tom@nethinks.com, LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thomas Marmetschke wrote:
> Hi,
> 
> is it possible to extend a phyiscal volume?
> 
> I have a strange problem, i resized the /dev/sda4 partion (8e Linux LVM)
> from 130GB to 220GB. so far so good.
> 

Hi Thomas,

Depending on how recent your version of LVM2 is, you can use pvresize to
do this:

# pvresize /dev/hda2

This will autodetect the new size of the PV and grow it accordingly. One
thing I noticed was that after fdisking the partition, a reboot was
needed to get kernel to see the new size - partprobe does not seem to be
sufficient.

That might have been a quirk though - check the partition sizes in
/proc/partitions to be sure.

Thanks,

Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFFOJYf6YSQoMYUY94RAuw3AJ9WIBaHGASEcJiIentE+nTJ89nRzwCgh6PD
Aw822Rs8DA7VsQGTaIms4z0=
=80Uw
-----END PGP SIGNATURE-----
