Date: Sun, 26 Dec 1999 19:42:57 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] problems with mdutils(raid1) and lvm
Message-ID: <19991226194257.B20388@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <m121EZ1-000D4UC@londo.rhein-main.de>
Mime-Version: 1.0
In-Reply-To: <m121EZ1-000D4UC@londo.rhein-main.de>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lvm <linux-lvm@msede.com>

On Thu, Dec 23, 1999 at 09:10:19PM +0100, Torsten Neumann wrote:
> even if ckraid failed. With lvm : vgscan didn't find my vg00 if /dev/md0 is
> not present. Therefor I can't recover my system from the remaining disk(s).
> Is there a way to activate such a volume group ?
change the partition type to 0xfe with fdisk

L.


-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.
