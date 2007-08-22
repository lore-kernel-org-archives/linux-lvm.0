Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7MBRGt3025176
	for <linux-lvm@redhat.com>; Wed, 22 Aug 2007 07:27:16 -0400
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l7MBRE7p013362
	for <linux-lvm@redhat.com>; Wed, 22 Aug 2007 07:27:14 -0400
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id 2ECEC557A6
	for <linux-lvm@redhat.com>; Wed, 22 Aug 2007 13:27:06 +0200 (CEST)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 6D29593CF
	for <linux-lvm@redhat.com>; Wed, 22 Aug 2007 13:27:05 +0200 (CEST)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id k7RqogaWxwpW for <linux-lvm@redhat.com>;
	Wed, 22 Aug 2007 13:27:00 +0200 (CEST)
Received: from [192.168.10.145] (xdsl-87-78-249-217.netcologne.de
	[87.78.249.217]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Wed, 22 Aug 2007 13:26:59 +0200 (CEST)
Message-ID: <46CC1D82.3010005@wpkg.org>
Date: Wed, 22 Aug 2007 13:26:58 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] performance of dm-crypt devices?
References: <46CC18C9.400@wpkg.org>
In-Reply-To: <46CC18C9.400@wpkg.org>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Tomasz Chmielewski schrieb:
> I just set up an encrypted LUKS device using the information on 
> http://www.saout.de/tikiwiki/tiki-index.php?page=EncryptedDeviceUsingLUKS

Ouch, I guess there is a better list for such questions, like 
dm-crypt... Sorry for noise.
Will repost it there.


-- 
Tomasz Chmielewski
http://wpkg.org
