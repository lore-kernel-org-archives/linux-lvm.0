References: <20190419193036.GA24986@chatter.i7.local>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <9916e4a1-5c72-f30c-a58b-0542816d7158@redhat.com>
Date: Tue, 23 Apr 2019 12:20:13 +0200
MIME-Version: 1.0
In-Reply-To: <20190419193036.GA24986@chatter.i7.local>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Network-attached block storage and local SSDs for
	dm-cache
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>

Dne 19. 04. 19 v 21:30 Konstantin Ryabitsev napsal(a):
> Hi, all:
> 
> I know it's possible to set up dm-cache to combine network-attached block 
> devices and local SSDs, but I'm having a hard time finding any first-hand 
> evidence of this being done anywhere -- so I'm wondering if it's because there 
> are reasons why this is a Bad Idea, or merely because there aren't many 
> reasons for folks to do that.
> 
> The reason why I'm trying to do it, in particular, is for mirrors.kernel.org 
> systems where we already rely on dm-cache to combine large slow spinning disks 
> with SSDs to a great advantage. Most hits on those systems are to the same set 
> of files (latest distro package updates), so dm-cache hit-to-miss ratio is 
> very advantageous. However, we need to build newest iterations of those 
> systems, and being able to use network-attached storage at providers like 
> Packet with local SSD drives would remove the need for us to purchase and host 
> huge drive arrays.
> 
> Thanks for any insights you may offer.


Hi

 From lvm2 POV - if you put both devices into single VG - you should be able 
to easily configure the setup in a way, that your 'main/origin' LV sitting on 
network storage and  cache is setup to be located on SSD.

lvcreate -LMAXSIZE --name MYLV vg  /dev/networkshdd
lvcreate --cache -Lcachesize  vg/MYLV  /dev/ssd

But of course as Mike points out - cache currently expects the origin device 
is reliable one.

Regards

Zdenek
