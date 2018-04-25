Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 474FA10F1BF1
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2018 15:00:58 +0000 (UTC)
Date: Wed, 25 Apr 2018 10:00:56 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20180425150056.GA29775@redhat.com>
References: <CABZYMH6KQhrnONfFxO0ky0O=nFHzJqP1ibLaOy-vxQ_yNkqfNg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABZYMH6KQhrnONfFxO0ky0O=nFHzJqP1ibLaOy-vxQ_yNkqfNg@mail.gmail.com>
Subject: Re: [linux-lvm] [lvmlockd] Reload configuration while lvmlockd and
 sanlock running
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

> afaik we can't restart lvmlockd or sanlock without side effects -- all
> locks must be released before sanlock shutdown, and if wdmd enabled,
> the host maybe reboot after a while...
> 
> So if there any way to reload configuration of sanlock and lvmlockd? I
> don't want to reboot my host...

Deactivate LVs in shared VGs, stop the shared VGs (vgchange --lockstop),
stop lvmlockd, stop sanlock, stop wdmd, make config changes, then start
everything again.  Dave
