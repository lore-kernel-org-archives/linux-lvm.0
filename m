From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] software mirroring
Message-ID: <348030000.1031579797@[192.168.200.4]>
In-Reply-To: <2005.24.46.54.254.1031578510.squirrel@mail.scottsavarese.com>
References: <2005.24.46.54.254.1031578510.squirrel@mail.scottsavarese.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Mon Sep  9 09:02:44 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

> /dev/md0 and /dev/md1 on my second hard drive telling it that my first
> harddrive was failed (so it wouldn't use it and break it). The first
> will hold my /boot and the second (for now) will hold my /. I then
> installed LVM onto my /dev/md1 and copied the filesystems over to the
> appropriate locations. However after I configure lilo and fstab I have
> issues. Depending on my lilo.conf I get either
> L 80 80 80 ...
> or
> LI

You will save yourself a lot of trouble if you
stick with hardware raid for the boot volume (i.e.,
the bios only sees a single device) and avoid LVM
altogeter for the root volume (assuming you put
/boot on /). Main reason is that if anything does
go wrong with LVM it's a pain to fix without LVM.

Until the X86 BIOS gets brains (and pigs floss...)
just use a simple partition for the root voume and
perhaps a second partition with a stand-alone rescue
system on the other drive. If you install LVM into
the root volume (e.g., /lvm) then yuo can at least
boot single-user and fix things.


--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
