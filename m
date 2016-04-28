Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3SMbRSP028188
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2016 18:37:28 -0400
Received: from smtp1.dds.nl (smtpgw.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D5DE464062
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2016 22:37:25 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 0CEAF7FC5E
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2016 00:37:23 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 29 Apr 2016 00:37:23 +0200
From: Xen <list@xenhideout.nl>
Message-ID: <75be777705b8abc643a67ca9b90d7b1b@dds.nl>
Subject: [linux-lvm] about the lying nature of thin
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
To: Linux lvm <linux-lvm@redhat.com>

You know mr. Patton made the interesting allusion that thin provisioning 
is designed to lie and is meant to lie, and I beg to differ.

Under normal operating conditions any thin volume should be allowed to 
grow to its maximum V-size provided not everyone is doing that at the 
same time.


There is nowhere in the thin contract something that says "this space I 
have available to you, you don't have to share it".

That is like saying the basement container room used as bike and motor 
space in my apartment complex is a like because if I were to fill it up, 
other people couldn't use it again anymore.

The visuals clearly indicate available physical space, but I know that 
if I use it, others won't be able to. It's called sharing.

In practical matters a thin volume only starts to lie when "real space" 
< "virtual space" -- a condition you are normally trying to avoid.

So I would not even say that by definition a thin volume or thin volume 
manager lies.

It only starts "lying" the moment real available space goes below 
virtual available space, something you would normally be trying to 
avoid.

Since your guarantee to your customers (for instance) is that this space 
IS going to be available, you're actually lying to them by not informing 
them of the condition that this guarantee can not actually be met in 
some instance of time.

Thin pools do not lie by default. They lie when they cannot fulfill 
their obligations, and this is precisely the reason for the idea I 
suggested: to stop the lie, to be honest.

It was said (by Marek Podmaka) that you don't want customers / users to 
know about the reality behind the thin pool, in some or many use cases 
(liberally interpreted). That there are use cases where you don't want 
the client to know about the thin nature.

But if you don't do your job right and the thin pool does start to fill 
up, that starts to sound like lying to your client and saying 
"everything is all right" while behind the scenes everyone is in 
calamity mode.

"Is something wrong? No no, not@all".

You're usually aware that you're being lied to ;-) if you are talking to 
a real human.

So basically:
* either you do your job right and nothing is the matter
* you don't do your job right but you don't tell anyone
* you don't do your job right and you own up.

Saying that thin pools habitually lie is not right. The question is not 
what happens or what you do while the system is functioning as intended. 
The question is what you do when that is no longer the case:

* do you inform the guest system?
* do you keep silent until shit breaks loose?

IF you had an autoextend mechanism present you could also equally well 
decide to not "inform" clients as long as that was the case. After all, 
if you have automatic extending configured and it is operational, then 
the "real size" is actually larger than what you currently have.

In that case "virtual size < real size" does not hold or does not 
happen, and there is no need to communicate anything. This is also a 
question about ethics, perhaps.

Personally I like to be informed. I don't know what you do or want.

But I can think of any number of analogies or life situations where I 
would definitely choose to be informed instead of being lied to.

Thin LVM does not lie by default. It may only start to lie when 
conditions are no longer met.

Regards, Xen.
