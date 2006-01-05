Message-ID: <43BC8CF9.1080901@redhat.com>
Date: Thu, 05 Jan 2006 11:05:29 +0800
From: "Fang,Dongyu" <dfang@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------050606030809030006090008"
Subject: [linux-lvm] Use lvcreart -m to make a mirror
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
--------------050606030809030006090008
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

When I use `lvcreate -l 4 --mirrors 1 -n mirror1 /dev/vg1` want to 
create  mirror LV, I got four LV:
  ACTIVE            '/dev/vg1/mirror1' [16.00 MB] inherit
  ACTIVE            '/dev/vg1/mirror1_mlog' [4.00 MB] inherit
  ACTIVE            '/dev/vg1/mirror1_mimage_0' [16.00 MB] inherit
  ACTIVE            '/dev/vg1/mirror1_mimage_1' [16.00 MB] inherit
I think the LV mirror1 is the origin LV, mirror1_mlog is log, the two 
others should be images LV, so why there are two images(in my opinion, 
it should be only one), and I how to use then? Can I mount it?
Thanks.
    Fang,Dongyu

--------------050606030809030006090008
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


--------------050606030809030006090008--
