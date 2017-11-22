MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 22 Nov 2017 11:15:12 +0100
From: Xen <list@xenhideout.nl>
In-Reply-To: <2d536c8d-ca83-1c6e-ce83-9a73302b677b@redhat.com>
References: <3c2aefc590d9dc46c5b366437bab30bd@xenhideout.nl>
	<2d536c8d-ca83-1c6e-ce83-9a73302b677b@redhat.com>
Message-ID: <f4617ae4ec55c2b9cf1e3bd0079ed20a@xenhideout.nl>
Subject: Re: [linux-lvm] Reattach cache
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Zdenek Kabelac schreef op 22-11-2017 10:57:

> In your case - just destroy the cache (--uncache) and do not try to
> reuse cache-pool unless you really know what you are doing.

But I still don't know how to clean the metadata manually.
