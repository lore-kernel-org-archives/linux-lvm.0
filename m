Message-ID: <3BF331EB.3010301@st-peter.stw.uni-erlangen.de>
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgscan -- LVM driver/module not loaded?
References: <20011114152558.H9398@trabas.com> <20011114075148.B343@btconnect.com> <20011114162617.I9398@trabas.com> <20011114094009.A406@btconnect.com> <20011115100726.A18325@trabas.com>
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
Date: Wed Nov 14 21:08:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

>
>
>Sorry, I am lvm newbie.
>
>Where is lvm-1.0.1-rc-2.4.9.patch?
>
have you read the INSTALL and README's

in your case go to /tmp/LVM/1.0.1-rc4
run " ./configure "
go to /tmp/LVM/1.0.1-rc4/PATCHES
run " make "
" ls "
you have it

>
>[abu@yusril] /tmp/LVM/1.0.1-rc4 > find ./ -iname lvm-1*
>nothing
>
>lvm filename only lvm-0.8final-2.4.0.patch
>
>[abu@yusril] /tmp/LVM/1.0.1-rc4/PATCHES > ls
>fragments                          linux-2.4.1-VFS-lock.patch
>fragments-2.2.18                   linux-2.4.2-VFS-lock.patch
>fragments-2.4.0                    linux-2.4.4-VFS-lock.patch
>fragments-2.4.1                    linux-2.4.9-VFS-lock.patch
>fragments-2.4.7                    lvm-0.8final-2.4.0.patch
>linux-2.2.17-rawio.patch           Makefile
>linux-2.2.18-rawio.patch           Makefile.in
>linux-2.2.18-sparc64.patch         README
>linux-2.4.0-test10-VFS-lock.patch
>
>
>
>Joe Thornber(thornber@btconnect.com)@Wed, Nov 14, 2001 at 09:40:09AM +0000:
>
>>On Wed, Nov 14, 2001 at 04:26:17PM +0700, Abu @ Trabas Dot Com wrote:
>>
>>This is an extra patch that you only need if you're using reiserfs
>>with snapshots.  Read the README in PATCHES for instructions on how to
>>generate the real patch, which should be called something like
>>lvm-1.0.1-rc-2.4.9.patch
>>
>>- Joe
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@sistina.com
>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>>
>
