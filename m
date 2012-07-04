Message-ID: <4FF42E37.50009@redhat.com>
Date: Wed, 04 Jul 2012 13:51:19 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <4FEEE5E5.5060800@redhat.com>
	<alpine.LSU.2.00.1206301217590.1728@eggly.anvils>
	<4FEF66C4.20001@redhat.com>
	<alpine.LSU.2.00.1206301541280.1919@eggly.anvils>
	<4FF04950.30503@redhat.com>
	<alpine.LSU.2.00.1207011112250.1799@eggly.anvils>
	<4FF0AEA9.3090900@redhat.com> <4FF0C91B.8050700@redhat.com>
	<20120702133308.GB785@redhat.com>
In-Reply-To: <20120702133308.GB785@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Regression with FALLOC_FL_PUNCH_HOLE in 3.5-rc
	kernel
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: amwang@redhat.com, Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org, Joe Thornber <ejt@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>, Lukas Czerner <lczerner@redhat.com>, Alasdair G Kergon <agk@redhat.com>

Dne 2.7.2012 15:33, Mike Snitzer napsal(a):
> Not sure why you're testing such old kernels without regard for fixes
> (likely just a hopeful bisect?).
>
> In any case, you definitely need this commit (was also marked for
> stable): 0c535e0 v3.3-rc7 dm io: fix discard support
>
>

After some more crashed filesystems here is the outcome with trial patch from 
Mikulas included:


https://bugzilla.redhat.com/show_bug.cgi?id=837607


Zdenek
