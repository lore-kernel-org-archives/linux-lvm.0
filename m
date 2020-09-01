Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BAC2A9EFA
	for <linux-lvm@redhat.com>; Tue,  1 Sep 2020 09:09:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD01487EF9B
	for <linux-lvm@redhat.com>; Tue,  1 Sep 2020 09:09:40 +0000 (UTC)
References: <1598544320-3198-1-git-send-email-heming.zhao@suse.com>
	<128df0c3-beeb-7f8a-e611-e1372185209c@redhat.com>
	<20200828182608.GA17233@redhat.com>
	<4cce4f81-24b6-3730-a331-8b31cf57cd51@suse.com>
	<20200831223724.GB15486@redhat.com>
From: "heming.zhao" <heming.zhao@suse.com>
Message-ID: <c1796ea2-dcdb-230f-16f7-1d8acf470ed9@suse.com>
Date: Tue, 1 Sep 2020 17:09:23 +0800
In-Reply-To: <20200831223724.GB15486@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
To: David Teigland <teigland@redhat.com>
Cc: linux-lvm@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>

On 9/1/20 6:37 AM, David Teigland wrote:
> On Sun, Aug 30, 2020 at 11:49:38PM +0800, heming.zhao@suse.com wrote:
>> in my opinion, the 'not available'
> 
> We already use the word available/unavailable in other ways, so let's use
> "broken" for the moment, maybe we can find a better word.
> 
> 'lvs -o broken' would report 0|1.  Choosing an attr letter to represent
> that is not as important and can be decided on later.
> 
'broken' is acceptable and good word.
I'm only afraid end user don't know there is a new string item for lvs.
like me, I just know the lv_health_status string item from Zdenek's mail. (sorry for my stupid)

>> means the LV can't correctly do r/w io.
>>
>> for raid, if the missing or breaking underlying devs number beyond raid level limit. the
>> 'not available' shoud be display.
>>
>> for linear, any one of underlying dev is missing, upper layer module like fs may don't work
>> (e.g. missing first disk, fs will missing w/r first disk's super-block metadata). the
>> 'not available' should be display.
> 
> That definition of "broken" could be a specific enough, if we can report
> it accurately enough.  Do we need to say "io will succeed on the entire LV
> (as far as lvm knows)"?  It would be nice to know in which cases lvm can
> report it accurately, and in which cases lvm doesn't know enough to report
> it accurately.  If it's not correct in many cases, then we should consider
> a different definition (maybe raid-specific.)
> 
I prefer lvm report status from the entire LV side.
lvm provides virtual blocks to upper layer softwares, most of softwares use whole virtual disk.
there must have some scenarios which lvm doesn't know LV status accurately.

there is example about lvm doesn't know LV status. (it's very like other modules bug not lvm problem)
if removing one of raidX sub-disks then do re-insert, the lvs will report LV work normally.
But from my env, I saw the re-inserted disk major:minor was changed. The device-mapper table still
keep old major:minor mapping, LV r/w io will send no-exist disk and trigger r/w error.
So if we want to report LV status accurately, the code should do a lot of works, like verifying DM table
mapping, verifying underlying devs, verifying raid level limit, ...

>> for other type LV, I don't have too much experience to answer this question.
> 
> Any LV not using raid (or mirror) will be equivalant to linear, and be
> broken if a single disk is missing or broken.
> 
> Dave
> 
