Subject: Re: [linux-lvm] Fwd: LVM on ATA-Raid Working - but Poorly
References: <1034915787.3daf8fcb66a42@mail.dornquast.com>
	<3DAFB7D4.B88B6737@silicide.dk>
	<ufaelanvnav.fsf@epithumia.math.uh.edu>
	<3DB02DD6.B8B4B48E@silicide.dk>
	<ufa65vzviuo.fsf@epithumia.math.uh.edu>
	<3DB0348D.42FFC0A4@silicide.dk>
	<ufawuoftw8h.fsf@epithumia.math.uh.edu>
	<3DB264D3.A994B237@silicide.dk>
	<ufabs5oord6.fsf@epithumia.math.uh.edu>
	<3DB30743.91439340@silicide.dk>
From: Jason L Tibbitts III <tibbs@math.uh.edu>
In-Reply-To: Jon Bendtsen's message of "Sun, 20 Oct 2002 21:42:59 +0200"
Message-ID: <ufaheffvog3.fsf@epithumia.math.uh.edu>
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
Date: Mon Oct 21 09:47:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "JB" == Jon Bendtsen <jon+lvm@silicide.dk> writes:

JB> oh, whats in your lilo.conf then ?

I had to get the machine booting again; since the IBM disks die so
regularly I can't use the machine for anything useful.  In any case:

boot=/dev/md0
map=/boot/map
install=/boot/boot.b
prompt
timeout=50
message=/boot/message
linear
default=l-2.4.12-ac5_lvm_uh_1

image=/boot/vmlinuz-2.4.12-ac5_lvm_uh_1
        label=l-2.4.12-ac5
        password=XXX
        restricted
        initrd=/boot/initrd-2.4.12-ac5_lvm_uh_1.img
        read-only
        root=/dev/md1

md0 is an eight-way mirror, mounted on /boot.  None of the system
volumes are on LVM.

 - J<
