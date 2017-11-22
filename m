References: <3c2aefc590d9dc46c5b366437bab30bd@xenhideout.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <2d536c8d-ca83-1c6e-ce83-9a73302b677b@redhat.com>
Date: Wed, 22 Nov 2017 10:57:57 +0100
MIME-Version: 1.0
In-Reply-To: <3c2aefc590d9dc46c5b366437bab30bd@xenhideout.nl>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Xen <list@xenhideout.nl>

Dne 22.11.2017 v 09:55 Xen napsal(a):
> Ehm,
> 
> When you split a cache and later reattach it, LVM ensures it is in a 
> consistent state right?
> 
> LVM is a bit old, I mean Ubuntu 16.04 version, so something about 133.


Hi

Sorry but version 133 is really ancient - the original purpose of 'cache' 
--splitcache was rather more debug oriented.

Clearing of cache-pool metadata when cache-pool is reattached to another LV 
goes with version 2.02.162 - so your version is way too old...

In your case - just destroy the cache (--uncache) and do not try to reuse 
cache-pool unless you really know what you are doing.

Regards

Zdenek
