References: <3c2aefc590d9dc46c5b366437bab30bd@xenhideout.nl>
	<2d536c8d-ca83-1c6e-ce83-9a73302b677b@redhat.com>
	<f4617ae4ec55c2b9cf1e3bd0079ed20a@xenhideout.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <199baa98-ad7d-efc6-786d-75cf780188c1@redhat.com>
Date: Wed, 22 Nov 2017 12:03:16 +0100
MIME-Version: 1.0
In-Reply-To: <f4617ae4ec55c2b9cf1e3bd0079ed20a@xenhideout.nl>
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
To: Xen <list@xenhideout.nl>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 22.11.2017 v 11:15 Xen napsal(a):
> Zdenek Kabelac schreef op 22-11-2017 10:57:
> 
>> In your case - just destroy the cache (--uncache) and do not try to
>> reuse cache-pool unless you really know what you are doing.
> 
> But I still don't know how to clean the metadata manually.


Just drop/lvremove the cache-pool and create the new one again.
There is no specific 'zeroing' metadata command.

And as said - newer tool will ZERO by default and you need to pass -Zn to 
avoid zeroing (in case you want to reattach same cache-pool to unused data - 
but as said you need to be skilled user knowing what you are doing for this 
use case)

Zdenek
