Date: Wed, 31 May 2006 14:04:14 +0200 (CEST)
From: Oliver Tennert <O.Tennert@science-computing.de>
Message-ID: <Pine.LNX.4.58.0605311353400.6195@picard.science-computing.de>
MIME-Version: 1.0
Subject: [linux-lvm] FS labels and LVM2
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: agk@redhat.com

Hi together,

am I wrong or does mount per FS label not work when the filesystem in 
question is located on a logical volume? We're using a 2.6.11 kernel and a 
SUSE 9.3 distro, so it might be just a question of using the most current 
kernel.

At least, a "mount -a" when a "LABEL=test" entry is in fstab, leads to the 
error:

mount: special device LABEL=test does not exist

But it exists:

localhost:/var/log # xfs_admin -l /dev/mapper/vucf0002vg-fs2
label = "test"

Any idea?

Best regards

Oliver Tennert

__
________________________________________creating IT solutions

Dr. Oliver Tennert
Senior Solutions Engineer
CAx Professional Services
                                        science + computing ag
phone   +49(0)7071 9457-598             Hagellocher Weg 71-75	
fax     +49(0)7071 9457-411             D-72070 Tuebingen, Germany
O.Tennert@science-computing.de          www.science-computing.de
