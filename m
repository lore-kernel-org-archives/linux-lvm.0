Received: from [10.36.6.49] (vpn1-6-49.ams2.redhat.com [10.36.6.49])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o1A8MNZv007291
	for <linux-lvm@redhat.com>; Wed, 10 Feb 2010 03:22:24 -0500
Message-ID: <4B726CBF.8090403@redhat.com>
Date: Wed, 10 Feb 2010 08:22:23 +0000
From: Christine Caulfield <ccaulfie@redhat.com>
MIME-Version: 1.0
References: <4B725455.1010109@tlinx.org>
In-Reply-To: <4B725455.1010109@tlinx.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvextend docmentation vs. implementation
 (lvm2-2.02.39), Suse-11.1
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
To: linux-lvm@redhat.com

On 10/02/10 06:38, Linda A. Walsh wrote:
> I have been trying to use the lvextend command using the documented
> size format: of +[number][%{LV|PV|VG|FREE}] --
> specifically
> +50%LV.
>
> tried multiple variations on LV -- no luck. Is this broken or
> is this just not working in my setup, or am I doing something
> wrong? It fails with:
> Invalid argument +5%LV
> Error during parsing of command line.
>
>
The %age features are part of the -l switch, so the command line would 
be something like:

# lvextend -l30%VG storage/lvol0

That worked for ma anyway. If it still doesn't work your LVM tools might 
be too old

Chrissie
