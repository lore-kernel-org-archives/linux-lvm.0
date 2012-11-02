Message-ID: <5093AC7B.6060902@redhat.com>
Date: Fri, 02 Nov 2012 12:20:27 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <73698D91-B8D4-4F52-ABF3-54542ACB0690@active.ee>
	<5093A260.8000906@redhat.com>
	<71E4DE75-6510-4E4E-B31F-CAEF0CF36771@active.ee>
In-Reply-To: <71E4DE75-6510-4E4E-B31F-CAEF0CF36771@active.ee>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] strange usage stats for thin LV
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
To: Andres Toomsalu <andres@active.ee>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 2.11.2012 11:46, Andres Toomsalu napsal(a):
> Thanks a lot for a detailed explanation - now everything fits into places :)
>
> Some answers:
>
> 1) Filesystem in use is ext4 at all cases
> 2) Im not using discard option as Im not very aware how to use it  - is it a filesystem mount option for fstab?
> 3) OS is CentOS 6.3 with RHEL OpenVZ patched kernel (2.6.32-042stab061.2 #1 SMP Fri Aug 24 09:07:21 MSK 2012 x86_64 x86_64 x86_64 GNU/Linux)
>

So check for  'fstrim' command - it's usage is quite simple, and should be 
already pretty matured tool.

i.e. you could run it once a week in cron.

Zdenek
