Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9H8N6lB008343
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 04:23:06 -0400
Received: from postman.formosahost.com (postman.formosahost.com [203.190.4.19])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9H8MwVX014752
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 04:22:59 -0400
Received: from localhost (localhost [127.0.0.1])
	by postman.formosahost.com (Postfix) with ESMTP id E40918A25D
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 16:19:43 +0800 (CST)
Received: from postman.formosahost.com ([127.0.0.1])
	by localhost (postman.formosahost.com [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id dfFbqSdpHANo for <linux-lvm@redhat.com>;
	Wed, 17 Oct 2007 16:19:28 +0800 (CST)
Received: from [192.168.0.98] (unknown [203.190.4.13])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by postman.formosahost.com (Postfix) with ESMTP id 7D77D8A243
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 16:19:28 +0800 (CST)
Message-ID: <4715C6E9.4000703@ezpear.com>
Date: Wed, 17 Oct 2007 16:25:13 +0800
From: Hans <hans@ezpear.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] stupid question about lvm/lvm2/clvm
References: <4715A86F.40504@ezpear.com> <4715C511.3050400@redhat.com>
In-Reply-To: <4715C511.3050400@redhat.com>
Content-Type: multipart/alternative;
	boundary="------------080106000501040400070006"
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------080106000501040400070006
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Thanks. Openfiler uses rPath linux.
Is it any way that I can check if lvm is configured with clvm?
Maybe it should be listed in lvm formats?

Regards,
Hans

Patrick Caulfield wrote:
> Hans wrote:
>   
>> Hi!
>> I want build cluster. I couldn't decide about which system use OCFS2 or
>> GFS2.
>> I was looking for some information about clvm.
>> On redhat website I found some tarball with clvm toolset but called lvm2...
>> Does it mean that clvm=lvm2? Or clvm is special extension to lvm2, not
>> identical with lvm2.
>>     
>
> The source tarball for lvm2 includes clvmd too. Enable it at compile-time time using
> ./configure --with-clvmd
>
> If you're using RPMs then the cluster LVM one is called lvm2-cluster
>
>   
>> I use openfiler (installed lvm2-2.02.14). Does it include clvm ext.?
>>
>>
>>     
>
>
>   


--------------080106000501040400070006
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
</head>
<body bgcolor="#ffffff" text="#000000">
Thanks. Openfiler uses rPath linux. <br>
Is it any way that I can check if lvm is configured with clvm?<br>
Maybe it should be listed in lvm formats?<br>
<br>
Regards,<br>
Hans<br>
<br>
Patrick Caulfield wrote:
<blockquote cite="mid:4715C511.3050400@redhat.com" type="cite">
  <pre wrap="">Hans wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">Hi!
I want build cluster. I couldn't decide about which system use OCFS2 or
GFS2.
I was looking for some information about clvm.
On redhat website I found some tarball with clvm toolset but called lvm2...
Does it mean that clvm=lvm2? Or clvm is special extension to lvm2, not
identical with lvm2.
    </pre>
  </blockquote>
  <pre wrap=""><!---->
The source tarball for lvm2 includes clvmd too. Enable it at compile-time time using
./configure --with-clvmd

If you're using RPMs then the cluster LVM one is called lvm2-cluster

  </pre>
  <blockquote type="cite">
    <pre wrap="">I use openfiler (installed lvm2-2.02.14). Does it include clvm ext.?


    </pre>
  </blockquote>
  <pre wrap=""><!---->

  </pre>
</blockquote>
<br>
</body>
</html>

--------------080106000501040400070006--
