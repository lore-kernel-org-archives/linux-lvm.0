Message-ID: <3F844939.9020301@webhackande.se>
From: Rickard Olsson <richie@webhackande.se>
MIME-Version: 1.0
Subject: Re: [linux-lvm] removing a bad HD
References: <20031004210122.S14777@crusaders.no> <3F8105B3.1040506@webhackande.se> <20031007175710.B25658@crusaders.no> <3F83BB32.7060308@webhackande.se> <20031008180800.G3836@crusaders.no>
In-Reply-To: <20031008180800.G3836@crusaders.no>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Oct  8 12:30:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Trond Michelsen wrote:

> Yeah, it occured to me that this was probably the best opportunity I had
> to increase the PE-size. So I set it to 32MB, giving me a maximum
> LV-size of 2TB. 

"That should be enough for anyone." ;-)

> BTW: What are the effects of choosing a large PE-size? Apart from
> getting larger LV's, of course? Does it effect performance or memory
> usage at all?

None that I have noticed. Then again, my main fileserver gets something 
like 1% load average and 10% mem usage (unless I'm shuffling large files 
locally, the gigabit adapter and Samba's buffers eat both up pretty 
quickly). Pulling notions out of my ass, I'd guess that larger PE-sizes 
are better now than they were before since most disks have larger 
buffers, our boxes have more RAM and Moore's law is seldom broken.

Heinz, is this the reasoning behind upping the default PE size or were 
there other considerations?

     / Rickard Olsson,IT-Konsult/
    / Telefon: +46 70 635 01 42/
   / http://www.webhackande.se/
