Received: from reti (vpn50-14.rdu.redhat.com [172.16.50.14])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i1IH5Dxn015260
	for <linux-lvm@redhat.com>; Wed, 18 Feb 2004 17:05:14 GMT
Received: from joe by reti with local (Exim 4.30)
	id 1AtVBD-0002xu-57
	for linux-lvm@redhat.com; Wed, 18 Feb 2004 17:08:11 +0000
From: Joe Thornber <thornber@redhat.com>
Subject: Re: [linux-lvm] LVM2: vgscan is long...
Message-ID: <20040218170811.GX27549@reti>
References: <1077122257.2134.12.camel@xeyrus>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1077122257.2134.12.camel@xeyrus>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Feb 18 12:05:19 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wed, Feb 18, 2004 at 11:37:38AM -0500, Daniel Ch?nard wrote:
> So, 3m41.19 for a vgscan is too long for me.  Anybody could help me to
> reduce this time??

If you are using 2.6 you could try the latest LVM2 tools from CVS.
There is a filter that uses sysfs to speed up vgscan (took a 35 second
scan to 2 seconds on my system).

- Joe
