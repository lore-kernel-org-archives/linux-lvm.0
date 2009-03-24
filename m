Received: from jeltz.chrissie.net (vpn-10-228.str.redhat.com [10.32.10.228])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n2OBnsNh025957
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 07:49:55 -0400
Message-ID: <49C8C8E1.9060707@redhat.com>
Date: Tue, 24 Mar 2009 11:49:53 +0000
From: Chrissie Caulfield <ccaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Signal handling in clvmd
References: <1cafab770903231005x4bb8b64cmc0919cac9190d8bc@mail.gmail.com>
In-Reply-To: <1cafab770903231005x4bb8b64cmc0919cac9190d8bc@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Xinwei Hu wrote:
> Hi all,
> 
>   I'm running into a problem that clvmd sometimes take a long time to shutdown.
> The clvmd itself is waiting for select to timeout in main_loop. But
> since the SIGINT
> (or SIGTERM) is handled in other threads, select is not interrupted as expected.
> 
>   The attached patch tries to mask SIGINT and SIGTERM in all other threads,
> to make sure the signal is properly handled in the main_loop. This
> helps to reduce
> the chance that we are waiting meaninglessly.
> 
>   Would you please kindly review the patch ?

Thank you,

That patch looks good and I've committed it into CVS.

Chrissie
