Message-ID: <517A9C93.8030804@redhat.com>
Date: Fri, 26 Apr 2013 17:26:11 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <CAJbV6UOaAHcrP8272Jtbb2Yo8edk7P4=Evr4iHxVY3hM2J-Psg@mail.gmail.com>
In-Reply-To: <CAJbV6UOaAHcrP8272Jtbb2Yo8edk7P4=Evr4iHxVY3hM2J-Psg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] determining boot disk name(/dev/sd...) on RHEL LVM
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
Cc: siva krishna <hisivakrishna@gmail.com>

On 04/26/2013 11:19 AM, siva krishna wrote:
> Hi all,
>
> is there a way to determine the device name (eg: /dev/sda, /dev/sdb)
> on lvm partitioned disks,  when the os is booted from the lvm partitioned
> disk
> and there are also multiple disks connected which are having lvm partions
> with same volume group names as the primary disk.

lsblk should give you an answer on running system.

>
> i tried doing vgdisplay
>   and then correlating it's output with cat /etc/fstab, cat /etc/cmdline
>
> but there are multiple volume groups having the same name so can't find
> from which volume the RHEL is booting

You can not have running system with multiple VGs with same name.

I guess you mean the volume group spans over multiple disks, right?

If you happen to really have multiple VGs with same name, you have to 
fix VG names - search for words duplicate vg name.

-- Marian

>
> Thanks
> siva
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
