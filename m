Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i69EeQhp025832
	for <linux-lvm@redhat.com>; Fri, 9 Jul 2004 15:40:26 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1BiwY6-0003WZ-4z
	for linux-lvm@redhat.com; Fri, 09 Jul 2004 15:40:26 +0100
Date: Fri, 9 Jul 2004 15:40:26 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] vgscan eating memory
Message-ID: <20040709144026.GX30186@agk.surrey.redhat.com>
References: <40EE5E61.5070702@smartlink.ee>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40EE5E61.5070702@smartlink.ee>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Jul 09, 2004 at 11:59:13AM +0300, Tarmo Samuel wrote:
> lvm2-2.00.15
 
> Problem: lvm vgscan runs, eats up more and more memory until it gets 
> OOM-killed.

I've seen a similar bug in the past, but that one got fixed.
 
(1) Please reproduce with the latest LVM2 release (2.00.20)

(2) Also reproduce after building with configure --disable-o_direct

(3) Then send standard lvm2 diagnostics: turn on debug logging to file 
    in lvm.conf, run vgscan, and send me (not the list) the 
    (compressed) output.   [If it's big, you can truncate it from
    where it starts repeating itself.]

  log {
        file="/tmp/lvm2.log"
        level=7
  }

>  Reading all physical volumes.  This may take a while...
>  Ignoring additional label on /dev/hda11 at sector 1

That suggests you've somehow got more than one LVM2 label on /dev/hda11:
the debug output may give more details.
[Or send me the first 2k of the device.]

What's the history of LVM commands affecting that device?
(eg created with an old LVM2 pvcreate or/and the current one,
or with the --labelsector option?  dd onto it? vgcreate/extend?
adjusted partition table?)

Alasdair
-- 
agk@redhat.com
