Return-Path: <c.brunnkvist@speednames.com>
Message-ID: <909EA7234316394F80BBB70A85A1EB389607DA@hermes.dimac.net>
From: "Conny Brunnkvist / dimac.net" <c.brunnkvist@speednames.com>
Subject: RE: [linux-lvm] lvm_chr_ioctl / unable to activate vg
Date: Tue, 26 Jun 2001 11:45:29 +0200
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

> vgchange -- creating VGDA for "vg0" in kernel
> lvm -- lvm_chr_ioctl: unknown command 4004fe0a
> vgchange -- ERROR "Invalid argument" activating volume group "vg0"

> So, I speculate it has to do with the change of userland 
> tools versions...

I just found out that it was v0.9 I had used before, and when I switched
back to that version it started working again! With kernel 2.4.4 and all.
Perhaps that error message wasn't intuitive enough for me... 8-)

Now I'm just curious about what will happen when I upgrade to v1.0...

Anyhow, thanks for a wonderful piece of software! ;)

//conny
