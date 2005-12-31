Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id jBVC4jws014179
	for <linux-lvm@redhat.com>; Sat, 31 Dec 2005 12:04:45 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EsfTZ-00052Z-9q
	for linux-lvm@redhat.com; Sat, 31 Dec 2005 12:04:45 +0000
Date: Sat, 31 Dec 2005 12:04:45 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] extended lv doesn't show correct size
Message-ID: <20051231120445.GB4661@agk.surrey.redhat.com>
References: <20051230231941.B976.WIVA@home.se>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20051230231941.B976.WIVA@home.se>
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

On Fri, Dec 30, 2005 at 11:32:02PM +0100, Willy Vanlid wrote:
> listed as 679.27 GB if I run lvmdiskscan is there anyway to fix this?

Run with -vv and look for a line:
    /dev/site/ftp: size is 
What does it say?

Alasdair
-- 
agk@redhat.com
