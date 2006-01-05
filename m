Message-ID: <43BCE669.8050702@redhat.com>
Date: Thu, 05 Jan 2006 17:27:05 +0800
From: "Fang,Dongyu" <dfang@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Use lvcreart -m to make a mirror
References: <43BC8CF9.1080901@redhat.com> <43BCDC23.9010100@redhat.com>
In-Reply-To: <43BCDC23.9010100@redhat.com>
Content-Type: multipart/mixed; boundary="------------070608030800070406020401"
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
--------------070608030800070406020401
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Thanks your replay.
How can I mount the "original" (mimage_0) or the "mirror" (mimage_1) 
single?
Because I want to verify it write/read data in both LV indeed.
And how can I remove the mirror relation between the two LV(let the 
"original" and "mirror" become two singe LV)?   (I use `lvconvert -m 0 
vg1/mirror1`  then LVs become one.)
    Fang,Dongyu

Patrick Caulfield wrote:

>Fang,Dongyu wrote:
>  
>
>>When I use `lvcreate -l 4 --mirrors 1 -n mirror1 /dev/vg1` want to
>>create  mirror LV, I got four LV:
>> ACTIVE            '/dev/vg1/mirror1' [16.00 MB] inherit
>> ACTIVE            '/dev/vg1/mirror1_mlog' [4.00 MB] inherit
>> ACTIVE            '/dev/vg1/mirror1_mimage_0' [16.00 MB] inherit
>> ACTIVE            '/dev/vg1/mirror1_mimage_1' [16.00 MB] inherit
>>I think the LV mirror1 is the origin LV, mirror1_mlog is log, the two
>>others should be images LV, so why there are two images(in my opinion,
>>it should be only one), and I how to use then? Can I mount it?
>>    
>>
>
>/dev/vg1/mirror1 is the device you mount, the _mimage_ are internal devices
>for LVM. You have the "original" (mimage_0) and the mirror (mimage_1).
>
>The later revisions of LVM will hide these from the lvscan & lvs commands.
>  
>


--------------070608030800070406020401
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


--------------070608030800070406020401--
