Message-ID: <001501c2ef4b$98bf6160$c70aa8c0@RD.proware.com.tw>
From: "Rocky Lee" <rocky_lee@proware.com.tw>
Subject: [linux-lvm] lvm and md
MIME-Version: 1.0
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
Date: Thu Mar 20 19:45:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> Did you use the trick by changing the partitions to
> linux raid
> autodetect ?

>To my knowledge most of your questions are >answered in the
>howto's. See
>www.tldp.org
>for software raid howto, and LVM howto

Hi JonB

I've set the
"persistent_superbit  1"  in raidtab
all disk partition type were also all " raid auto detect"

then if I delete the original raidtab file and reboot.
the system couldn't find the raid device, the LVM coundn't find the volume
either.
does md have to depend on the raidtab file?

Rocky Lee
