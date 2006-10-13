From: Martin Wilmes <martin.wilmes@java-cup.de>
Subject: Re: [linux-lvm] Broken hard disk
Date: Fri, 13 Oct 2006 05:53:18 +0200
References: <200610122350.46609.martin.wilmes@java-cup.de>
	<452EC755.1070603@redhat.com>
In-Reply-To: <452EC755.1070603@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200610130553.24145.martin.wilmes@java-cup.de>
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
To: linux-lvm@redhat.com

On Friday, 13. October 2006 00:53, Bryn M. Reeves wrote:
> You can add move 'v's to increase the verbosity of vgscan to see what
> it's scanning - do you have any device filters configured in /etc/lvm.conf?

No filters, everything is commented out (unchanged).

vgscan -vvv now generates ouput for hda:

...
      /dev/hda1: size is 208782 sectors
        Closed /dev/hda1
      /dev/hda1: size is 208782 sectors
        Opened /dev/hda1 RO O_DIRECT
        /dev/hda1: block size is 1024 bytes
        Closed /dev/hda1
        Using /dev/hda1
        Opened /dev/hda1 RO O_DIRECT
        /dev/hda1: block size is 1024 bytes
      /dev/hda1: No label detected
        Closed /dev/hda1
        /dev/loop1: Skipping (sysfs)
        /dev/cloop1: Skipping: Unrecognised LVM device type 240
...

> It'd also be good to see what pvscan shows, for e.g.:

pvscan -vvv outputs:

...
      /dev/hda1: size is 208782 sectors
        Closed /dev/hda1
      /dev/hda1: size is 208782 sectors
        Opened /dev/hda1 RO O_DIRECT
        /dev/hda1: block size is 1024 bytes
        Closed /dev/hda1
        Using /dev/hda1
        Opened /dev/hda1 RO O_DIRECT
        /dev/hda1: block size is 1024 bytes
      /dev/hda1: No label detected
        Closed /dev/hda1
        /dev/loop1: Skipping (sysfs)
        /dev/cloop1: Skipping: Unrecognised LVM device type 240
...

Thanks
Martin
