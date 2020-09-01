References: <1598544320-3198-1-git-send-email-heming.zhao@suse.com>
	<128df0c3-beeb-7f8a-e611-e1372185209c@redhat.com>
	<20200828182608.GA17233@redhat.com>
	<4cce4f81-24b6-3730-a331-8b31cf57cd51@suse.com>
	<20200831223724.GB15486@redhat.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <d44e29ef-13ad-8218-ee50-ba992d7c0200@redhat.com>
Date: Tue, 1 Sep 2020 13:43:42 +0200
MIME-Version: 1.0
In-Reply-To: <20200831223724.GB15486@redhat.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH] lib/metadata: add new api lv_is_available()
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
To: LVM general discussion and development <linux-lvm@redhat.com>, David Teigland <teigland@redhat.com>, "heming.zhao@suse.com" <heming.zhao@suse.com>
Cc: Zdenek Kabelac <zkabelac@redhat.com>

Dne 01. 09. 20 v 0:37 David Teigland napsal(a):
> On Sun, Aug 30, 2020 at 11:49:38PM +0800, heming.zhao@suse.com wrote:
>> in my opinion, the 'not available'
> 
> We already use the word available/unavailable in other ways, so let's use
> "broken" for the moment, maybe we can find a better word.
> 
> 'lvs -o broken' would report 0|1.  Choosing an attr letter to represent
> that is not as important and can be decided on later.

I'd probably pick the 'opposite' word - i.e.  lvs -o lv_usable -

but ATM - I'm still no sure how the meaning would differ from  'partial'
(which seems like it"s still missing separate lvs attribute shown only through 
health attr column 9 letter).

But we probably need to look much deeper look at the meaning of partial -
which ATM is a simply transitivity enclosure over LV stack - while 
particularly in raid case we need to probably go deeper and device into
categories.

This would also greatly help the current activation logic as well - but we 
probably need to first acknowledge what is 'preferred' view from md raid side 
- as these do not have an exact match.

Zdenek
