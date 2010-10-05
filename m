Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o957Ui19003979
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 03:30:44 -0400
Received: from mail-gx0-f174.google.com (mail-gx0-f174.google.com
	[209.85.161.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o957UYnx016044
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 03:30:35 -0400
Received: by gxk9 with SMTP id 9so2376608gxk.33
	for <linux-lvm@redhat.com>; Tue, 05 Oct 2010 00:30:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1010050215180.26224@bmsred.bmsi.com>
References: <AANLkTimHbA1DPLFeK9626dXZ03WVR6qsYFERQSMc8M5j@mail.gmail.com>
	<4CA9E8C3.4040106@cfl.rr.com>
	<AANLkTinbZtX1aw9J1Bw-=8=S51i0HcaOo5T8whu49ASt@mail.gmail.com>
	<AANLkTikg8U38VEwJOJY+=vSLLjeLK04VmtvmYBhpfjbV@mail.gmail.com>
	<AANLkTinJF0pg+fwt2R6S5C2w6g31N4qqwmnnepjcYnB8@mail.gmail.com>
	<AANLkTik6bkG0hc0_ZsW81S2kgYcDVVm6Zt_UhbWMdmpj@mail.gmail.com>
	<AANLkTimTBv67Q6qa4ONibbPxHz-eOufR+gR=Qe4-CE3H@mail.gmail.com>
	<AANLkTikmp+gSajt=Nnp7JuopFBQgzM1DsGmziyMOjeXW@mail.gmail.com>
	<AANLkTinq+3DzM0x1sOGJB6Kw93d3i+dezNy86B1SQRBP@mail.gmail.com>
	<Pine.LNX.4.64.1010050215180.26224@bmsred.bmsi.com>
Date: Tue, 5 Oct 2010 13:00:32 +0530
Message-ID: <AANLkTi=5CZ+Z1vJv3qfdy0RMNiE0js-amQ9V7+d3iAff@mail.gmail.com>
From: Tapas Mishra <mightydreams@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] mounting a filesystem on LVM2
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

On Tue, Oct 5, 2010 at 11:54 AM, Stuart D. Gathman <stuart@bmsi.com> wrote:
> 3) an "LV" is a Logical Volume. �An advanced user might want to use an
> � LV to simulate a disk, putting a partitional table on it. �Usually
> � this is done by using the LV as a virtual disk for a Virtual Machine,
> � which then partitions and uses the virtual disk as it pleases.
> � You could also use fdisk/parted to partition an LV, and kparted to
> � make the partitions available as separate block devices.

This is exactly what I am looking at.
A tool virt-manager (from Red Hat does that)
how does it do ?
While installing a guest OS in an LVM I do not have to create a swap I
just point to the ISO on my server
and rest is done.
How is that part taken care of does virt-manager do it or the OS which
is being installed some thing from that makes sure that when you are
installing a guest OS in a virtualization environment then in an LVM
it will do.
Because I never needed to create partitions within LVM until I am
doing this setup to clone the LVM on the server to a
USB backup drive.

On Tue, Oct 5, 2010 at 12:02 PM, Alexander Skwar
<alexanders.mailinglists+nospam@gmail.com> wrote:
> hi.
>

>It's also identical, that you only create ONE (1) filesystem on any
>ONE (1) partition or lv. You do *NOT* create two or more filesystems
>on one partition/lv (it's doable, but *EXTREMELY* unusual).
That is exactly what I have to do.

>But that's also outlined in the LVM howto... Chapter 11.
>http://tldp.org/HOWTO/LVM-HOWTO/commontask.html

>You really should read it...
I did read and I could not find what I am trying.Can you exactly say
which point or para you see this being done what I asked?
I am not looking to create PV,VG I am trying to have two partitions
within LVM and then use them to populate with what ever I have.
