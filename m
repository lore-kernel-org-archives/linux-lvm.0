Message-ID: <54743766.7020502@redhat.com>
Date: Tue, 25 Nov 2014 09:01:42 +0100
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <CAE8gLhnfE2Dd3cKXS-wJajJ6h5wnW11QprDLPrrJX0_eXJ_F3A@mail.gmail.com>
In-Reply-To: <CAE8gLhnfE2Dd3cKXS-wJajJ6h5wnW11QprDLPrrJX0_eXJ_F3A@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM VG is not activated during system boot
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
To: megabrutal@gmail.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 11/24/2014 11:27 PM, MegaBrutal wrote:
> Hi all,
> 
> I use Ubuntu, and several weeks ago I asked a question about LVM here:
> http://askubuntu.com/questions/542656/lvm-vg-is-not-activated-during-system-boot
> 
> Unfortunately, I didn't receive any answers.
> 
> I don't know if my problem is distro-specific or not, but I try to ask
> here too.
> 
> I have 2 VGs on my system, and for some reason, only one of them gets
> activated during the initrd boot sequence, which doesn't have my root
> LV, so my boot sequence halts with an initrd prompt. I already specified
> in lvm.conf that I wish both my VGs to be auto-activated with
> auto_activation_volume_list, but it has no effect.
> 
> Could anyone please advise what might be the problem?

Hi!

What's the exact lvm2 version used (lvm --version)?

Is lvmetad enabled in your setup? (global/use_lvmetad=1 setting
in lvm.conf and lvmetad daemon running?)

Does it activate when you run vgchange -aay vmdata-vg vmhost-vg
directly on the busybox cmd line?

-- 
Peter
