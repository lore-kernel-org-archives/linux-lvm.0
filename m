MIME-Version: 1.0
In-Reply-To: <50C9A325.4090109@redhat.com>
References: <CAG2kNCyOSivGSfR6adJEZgfoJKnVksx=6+cWsvxWOfd5bHc=vw@mail.gmail.com>
	<50C9A325.4090109@redhat.com>
Date: Thu, 13 Dec 2012 12:37:04 +0100
Message-ID: <CAG2kNCxwiC+xM59+DrHQnURhM6Jp-KXzNjvk8TuCAMUOkUJBTg@mail.gmail.com>
From: Gianluca Cecchi <gianluca.cecchi@gmail.com>
Subject: Re: [linux-lvm] Pvmove while volume_ list is enabled freeze whole
	lvm
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Dec 13, 2012 at 10:43 AM, Zdenek Kabelac  wrote:
>
>
> Usual way if something goes wrong:
>
> Check if there is a device in 'suspend' state -
> (i.e.   dmsetup info -c     and check for 's' flag in Stat column)
> Resume all suspend devices -    dmsetup resume vgname-lvname &
> You could easily remove those which have zero open count  - dmsetup remove
> Eventually if you are brave enough, you could try 'dmsetup remove_all'.
>
> Now you should be able to activate your LVs again.
>
> Obviously 5.8 is somewhat older and there are some old bugs likely already
> fixed in newer releases - thus you may have far less problems with newer
> RHEL?
> (or use support for reproducible bugs?)
>
> Zdenek
>

when I run pvmove I got:
# time pvmove /dev/mapper/mpath127 /dev/mpath/mpath23
  Not activating VG_DOCS_APPL/pvmove0 since it does not pass activation filter.
  Temporary pvmove mirror activation failed.
  Unable to deactivate open VG_DOCS_APPL-pvmove0 (253:69)
  Unable to deactivate open VG_DOCS_APPL-LV_DOCS_APPL (253:58)
  libdevmapper exiting with 1 device(s) still suspended.

This was because I'm using HA-LVM and forgot to temporarily bypass the
volume_list directive
volume_list = [ "VolGroup00", "@iclnode1" ]

Now in fact as you asked I can see
# dmsetup info -c
Name                                          Maj Min Stat Open Targ
Event  UUID
...
VG_DOCS_APPL-pvmove0                          253  69 -Isw    1    0
   0 LVM-oZIpsGRusTsze13xns0jvNeQbFuzxtRkwGQ1G6JEFZ5iM9YQRQzmFrithE6328Y5

and the I/O on the relative fs results blocked.
Apparentely the other ones are going ok.
So would it be ok to proceed this way:

1) comment out volume_list in lvm.conf
2) touch /boot/initrd*
(due to bug in ha-lv cluster monitor script)
3) dmsetup resume VG_DOCS_APPL-pvmove0

?

Thanks
