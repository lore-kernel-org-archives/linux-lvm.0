Received: from [10.34.131.216] (dhcp131-216.brq.redhat.com [10.34.131.216])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u438YMFX004216
	for <linux-lvm@redhat.com>; Tue, 3 May 2016 04:34:23 -0400
References: <8B2E34D671F53945B041A44D66D79E6EAABD77@P-EXMB5-DC21.corp.sgi.com>
	<57273419.3000102@suse.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5728628E.5090404@redhat.com>
Date: Tue, 3 May 2016 10:34:22 +0200
MIME-Version: 1.0
In-Reply-To: <57273419.3000102@suse.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM feature parity with MD
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 2.5.2016 13:03, Fabian Herschel wrote:
> Can LVM doing a delta sync and does LVM have something like a bitamp to show
> which parts are in sync and which needs a sync?
>

Hi

lvm uses small metadata LV with each raid1 leg - which holds the bitmap about 
individual regionsize areas in sync.

So when there is 'crash' only async areas are synced again after array restart.

Regards

Zdenek
