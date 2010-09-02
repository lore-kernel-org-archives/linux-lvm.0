MIME-Version: 1.0
In-Reply-To: <4C7F7B48.3010005@redhat.com>
References: <AANLkTinf2_y2j+i_xNZpiJBQNkkYo7_xv8iLnT-tHpVY@mail.gmail.com>
	<4C7F7B48.3010005@redhat.com>
Date: Thu, 2 Sep 2010 16:43:36 -0400
Message-ID: <AANLkTi=2K2=V3Pj8aMx7uB_+Fqn12ZWa1EteKQhH=uAu@mail.gmail.com>
From: Tom Wizetek <tom@wizetek.com>
Subject: Re: [linux-lvm] Removing a failed PV from VG/LV
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
Content-Transfer-Encoding: 7bit
To: "Bryn M. Reeves" <bmr@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

This is very useful information. I appreciate it Bryn. The link to the
presentation was also particularly valuable.

Now, having read your post, I need to ask: instead of
recovering/moving data off the partial VG, is there a way to just
shrink the existing VG by the size of the missing PV and carry on?

If I set up a loop device and did a pvcreate --uuid, then
vgcfgrestore, vgscan and finally activated the VG and fsck'd the LV,
could I then shrink the filesystem and remove the replacement loop VG?

P.S.
Using LVM2 2.02.70 here and I can't seem to pvcreate on loop:
# pvcreate /dev/loop0
Device /dev/loop0 not found (or ignored by filtering).
# ls -l /dev/loop*
brw-rw---- 1 root disk 7, 0 Sep  2 11:24 /dev/loop0
brw-rw---- 1 root disk 7, 1 Sep  2 09:31 /dev/loop1
brw-rw---- 1 root disk 7, 2 Sep  2 09:31 /dev/loop2
brw-rw---- 1 root disk 7, 3 Sep  2 09:31 /dev/loop3
brw-rw---- 1 root disk 7, 4 Sep  2 09:31 /dev/loop4
brw-rw---- 1 root disk 7, 5 Sep  2 09:31 /dev/loop5
brw-rw---- 1 root disk 7, 6 Sep  2 09:31 /dev/loop6
brw-rw---- 1 root disk 7, 7 Sep  2 09:31 /dev/loop7
# grep -w filter /etc/lvm/lvm.conf
    # A filter that tells LVM2 to only use a restricted set of devices.
    # The filter consists of an array of regular expressions.  These
    # Don't have more than one filter line active at once: only one gets used.
    filter = [ "a/.*/" ]
    # filter = [ "r|/dev/cdrom|" ]
    #filter = [ "a/loop/", "r/.*/" ]
    # filter =[ "a|loop|", "r|/dev/hdc|", "a|/dev/ide|", "r|.*|" ]
    # filter = [ "a|^/dev/hda8$|", "r/.*/" ]
