Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q0J2p0Jt029364
	for <linux-lvm@redhat.com>; Wed, 18 Jan 2012 21:51:00 -0500
Received: from mail-lpp01m010-f46.google.com (mail-lpp01m010-f46.google.com
	[209.85.215.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0J2owmV009484
	for <linux-lvm@redhat.com>; Wed, 18 Jan 2012 21:50:58 -0500
Received: by lahc1 with SMTP id c1so3651461lah.33
	for <linux-lvm@redhat.com>; Wed, 18 Jan 2012 18:50:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <0A03EDA0F33C5C428BFFF019C40D609EA7E3CCDDBF@SCMBXC01.bcbad.state.sc.us>
References: <CALe_PVkxi2oTuvqkSQz6KHi-G0Nxk7mXMOA8o3XFf3cwo7eG1Q@mail.gmail.com>
	<0A03EDA0F33C5C428BFFF019C40D609EA7E3CCDDBF@SCMBXC01.bcbad.state.sc.us>
Date: Thu, 19 Jan 2012 08:20:56 +0530
Message-ID: <CALe_PVk8jzZnpb5HRKfuXj7KAXqERw7BEahLMND3A1tkT-Ts_A@mail.gmail.com>
From: Kiran Rao <techie.curious@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Resizing a logical volume which is mounted (at
	/home)
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks for the advice Jess.

Actually I am to blame for this. I did not properly understand the LVM
concept before doing this partitioning. I have lots of free space on
disk but that is *outside* the VG. Only later did I realize that the
whole point of having VGs is to have some free space *within* them!

On Tue, Jan 17, 2012 at 8:06 PM, Males, Jess <jmales@cio.sc.gov> wrote:
> Log in as root:
>
> -������������� either once the system is completely booted, log in as root
> with the graphical prompt
>
> -������������� boot into single user mode. i.e. stop grub in its countdown,
> edit the boot configuration by appending single to the list of kernel
> parameters
>
>
>
> Or, boot with a live CD/USB environment.
>
>
>
> I would recommend this last option.� Depending on the live environment, you
> might have to manually detect the volume group, but you�re outside the
> installed system so you can change any logical volume without worry or
> conflict.
>
>
>
> I would suggest the real lesson from all of this is: unless space
> constrained, never commit 100% of your vg.� The whole point of abstracting
> your disk into lvm is for flexibility, and how can you have flexibility
> without a little spare disk to apportion later?� I say this because you
> sound ready to slice X GB off lvhome and immediately commit it all to other
> logical volumes; keep some as spare.
>
>
>
>
>
> -- Jess Males
>
>
>
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
> Behalf Of Kiran Rao
> Sent: Monday, January 16, 2012 8:07 AM
> To: linux-lvm@redhat.com
> Subject: [linux-lvm] Resizing a logical volume which is mounted (at /home)
>
>
>
> To start off, here's an overview of my configuration. I'm dual-booting
> Windows XP and Fedora Core 16. When I installed FC 16, here's how I created
> the partitions:
>
> 1) Volume Group (vg_me) - ~73 GB
>
> Out of this, the following are the logical volumes:
> a) lvhome (mount point - /home) - ~48GB
> b) lvroot (mount point - /) ~10GB
> c) lvvar (mount point - /var) ~15GB
>
> So, there's no free space left on the volume group.
>
> Now, I feel the 48GB is not really necessary for the /home. I want to
> redistribute the space among the 3 logical volumes within this VG, or create
> a new one (/tech).� In either case, I want to take the additional space
> (around 20GB) from lvhome and give it to either / or to /tech.
>
> Now, I tried the GUI (system-config-lvm) tool to do this. I can click on
> lvhome and try to resize it. However, the problem is that since I am logged
> in as a non-root user, the /home is mounted. Resizing requires one to
> unmount it, but the unmount operation fails since I am mounted.
>
> How do I work around this?
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
