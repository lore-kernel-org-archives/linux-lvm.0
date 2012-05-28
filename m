Date: Mon, 28 May 2012 19:22:13 +0200 (CEST)
From: Fredrik Tolf <fredrik@dolda2000.com>
In-Reply-To: <4FC39524.6010800@redhat.com>
Message-ID: <alpine.DEB.2.02.1205281919020.2644@shack.dolda2000.com>
References: <alpine.DEB.2.02.1205281619370.2644@shack.dolda2000.com>
	<4FC39524.6010800@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Isolation of volume groups
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "Bryn M. Reeves" <bmr@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 28 May 2012, Bryn M. Reeves wrote:
> On 05/28/2012 03:33 PM, Fredrik Tolf wrote:
>> May 28 14:51:38 nerv kernel: [29911.468028] Filesystem "dm-33":
>> xfs_log_force: error 5 returned.

I think I must apologize. "dm-33" actually turns out to be the XFS 
filesystem that was on datvol, so I probably misinterpreted the symptoms 
altogether. The only remaing issue, then, should be that the ravol 
filesystems froze in periods, but that might be attributable to the high 
sync load caused by syslog constantly receiving messages from ReiserFS 
(I've noticed that XFS displays notoriously bad performance when syncing).

There probably never was a problem, then, so I'm sorry for the noise.

--

Fredrik Tolf
