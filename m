Message-ID: <555ED047.3060402@redhat.com>
Date: Fri, 22 May 2015 08:44:23 +0200
From: Ondrej Kozina <okozina@redhat.com>
MIME-Version: 1.0
References: <20150521141955.70ebe714@leda.localdomain>	<555DF532.7050904@redhat.com>
	<20150521205734.58c3cbf4@leda.localdomain>
In-Reply-To: <20150521205734.58c3cbf4@leda.localdomain>
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
To: Christian Hesse <list@eworm.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 05/21/2015 08:57 PM, Christian Hesse wrote:
>
> However it looks like the issue is not in lvmetad itself but triggers one
> in lvm. lvmetad is running with pid 69, but I see a log entry about
> segmentation fault of pid 121:
>
> lvm[121]: segfault at 58 ip 00007f2f24197d20 sp 00007ffe3b499b18 error 4 in
> libc.so.6[7f2f24161000+1990000]
>
> Not sure what command lvm is running, though. Probably pvscan, no?
>

Yes, it's pvscan --background in non-systemd environment what segfaults. 
Thanks for the report! I'll notify you about patch when ready.

Regards
Ondrej
