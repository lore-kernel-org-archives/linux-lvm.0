Message-ID: <50C9A325.4090109@redhat.com>
Date: Thu, 13 Dec 2012 10:43:01 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAG2kNCyOSivGSfR6adJEZgfoJKnVksx=6+cWsvxWOfd5bHc=vw@mail.gmail.com>
In-Reply-To: <CAG2kNCyOSivGSfR6adJEZgfoJKnVksx=6+cWsvxWOfd5bHc=vw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Gianluca Cecchi <gianluca.cecchi@gmail.com>

Dne 13.12.2012 09:23, Gianluca Cecchi napsal(a):
> Hello,
> I have rhel 5.8 wit lvm tags enabled (volume_ list).
> In volume_ list I have
> @intraclusternode1
> Tag, so the main vg is active with its lv.
> But then I issue pvmove command that fails because it cannot activate the
> temporary mirror...But now on, all commands related to lvm, also for other vg,
> completely freeze..Any way to unblock?I tried removing the volume_list
> directive in lvm.conf, but no way...I would like to avoid doing power off if
> possible..
> Thanks
> Gianluca

Usual way if something goes wrong:

Check if there is a device in 'suspend' state -
(i.e.   dmsetup info -c     and check for 's' flag in Stat column)
Resume all suspend devices -    dmsetup resume vgname-lvname &
You could easily remove those which have zero open count  - dmsetup remove
Eventually if you are brave enough, you could try 'dmsetup remove_all'.

Now you should be able to activate your LVs again.

Obviously 5.8 is somewhat older and there are some old bugs likely already 
fixed in newer releases - thus you may have far less problems with newer RHEL?
(or use support for reproducible bugs?)

Zdenek
