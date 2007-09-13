Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8DD8mHj015657
	for <linux-lvm@redhat.com>; Thu, 13 Sep 2007 09:08:48 -0400
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l8DD8eRV019151
	for <linux-lvm@redhat.com>; Thu, 13 Sep 2007 09:08:41 -0400
Message-ID: <46E93628.3060902@wpkg.org>
Date: Thu, 13 Sep 2007 15:07:52 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Q: Online resizing ext3 FS
References: <20070912163621.1f951876@slopi> <46E7FE32.7010404@wpkg.org>
	<87ejh2n2kk.fsf@informatik.uni-tuebingen.de>
In-Reply-To: <87ejh2n2kk.fsf@informatik.uni-tuebingen.de>
Content-Transfer-Encoding: 7bit
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
To: Goswin von Brederlow <brederlo@informatik.uni-tuebingen.de>
Cc: linux-raid@vger.kernel.org, LVM general discussion and development <linux-lvm@redhat.com>

Goswin von Brederlow schrieb:
> Tomasz Chmielewski <mangoo@wpkg.org> writes:

(...)

>> Yes, I tried to online resize a similar filesystem (600 MB to 1.2 TB)
>> and it didn't work.
>>
>> At some point, resize2fs would just exit with errors.
>> I tried to do it several times before I figured out what's missing;
>> sometimes, I interrupted the process with ctrl+c. No data loss
>> occurred.
>>
>> To do an online ext3 resize, the filesystem needs a "resize_inode"
>> feature. You can check the features with dumpe2fs:
> 
> So was that what you were missing or did some other error occur?
> 
> I tried to resize an fs without resize_inode and it just plain told me
> and abrted.

It was working for some time (15 or 30 minutes?), the fs grew a couple 
of gigabytes, and then it exited with an error. At first I thought it's 
because the fs might need fsck, but after I did fsck, it didn't help - 
next online tries didn't increase the fs anymore.


-- 
Tomasz Chmielewski
http://wpkg.org
