Message-ID: <3D7CC062.2040108@comedia.it>
From: Luca Berra <bluca@comedia.it>
MIME-Version: 1.0
Subject: Re: [linux-lvm] software mirroring
References: <2005.24.46.54.254.1031578510.squirrel@mail.scottsavarese.com>
Content-Transfer-Encoding: 7bit
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
Date: Mon Sep  9 10:38:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Scott Savarese wrote:
> Bootup is definantly the issue right now... I created two raid1 sets
> /dev/md0 and /dev/md1 on my second hard drive telling it that my first
> harddrive was failed (so it wouldn't use it and break it). The first
> will hold my /boot and the second (for now) will hold my /. I then
> installed LVM onto my /dev/md1 and copied the filesystems over to the
> appropriate locations. However after I configure lilo and fstab I have
> issues. Depending on my lilo.conf I get either
> L 80 80 80 ...
> or
> LI

please provide:
lilo version
lilo.conf
contents of partition tables on both drives

L.
