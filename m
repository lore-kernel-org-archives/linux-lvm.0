Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7NHGGPu010581
	for <linux-lvm@redhat.com>; Wed, 23 Aug 2006 13:16:16 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7NHG4go012869
	for <linux-lvm@redhat.com>; Wed, 23 Aug 2006 13:16:05 -0400
Date: Wed, 23 Aug 2006 19:15:59 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Running LVM on shared lun's
Message-ID: <20060823171559.GF20318@percy.comedia.it>
References: <E1GDZE4-000PrC-00.sid_polak-mail-ru@f65.mail.ru>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1GDZE4-000PrC-00.sid_polak-mail-ru@f65.mail.ru>
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

On Thu, Aug 17, 2006 at 08:11:24AM +0400, Sid Polak wrote:
>Luca Berra wrote:
>> On Tue, Aug 08, 2006 at 09:23:04AM -0700, David Chan wrote:
>> > 
>> >Don't think LVM is cluster aware.  Doing so can potentially cause loss
>> >of LV's/data due to metadata corruption on the LVM level.  
>> LVM2 supports cluster locking, either using internal locking which works
>> with CMAN or GULM, or by using an external locking library that can be
>> customized to work with every cluster software that supports locking of
>>resources.
>
>And what about tags? Could I use hostname tag to activate LVs on one host OR
>another host which hostname is equal to the tag? That is not failover but
>it could reduce recovery time after the failure of one of the hosts. Isn't it?
>
yes.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
