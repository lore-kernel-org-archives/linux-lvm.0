Message-ID: <555DF532.7050904@redhat.com>
Date: Thu, 21 May 2015 17:09:38 +0200
From: Ondrej Kozina <okozina@redhat.com>
MIME-Version: 1.0
References: <20150521141955.70ebe714@leda.localdomain>
In-Reply-To: <20150521141955.70ebe714@leda.localdomain>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] autoactivation fails
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: list@eworm.de
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi Christian,

On 05/21/2015 02:19 PM, Christian Hesse wrote:
> Hello everybody,
>
> with recent lvm2 I had problems booting an Arch Linux system with non-systemd
> initramfs. lvmetad is launched, but volumes are not activated. A git bisect
> reported this bad commit:
> commit fe30658a4d5fe4e4e6bb346c9c9ee7142a98f49d
> Author: Ondrej Kozina <okozina@redhat.com>

I would like to ask you for more information about the issue. First, 
have you managed to collect any error messages during the init phase 
where it's supposed to fail?

The thing about that particular commit is it could possibly break 
background polling, but I don't see (yet) how it could have damaged the 
activation code. Have you tried to reboot a system where any operation 
like: pvmove, lvconvert --merge or lvconvert mirror conversion was in 
progress in background before you rebooted the system by any chance?

Second step would be to unmute the eventual background processes spawned 
during activation. To do it just uncomment

// #define DEBUG_CHILD

in tools/toollib.c:76 lvm2 sources and rebuild.

This should expose all error messages from within the forked off 
processes. Also, if you could perhaps give me some hints how to get the 
Arch Linux in the same state as when you experienced the issue it would 
help us as well.

Regards
Ondrej
