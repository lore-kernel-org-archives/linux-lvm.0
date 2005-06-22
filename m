Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5MDqBu18764
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 09:52:11 -0400
Received: from quantik.adsis.local (asi-87.asi256ip.easynet.fr [212.180.39.87])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5MDq5CJ018428
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 09:52:05 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by quantik.adsis.local (Postfix) with ESMTP id 7F722514F6E
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 15:51:53 +0200 (CEST)
Received: from quantik.adsis.local ([127.0.0.1])
	by localhost (quantik [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 26420-06 for <linux-lvm@redhat.com>;
	Wed, 22 Jun 2005 15:51:48 +0200 (CEST)
Received: from [192.168.0.101] (pc101.s000.adsis.local [192.168.0.101])
	by quantik.adsis.local (Postfix) with ESMTP id 2F0E34E75E9
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 15:51:47 +0200 (CEST)
Message-ID: <42B96CFF.9050505@adsis.fr>
Date: Wed, 22 Jun 2005 15:51:59 +0200
From: =?ISO-8859-1?Q?Gr=E9gory_Duchatelet?= <greg@adsis.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM is low
References: <42B6ECDB.8050100@adsis.fr> <42B95A45.1080308@adsis.fr>
	<42B96078.8090504@dsvr.net>
In-Reply-To: <42B96078.8090504@dsvr.net>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Jonathan Sambrook a �crit :

>Gr�gory Duchatelet wrote:
>  
>
>>Gr�gory Duchatelet a �crit :
>>
>>    
>>
>>>Hi list,
>>>
>>>I install a server with LVM partitions with ReiserFS, server runs
>>>OpenLDAP, Tomcat5, Apache2, Samba, etc....
>>>
>>>Comparing with native ReiserFS, LVM is really low
>>>      
>>>
>
>Could you try explaining "really low" some more?
>  
>
I copy lots of files with scp, from an old server to this new one with 
LVM. The system is unsuable during the copy, but not with a server with 
standards partitions...

-- 
Gr�gory Duchatelet <gregory@adsis.fr>
