From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] software mirroring
Message-ID: <20020910103245.GB9619@percy.comedia.it>
References: <2005.24.46.54.254.1031578510.squirrel@mail.scottsavarese.com> <3D7CC062.2040108@comedia.it> <3338.24.46.54.254.1031594005.squirrel@mail.scottsavarese.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3338.24.46.54.254.1031594005.squirrel@mail.scottsavarese.com>
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
Date: Tue Sep 10 05:33:22 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Scott Savarese <scott@scottsavarese.com>
Cc: linux-lvm@sistina.com

On Mon, Sep 09, 2002 at 01:53:25PM -0400, Scott Savarese wrote:
>OK... My lilo version is 22.2.
good
>/dev/hdc is:
>Disk /dev/hdc: 255 heads, 63 sectors, 12161 cylinders
>Units = cylinders of 16065 * 512 bytes
>
>   Device Boot    Start       End    Blocks   Id  System
>/dev/hdc1   *         1       131   1052226   fd  Linux raid autodetect
>/dev/hdc2           132     12161  96630975   8e  Linux LVM
>
(irrelevant to your issue atm)
is hdc2 part of md1? if so it should be type fd
(irrelevant to your issue atm)
>This is the harddrive I am doing all the work on.
>
>/dev/hda is the same harddrive configured with one partition the entire
>length of the disk of type 83 (linux). Right now that disk works. I'll add
>it to my mirrors after I am sure this works with one disk. I would like to
>get this to work on /dev/hdc first. Once that works, I'll mirror the disks
>to /dev/hda and then reset lilo and my bios to boot off /dev/hda.
ok, let's start hoping that your bios handles booting from secondary
master mapping it to drive 0x80, and does not screw things more than
needed.

>My lilo.conf looks like the following:
-------------------
>disk = /dev/md1
>sectors = 63
>heads = 255
>cylinders = 12161
>partition = /dev/md0
>start = 63
-------------------
the above should not be needed with lilo 22.2, it should be able to
detect geometry for raid arrays correctly

>boot = /dev/hdc
ok here is the main problem you are telling it to boot from
drive 0x82, then you change the bios and it becomes 0x80
so it tries to load from an inexistent disk

now is time for black magic
correct thing to do is putting a valid *STANDARD* mbr on disk hdc
hdc1 is already active and that is good
then use in lilo:

boot = /dev/md0

which would tell lilo to put its boot sector at the beginning of hdc1
and its mirrored copy.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
