Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3M5J3p28292
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 01:19:03 -0400
Received: from sbo-dom1.corp.storability.com ([67.99.78.198])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i3M5J2Fe026912
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 01:19:03 -0400
MIME-Version: 1.0
From: praveen.morab@storability.com
Message-ID: <OFEE74D699.0EF86CAA-ON65256E7E.001CD3DA-65256E7E.001DD464@corp.storability.com>
Date: Thu, 22 Apr 2004 10:54:07 +0530
Content-Type: multipart/alternative;
	boundary="=_alternative 001DD12B65256E7E_="
Subject: [linux-lvm] Does PE Size affect block size?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multipart message in MIME format.
--=_alternative 001DD12B65256E7E_=
Content-Type: text/plain; charset="us-ascii"

Hi All,

I have a very simple query. Currently I have one volume group "Volume00" 
with PE Size of "4MB", the default one and one logical volume "LogVol00". 
So what will be the block size of LogVol00.


int main()
{

        int i = 1 << 20 ------- BytesInOneMB 
        i = i * 4 ------- PE Size

        printf("%d\n", i);

        return 0;
}
 i --- will be the block size. 

So my query is.....is the above code to get block size is right. Its just 
a prototype.

-Regards,

-------------------------------------------------------------------------
Praveen Morab
Storability Software Inc
Ph - 91 20 4014488 x 117 (O)
Ph - 91 20 2543 13 65 (R)
-------------------------------------------------------------------------


--=_alternative 001DD12B65256E7E_=
Content-Type: text/html; charset="us-ascii"


<br><font size=2 face="sans-serif">Hi All,</font>
<br>
<br><font size=2 face="sans-serif">I have a very simple query. Currently I have one volume group &quot;Volume00&quot; with PE Size of &quot;4MB&quot;, the default one and one logical volume &quot;LogVol00&quot;. So what will be the block size of LogVol00.</font>
<br>
<br>
<br><font size=2 face="sans-serif">int main()</font>
<br><font size=2 face="sans-serif">{</font>
<br>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; int i = 1 &lt;&lt; 20 ------- BytesInOneMB </font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; i = i * 4 ------- PE Size</font>
<br>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; printf(&quot;%d\n&quot;, i);</font>
<br>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; return 0;</font>
<br><font size=2 face="sans-serif">}</font>
<br><font size=2 face="sans-serif">&nbsp;i --- will be the block size. </font>
<br>
<br><font size=2 face="sans-serif">So my query is.....is the above code to get block size is right. Its just a prototype.</font>
<br>
<br><font size=2 face="sans-serif">-Regards,</font>
<br>
<br><font size=2 face="sans-serif">-------------------------------------------------------------------------<br>
Praveen Morab<br>
Storability Software Inc<br>
Ph - 91 20 4014488 x 117 (O)<br>
Ph - 91 20 2543 13 65 (R)<br>
-------------------------------------------------------------------------<br>
<br>
</font>
--=_alternative 001DD12B65256E7E_=--
