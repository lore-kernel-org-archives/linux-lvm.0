Message-ID: <21E8E34076807C41A646FDC666B15BDF0876A1@minna.combox.de>
From: Tobias Gablunsky <T.Gablunsky@cbxnet.de>
Subject: RE: [linux-lvm] LVM and RAID
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
Date: Tue Nov  4 07:10:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

> 
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On Tuesday 04 November 2003 11:49, Tobias Gablunsky wrote:
> > Hi all!
> > 
> > I didn't find clear information about how to use LVM on an 
> (Software)
> > RAID-Mirror (or RAID-5). All I found, were problems: LVM 
> uses Partition
> > Type
>  0x8E but Linux Soft-RAID uses 0xFD - this dosn't look very
> > compatible... A solution would be to use Hardware-RAID of 
> course. But I'm
> > wondering if there is a way to use Software-RAID and LVM 
> together - I
> > cannot believe that I am the first one with this question! Am I?
> 
> I just created the software raid, and pointed pvcreate at it.
> Works like a charm.

Well thats fine but if you want your kernel to boot use your RAID-Volumes
automatically you have to give it partition type 0xFD. And if you want
automatically mounted LVM you need to give it the partition type 0x8E - So
did you ever reboot your system?


> 
> - -- 
> Mike Williams
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.3 (GNU/Linux)
> 
> iD8DBQE/p5YSInuLMrk7bIwRAk+dAJ42yw0wUImTk3N5dqOfqDa/63ay/gCfWxl5
> vgvk4alAJdy68DRVD2U/cGg=
> =kGxr
> -----END PGP SIGNATURE-----
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
