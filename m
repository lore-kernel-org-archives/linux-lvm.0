Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E041813499
	for <linux-lvm@redhat.com>; Wed, 18 Nov 2020 18:23:01 +0000 (UTC)
Date: Wed, 18 Nov 2020 12:23:00 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20201118182300.GB28264@redhat.com>
References: <3e4cbb06-6428-45f2-0b42-d7dc5abdfc81@suse.com>
	<20201117161725.GB18257@redhat.com>
	<ad12a987-adaf-db99-2b3a-200a47fc25db@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ad12a987-adaf-db99-2b3a-200a47fc25db@suse.com>
Subject: Re: [linux-lvm] discussion about
 activation/auto_activation_volume_list
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

On Wed, Nov 18, 2020 at 09:28:21AM +0800, Gang He wrote:
> I prefer to use a metadata flag for each VG or LV to skip auto-activation.
> Otherwise, it is not easy for the pacemaker cluster to manager a local
> VG(e.g. local or systemid type) in a cluster via active-passive mode.

I created a bug for this:
https://bugzilla.redhat.com/show_bug.cgi?id=1899214

Dave
