Message-ID: <3C07C9D4.6020904@st-peter.stw.uni-erlangen.de>
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Mandrake 8.1 and LVM
References: <Pine.LNX.4.21.0111291649440.435-100000@sol.rune.org> <Pine.LNX.4.33.0111291608480.4437-100000@lx1.daboard.com> <20011129190920.B23998@kluge.net> <20011130020118.C17482@wookimus.net> <20011130114912.K26718@kluge.net> <20011130183933.A20547@colombina.comedia.it>
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
Date: Fri Nov 30 12:02:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

>
>
>>With / on LVM, you're definately unable to boot if LVM has problems.
>>
>with / on ext2 you're definately unable to boot if ext2 has problems.
>
sorry , but you can not compare the PB's
it's not about the FS , but the device access

>>This is a problem I've seen a number of times on HPUX.  The OS disk is
>>
>you cannot extend / under HP-UX (they don't have initrd)
>
initrd ?
isn't that smth special for linux ?
the next version of LVM should work without initrd and EVMS works 
without initrd
the kernel should be able to activate the devices without additional 
binaries

>besides i don't see the difference with someone having / un one disk
>and /usr on another without LVM.
>
isn't it common for all *nix OSes that they have a small / with only the 
very essential libraries , binaries and conf's
and everything other goes to /usr 
