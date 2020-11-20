Received: from localhost.localdomain (ovpn-117-193.rdu2.redhat.com
	[10.10.117.193])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3474A5D6AD
	for <linux-lvm@redhat.com>; Fri, 20 Nov 2020 11:14:36 +0000 (UTC)
Date: Fri, 20 Nov 2020 11:14:33 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
Message-ID: <20201120111433.GI1787072@localhost.localdomain>
References: <CAMaziXuSe+YncMw622UAeGp_3DKtoCuz-US1yh6+tkrmDyQ4=g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMaziXuSe+YncMw622UAeGp_3DKtoCuz-US1yh6+tkrmDyQ4=g@mail.gmail.com>
Subject: Re: [linux-lvm] Unusually long boot times with LVM Snapshots
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Nov 19, 2020 at 07:46:21PM +0530, Sreyan Chakravarty wrote:
> I use LVM with full disk encryption. I also use LVM snapshots, currently I
> have a 70GB snapshot.

What type of snapshot are you using? LVM2 allows either "classic" CoW snaps,
or the newer thin provisioned snapshots using the dm-thinp target.

Classic snapshots are known to have very poor IO performance when multiple
snapshots of the same volume exist simultaneously (especially for write-
heavy workloads).

Thin provisioned snapshots are not normally activated at boot time unless
they are explicitly requested (via dracut's rd.lvm.lv options) since they
have the skip activation flag set by default.

> I boot my machine, enter my encryption passphrase and then wait for about 3
> minutes. It is only after that long wait does my machine boot.
> 
> This only happens if snapshots are present, if no snapshots are present,
> boot is almost instantaneous after I enter my passphrase.

Is there any indication in the log of what's happening during the delay?
Look through the journalctl output to see if there are any messages logged
while the delay happens.

Another option is to use systemd-analyze to look into where the time is
going during boot. It has various commands including "plot" which will
generate an SVG plot of the boot timings on stdout. You can then compare
that with a regular boot to try to understand the difference.

Regards,
Bryn.
