Received: from [10.10.48.218] (vpn-48-218.rdu2.redhat.com [10.10.48.218])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5KGRI5b022005
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2016 12:27:18 -0400
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <575CAE9A.1060001@gmail.com>
Date: Mon, 20 Jun 2016 11:27:17 -0500
Message-Id: <9FC91B62-47F1-49D7-A346-153211D4D207@redhat.com>
References: <575CAE9A.1060001@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM cache/dm-cache questions.
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>


> On Jun 11, 2016, at 7:36 PM, sergei <sergei.franco@gmail.com> wrote:
> 
> Hi,
> 
> I have a few simple questions regarding relatively new feature LVM cache/dm-cache.
> 
> From second hand information on internet, it appears that you cannot resize cached volume.
> Please correct me if I am wrong: to resize a cached volume, one needs to lvremove the cache, resize and recreate the cache?

This is true at the moment.  You are likely to be able to simply resize online in the future.

> In scenario where cache device fails, how safe is the data on the cached LVM?

If you are using writethrough, quite safe.  If you are using ‘writeback’, probably not (RAID for your cache in this case would probably be wise).

> Is it possible to make snapshots of the cached device?

easy answer is “no”.

complicated answer includes a ‘yes’.  You can cache a poolDataLV, then your thinLV and all its thinSnaps would be cached.

 brassow
