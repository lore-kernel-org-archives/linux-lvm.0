Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1HIrn4B002834
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2015 13:53:49 -0500
Received: from mail.gathman.org (50-248-53-218-static.hfc.comcastbusiness.net
	[50.248.53.218] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1HIrlMg015129
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2015 13:53:48 -0500
Received: from elissa.gathman.org (elissa.gathman.org
	[IPv6:2001:470:8:809:11::1009]) (authenticated bits=0)
	by mail.gathman.org (8.14.4/8.14.4) with ESMTP id t1HIrgsT027170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2015 13:53:44 -0500
Message-ID: <54E38E38.6040506@gathman.org>
Date: Tue, 17 Feb 2015 13:53:44 -0500
From: Stuart Gathman <stuart@gathman.org>
MIME-Version: 1.0
References: <848E1BB85A9C4FB5A91BC299FEB36775@black>
In-Reply-To: <848E1BB85A9C4FB5A91BC299FEB36775@black>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Confusing error: No space left on device
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

On 02/17/2015 11:20 AM, Jason Pyeron wrote:
> This is likely a problem between keyboard and chair, but it has got me confused all the same.
>
> I was having issues with rsync, so I switched to dd and the same problem persists.
>
> Any suggestions?
>
> History says "lvcreate --size 8589934592b --name ciphershed-dmz-http vg_five66
"No space left on device" is a filesystem error.   This happens to me 
occasionally when the /dev/... path does not actually exist for various 
reasons, and the output is going into the root filesystem instead.

In your case, the "varying reason" is rsync.  Rsync removes 
/dev/vg_five66/ciphershed-dmz-http, and creates a regular file - which 
it proceeds to fill with data from your source lv until running out of 
space in your root fs.  When you removed and recreated the LV, this 
removed the rsync handiwork and your subsequent dd worked again.  But 
when you ran rsync again - bye bye link to LV device node.

There is a patch to rsync for copying devices nodes - but the /dev/... 
pathnames are often symlinks.
There are utilities for copying block devices with rsync protocol - I 
have a python script that I have used around somewhere, but I can't put 
my fingers on it at the moment.
