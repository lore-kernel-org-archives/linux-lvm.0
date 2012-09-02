Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q822MKl0007823
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2012 22:22:21 -0400
Received: from mail-iy0-f174.google.com (mail-iy0-f174.google.com
	[209.85.210.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q822MJjt001827
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2012 22:22:19 -0400
Received: by iahk25 with SMTP id k25so3236622iah.33
	for <linux-lvm@redhat.com>; Sat, 01 Sep 2012 19:22:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANN7Ug3UvjyEtYyBDPv6C5QScq0PMSsG5OJ+GkSZYZj3e7o8Xg@mail.gmail.com>
References: <CA+ZVM8t--4TFtJ+cb=86-38ggjwYTUz5q+JAqv9sdPJW9XDV7A@mail.gmail.com>
	<CANN7Ug34MtUPMorfLxZqRTG7CDsaP0vD+8CBk+e-B4+JG8tX5w@mail.gmail.com>
	<CA+ZVM8vctTgXR27i6WMcLwLAq9_q2Dm4PPaaX8=pRQG_E+kmcA@mail.gmail.com>
	<CANN7Ug3UvjyEtYyBDPv6C5QScq0PMSsG5OJ+GkSZYZj3e7o8Xg@mail.gmail.com>
Date: Sun, 2 Sep 2012 09:22:19 +0700
Message-ID: <CA+ZVM8vXSmudRmuD4JfKYkEi07QdHv4GVaXsg+efNC0VrMb+Xg@mail.gmail.com>
From: "Rene C." <openvz@dokbua.com>
Subject: Re: [linux-lvm] Removing vg and lv after physical drive has been
	removed
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Sorry about that. The unique errors are the same I posted in the first post:

# (pvs -o +pv_uuid,lv_name >/dev/null) 2>&1 | sort -u
  /dev/vg04/swap: read failed after 0 of 4096 at 0: Input/output error
  /dev/vg04/swap: read failed after 0 of 4096 at 4096: Input/output error
  /dev/vg04/swap: read failed after 0 of 4096 at 4294901760: Input/output error
  /dev/vg04/swap: read failed after 0 of 4096 at 4294959104: Input/output error
  /dev/vg04/vz: read failed after 0 of 4096 at 0: Input/output error
  /dev/vg04/vz: read failed after 0 of 4096 at 4096: Input/output error
  /dev/vg04/vz: read failed after 0 of 4096 at 995903864832: Input/output error
  /dev/vg04/vz: read failed after 0 of 4096 at 995903922176: Input/output error

vg04 was indeed entirely on the missing disk.

would 'dmsetup remove vg04-swap' and 'dmsetup remove vg04-vz' not remove these?


On Sun, Sep 2, 2012 at 9:13 AM, Scott Merrilees <scott@merrilees.net> wrote:
> So noreboot fix wanted.  Potentially more difficult.
>
> What about the other command, to collect the unique errors?  It should
> show pv_uuids of missing pvs.
>
> I was hoping to see vg04 config.  Since we do not, does that mean vg04
> was entirely on the replaced disk?
>
> IIRC I have previously recreated a pv with the uuid reported by pvs,
> and then removed it cleanly.
>
> You could also look in /etc/lvm/backup/vg04, and you should be able to
> get the pv uuids from there.
> --
> Scott Merrilees
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
