Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k58JqLjZ012693
	for <linux-lvm@redhat.com>; Thu, 8 Jun 2006 15:52:21 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k58JqJh0027436
	for <linux-lvm@redhat.com>; Thu, 8 Jun 2006 15:52:19 -0400
Date: Thu, 8 Jun 2006 21:52:18 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] lvm and duplicates...
Message-ID: <20060608195218.GE548@percy.comedia.it>
References: <5485940d0606071038h7c823b7do58e95a486618d643@mail.gmail.com>
	<20060608055232.GD18061@percy.comedia.it>
	<5485940d0606080248m7302a044n2c3a8440d5dfc28e@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5485940d0606080248m7302a044n2c3a8440d5dfc28e@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Jun 08, 2006 at 10:48:40AM +0100, C'est Pierre wrote:
>Hello Luca
>
>On 6/8/06, Luca Berra <bluca@comedia.it> wrote:
>>On Wed, Jun 07, 2006 at 06:38:49PM +0100, C'est Pierre wrote:
>> >Greetings,
>> >
>> >I'm trying to setup a cluster with ServiceGuard but I am going through
>> >a lot of hassles doing so. I did a mistake initially by trying to
>> >pvcreate the 2 luns of the same physical disk from our storage (fiber
>> >channel) and now, while trying to create a new logical volume, I get
>> >this weird error, for the record the sda and sdb are the 2 luns coming
>> >from different paths (cards):
>> >
>>you posted before about multipathing,
>>and you got one answer.
>>what did you do for the multipathing issue you had?
>
>
>You're right about that. We tried the multipathing, but suddenly one
>of the nodes fc card, stopped working and we need to make a couple of
>tests before our trial version of the clustering software expires, as
>such, we need to fix the LVM problem before we get into the multipath
>subject, which will only happen once HP replaces our FC card

but you just said that sda and sdb are the same disk seen from two
different paths?

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
