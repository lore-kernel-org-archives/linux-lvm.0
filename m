Message-ID: <43BC82A8.2060408@redhat.com>
Date: Thu, 05 Jan 2006 10:21:28 +0800
From: "Fang,Dongyu" <dfang@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] how to add a mirror to an existing logical volume
References: <43BBA46E.20409@redhat.com>
	<1136399042.20562.43.camel@hydrogen.msp.redhat.com>
In-Reply-To: <1136399042.20562.43.camel@hydrogen.msp.redhat.com>
Content-Type: multipart/mixed; boundary="------------030900050600010008010506"
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
Cc: yshao@redhat.com

This is a multi-part message in MIME format.
--------------030900050600010008010506
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Oh,thanks.
But when I use `lvconvert -m 1 vg1/lv1a`, it responsed "Adding mirror 
images is not supported yet."
Is there another way to do it?
Thanks.
    Fang,Dongyu

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


--------------030900050600010008010506
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


--------------030900050600010008010506--
