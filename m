Return-Path: <jweber@valinux.com>
Date: Fri, 19 Jan 2001 08:55:27 -0800 (PST)
From: Jay Weber <jweber@valinux.com>
Subject: Re: [linux-lvm] More probs 2.4.0 / 0.9.1beta2
In-Reply-To: <20010119161251.16298.qmail@web1703.mail.yahoo.com>
Message-ID: <Pine.LNX.4.30.0101190853410.28293-100000@beefcake.hdqt.valinux.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Loop isn't seen by the lvm utils since it looks in /proc/partitions for
the devices which it will scan.  I posted a patch a while back regarding
adding a LVM_FORCE_DEV_SCAN exported variable to force it to scan your
/dev directory and hence find the loop device.  I'll forward it your way
or you can check the lvm-devel archive, it was a rather recent posting.

On Fri, 19 Jan 2001, Mr. Penguin wrote:

> Date: Fri, 19 Jan 2001 08:12:51 -0800 (PST)
> From: Mr. Penguin <penguin_master_2000@yahoo.com>
> Reply-To: linux-lvm@sistina.com
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] More probs 2.4.0 / 0.9.1beta2
>
> Hi
>
> I'm still having problems with this! I've built a
> standard RH6.2 system and upgraded it to 2.4.0 with
> LVM. As well as not finding any of my existing VGs,
> pvcreate also fails when I use /dev/loop/0:
>
> pvcreate -- device "/dev/loop/0" doesn't exist
>
> I can't get anything from the system so I can't attach
> a debug log, but the last thing it says is:
>
> <1> pv_get_size -- leaving with ret -236
>
> Please help :)
>
> James
>
> PS lvmdiskscan doesn't see the "loop" device. And yes
> the loop device really is there and configured!
>
>
> __________________________________________________
> Do You Yahoo!?
> Get email at your own domain with Yahoo! Mail.
> http://personal.mail.yahoo.com/
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>
