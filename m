Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBFIKjnk026487
	for <linux-lvm@redhat.com>; Fri, 15 Dec 2006 18:20:45 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GvHfp-0006ze-Dt
	for linux-lvm@redhat.com; Fri, 15 Dec 2006 18:20:45 +0000
Date: Fri, 15 Dec 2006 18:20:45 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvconvert and create mirror for root fs
Message-ID: <20061215182045.GA26819@agk.surrey.redhat.com>
References: <d0438a1f0612150836x55199571x14d815c78a7b4a11@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d0438a1f0612150836x55199571x14d815c78a7b4a11@mail.gmail.com>
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

On Fri, Dec 15, 2006 at 05:36:13PM +0100, a a wrote:
> rename("/etc/lvm/metadata/vg00.tmp", "/etc/lvm/metadata/vg00") = 0

> Can you tell me where is problem?

You keep your metadata on a filesystem mounted on the volume concerned?
That can never work.  See doc/example.conf.

    # List of directories holding live copies of text format metadata.
    # These directories must not be on logical volumes!

Alasdair
-- 
agk@redhat.com
