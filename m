Received: from [172.31.0.169] (vpn83-174.boston.redhat.com [172.16.83.174])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id k0522wor015519
	for <linux-lvm@redhat.com>; Wed, 4 Jan 2006 21:03:00 -0500
Message-ID: <43BC8208.90408@redhat.com>
Date: Thu, 05 Jan 2006 10:18:48 +0800
From: "Fang,Dongyu" <dfang@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] how to add a mirror to an existing logical volume
References: <43BBA46E.20409@redhat.com>
	<1136399042.20562.43.camel@hydrogen.msp.redhat.com>
In-Reply-To: <1136399042.20562.43.camel@hydrogen.msp.redhat.com>
Content-Type: multipart/mixed; boundary="------------020300000503040105080806"
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
--------------020300000503040105080806
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Oh,thanks.
But when I use `lvconvert -m 1 vg1/lv1a`, it responsed "Adding mirror 
images is not supported yet."

Jonathan Brassow wrote:

>When it's ready, it will be 'lvconvert'.
>
> brassow
>
>On Wed, 2006-01-04 at 18:33 +0800, dfang wrote:
>  
>
>>How to add a mirror to an existing logical volume?
>>Use lvcreate or lvextend?
>>Thanks.
>>                                                                         
>>      Fang,Dongyu
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@redhat.com
>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>    
>>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>  
>


--------------020300000503040105080806
Content-Type: text/x-vcard; charset=utf-8;
 name="dfang.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dfang.vcf"

begin:vcard
fn:Dongyu Fang
n:Fang;Dongyu
version:2.1
end:vcard


--------------020300000503040105080806--
