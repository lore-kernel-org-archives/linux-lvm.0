Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j21EwoZc014136
	for <linux-lvm@redhat.com>; Tue, 1 Mar 2005 14:58:50 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1D68pm-0006sz-4y
	for linux-lvm@redhat.com; Tue, 01 Mar 2005 14:58:50 +0000
Date: Tue, 1 Mar 2005 14:58:50 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Having duplicate PV problems,
	think there's a bug in LVM2 md component detection
Message-ID: <20050301145850.GA26421@agk.surrey.redhat.com>
References: <002101c51c41$f6bcfdc0$32dcdc0a@vanish>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <002101c51c41$f6bcfdc0$32dcdc0a@vanish>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
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

On Sat, Feb 26, 2005 at 03:30:08PM -0500, Ron Watkins wrote:
> I'm running Debian Unstable, using kernel 2.6.8-2-k7.   I HAVE set 
> md_component_detection to 1 in lvm.conf, and I wiped the drives after 
> changing this setting.
 
>  Found duplicate PV y8pYTtAg0W703Sc8Wiy79mcWU3gHmCFc: using /dev/sde not 
> /dev/hda
>  Found duplicate PV y8pYTtAg0W703Sc8Wiy79mcWU3gHmCFc: using /dev/sde not 
> /dev/hda

> It seems to think that /dev/hda is where the PV is, rather than /dev/md0.
> (Note, again, I *HAVE* turned the md_component_detection to 1 in lvm.conf!!)
 
Add verbose flags:
  vgscan -vvvv
and post a URL to the output.
Add in your configuration: lvm.conf, pvs -av plus full details of your md 
configuration (eg various mdadm options).

Alasdair
-- 
agk@redhat.com
