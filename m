Message-ID: <3D9D65C7.4000002@mindmatics.de>
From: Andreas Baier <andreas.baier@mindmatics.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgscan cant find my vg
References: <200210041125.25719.rene@athome.dyndns.org>
Content-Transfer-Encoding: 7bit
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
Date: Fri Oct  4 05:00:20 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi Rene,

I had such a situation some time ago, too.
I had 2 scsi disks and a scsi-only kernel, with ide just as a loadable 
module. I added an ide disk to the running vg and all was ok until I 
rebooted. When booting up, my system lacked the ide-module so the hole 
vg was not recognized by the kernel.
Then I had two possibilities: compiling a new kernel with the ide-disk 
compiled into, or building a new initrd with the ide-module. Now the 
system is up perfectly well.

Rene Schumann wrote:

> Hello!
> 
> I have a volumegroup with name vg01 (sda1,sda2) since long time wich hold all 
> my userdata.
> Since yesterday my OS cant find this vg anymore.
> I remember the last thing was i did add hda9 to vg01.
> I did this while installing Mandrake9.0 for testing.
> I couldnt find a error from LVM but vgscan fails to find my vg.
> Laterly i created a second Volumegroup with name vg (hda9) but vg01 still not 
> working.



Best regards

Andreas
