Received: from localhost (vpn1-5-217.ams2.redhat.com [10.36.5.217])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3PDnjbq007360
	for <linux-lvm@redhat.com>; Mon, 25 Apr 2016 09:49:46 -0400
Date: Mon, 25 Apr 2016 14:49:48 +0100
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20160425134947.GA8148@rh-vpn>
References: <4b0d651386c11fdb2808a9f4bb88fc36@dds.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4b0d651386c11fdb2808a9f4bb88fc36@dds.nl>
Subject: Re: [linux-lvm] is lvmcache really ready?
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

On Sat, Apr 23, 2016 at 04:50:01PM +0000, Xen wrote:
> The reason I'm wanting to use it at this point is to speed up
> booting (although unimportant) but mostly to make a more snappy
> system while running, ie. for instance just application startup.

I doubt it'll speed up booting, which occurs infrequently so dm-cache
will not have reason to promote those blocks above others.

- Joe
