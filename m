References: <CAODnkUDhzOudB_5C+esDfLp+SAm6fa9bZ+ZLFwW4ep0eG0a6Fg@mail.gmail.com>
	<73d0ffcd-4ed5-38b1-0d17-a4b16c7863d6@redhat.com>
	<CAODnkUCkbfvyq8mUpK1OEx5C1jgfmjyYauHzjcA12aGnY6kLGA@mail.gmail.com>
	<c675a85e-9739-cda9-5588-654337783182@redhat.com>
	<CAODnkUDFLBsbhCOHcqza=mDagOR7HQ1GVCoVGr2pfM6v2h3wjQ@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <a5d9f6e1-ae4e-845f-f1d2-a119959b6548@redhat.com>
Date: Wed, 23 Sep 2020 20:49:27 +0200
MIME-Version: 1.0
In-Reply-To: <CAODnkUDFLBsbhCOHcqza=mDagOR7HQ1GVCoVGr2pfM6v2h3wjQ@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] thin: pool target too small
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
To: Duncan Townsend <duncancmt@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 23. 09. 20 v 20:13 Duncan Townsend napsal(a):
> On Tue, Sep 22, 2020, 5:02 PM Zdenek Kabelac <zkabelac@redhat.com 
> 
> dmeventd does write its PID file into the correct directory in the 
> post-initramfs root, so whatever's happening is some weird hybrid. I'll debug 
> this further with my distro.
> 
>     So I think to prevent repeated occurrence of this problem - you'll need
>     to ensure your system-booting will follow the pattern from distros
>     like Fedora.
> 
> 
> I think for now, the easiest solution may be to try to stop dmeventd from 
> being started by dracut.

Basically all you need to do for dracut (with reagards to dmeventd) is to 
setup inside dracut environemnt  'monitoring=0'  in /etc/lvm/lvm.conf there.
(so when it's copied system's lvm.conf there - replace with sed/awk...)

Also there is   'metadata_read_only=1' setting that can be useful for
dracut environment.

Dracut needs some bigger fixing on its own - but ATM we simply can't
provide set of features we would like to have.

> I have encountered a further problem in the process of restoring my thin pool 
> to a working state. After using vgcfgrestore to fix the mismatching metadata 
> using the file Zdenek kindly provided privately, when I try to activate my 
> thin LVs, I'm now getting the error message:
> 
> Thin pool <THIN POOL LONG NAME>-tpool transaction_id (MAJOR:MINOR) 
> transaction_id is XXX, while expected YYY.
Set the transaction_id to the right number in the ASCII lvm2 metadata file.

Zdenek
