References: <de207689-775b-5c36-1443-e035f19ff65f@izyk.ru>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <06b65c62-8ca2-0d29-b98d-1a1585141f81@redhat.com>
Date: Fri, 19 Oct 2018 11:12:10 +0200
MIME-Version: 1.0
In-Reply-To: <de207689-775b-5c36-1443-e035f19ff65f@izyk.ru>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Why doesn't the lvmcache support the discard (trim)
	command?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Ilia Zykov <linux@izyk.ru>

Dne 19. 10. 18 v 0:56 Ilia Zykov napsal(a):
> Maybe it will be implemented later? But it seems to me a little strange when there is no way to clear the cache from a garbage.
> Maybe I do not understand? Can you please explain this behavior.
> For example:

Hi

Applying my brain logic here:

Cache (by default) operates on 32KB chunks.
SSD (usually) have the minimal size of trimable block as 512KB.

Conclusion can be there is non-trivial to even implement TRIM support for 
cache - as something would need to keep a secondary data structure which would 
keep the information about which all cached blocks are completely 
'unused/trimmed' and available from a 'complete block trim' (i.e. something 
like when ext4  implements 'fstrim' support.)

Second thought -  if there is a wish to completely 'erase' cache - there is 
very simple path by using 'lvconvert --uncache' - and once the cache is needed 
again, create cache again from scratch.

Note - dm-cache is SLOW moving cache - so it doesn't target acceleration 
one-time usage - i.e. if you read block just once from slow storage - it 
doesn't mean it will be immediately cached.

Dm-cache is about keeping info about used blocks on 'slow' storage (hdd) which 
typically does not support/implemnent TRIM. There could be possibly a 
multi-layer cache, where even the cached device can handle TRIM - but this 
kind on construct is not really support and it's even unclear if it would make 
any sense to introduce this concept ATM  (since there would need to be some 
well measurable benefit).

And final note - there is upcoming support for accelerating writes with new 
dm-writecache target.

Regards


Zdenek
