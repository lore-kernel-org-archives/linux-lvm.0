From: Rodrigo de Salazar <rodrigo@es.ehas.org>
Message-ID: <20030312170112.GA19864@es.ehas.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Lost a full volume group!
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
Date: Wed Mar 12 11:02:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi there, I hope someone can help me with this. I had a VG with a single
PV (/dev/hda4), with several LVs in it (including the ones I use as /var, /var/www and
/tmp). I changed /etc/fstab, after resizing and adding a 
LV to the other VG I have (on another hdd). Reboot, and I find out that
I had not written fstab correctly, no big deal, just correct it in
single user mode and reboot again. Weird thing comes now: the first VG
(called vg1) has dissapeared. The /dev/vg1 directory and everything
inside have just vanished, vgscan says:

	vgscan -- found inactive volume group "vg1"

and any attempt to vgchange -a y /dev/vg1 results in:

	vgchange -- ERROR "Bad address" activating volume group "vg1"

So, is there a way to recover this VG and all the LVs in it, or will I
have to restore the system by another method (I lost /var...)?
Also, is this very unusual, or LVM is just not so stable?
I am running Debian GNU/Linux, kernel 2.4.20, and lvm 1.0.4.
Thanks in advance.
