Date: Mon, 16 Oct 2000 00:29:28 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] lv inactive after reboot
In-Reply-To: <20001012224338.A17900@muon.de>
Message-ID: <Pine.LNX.4.21.0010160028130.1693-100000@fogarty.jakma.org>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nils Juergens <nils@muon.de>
Cc: linux-lvm@msede.com

On Thu, 12 Oct 2000, Nils Juergens wrote:

> Isn't this default behavior? My vgscan showns no sign of -a or -y, these
> are vgchange options.
> 
> This is what i do in my startup-scripts:
> 
> /sbin/vgscan
> /sbin/vgchange -a y
> 

i do this too of course (everything but /boot and / is on LVM),
however it fails to bring this one LV up. And the only difference
with this one is that it was once renamed.

> cu,
> 
> Nils
> 
> 

-- 
Paul Jakma	paul@clubi.ie
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
According to all the latest reports, there was no truth in any of the
earlier reports.
