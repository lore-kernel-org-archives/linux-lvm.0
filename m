Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q7OBuV4P022300
	for <linux-lvm@redhat.com>; Fri, 24 Aug 2012 07:56:31 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7OBuUto009409
	for <linux-lvm@redhat.com>; Fri, 24 Aug 2012 07:56:30 -0400
Received: from silver.gathman.org ([IPv6:2001:470:8:809:31ae:ec89:c863:9b37])
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id q7OBtZSr015370
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 24 Aug 2012 07:56:29 -0400
Message-ID: <50376BB7.7010008@bmsi.com>
Date: Fri, 24 Aug 2012 07:55:35 -0400
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <CAGQjrKZju5zQA9_cGtO+n0WRe2t6ZSJB+SKfr23+JJ3YzntgUQ@mail.gmail.com>
	<CAGQjrKYZw27r=xgB2DaBtap-jQ1oi-7_Ydw=3z+2kw4s_03hAA@mail.gmail.com>
	<39598.78.154.109.125.1345731038.squirrel@yellowside.org.uk>
	<CAGQjrKbLD0bwedMGQP58BzdyFsnACdXLiziHLbw=tStAhX4BsA@mail.gmail.com>
In-Reply-To: <CAGQjrKbLD0bwedMGQP58BzdyFsnACdXLiziHLbw=tStAhX4BsA@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------090701030004080407020705"
Subject: Re: [linux-lvm] lvextend NEVER works but screws up
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------090701030004080407020705
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/23/2012 11:18 AM, tariq wali wrote:
>  lvresize to extend an lvm ? how
>
> also I cant create a new lvm don't have that much space and the to 
> extend the new one and it would mean downtime . don't think it's an 
> issue with filesystem tools , lvm has NEVER been consistent in my case .
>
The resize2fs on RHEL5 does not support ext4.  Your error message is the 
one reported when you try to resize an ext4 filesystem with ext2/ext3 
tools.  You need to either install e4fsprogrs and use resize4fs (and 
e4fsck), or do the resize in the virtual machine you are apparently 
running a newer OS in.

--------------090701030004080407020705
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 08/23/2012 11:18 AM, tariq wali
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAGQjrKbLD0bwedMGQP58BzdyFsnACdXLiziHLbw=tStAhX4BsA@mail.gmail.com"
      type="cite">
      <div dir="ltr"><span class="Apple-style-span"
style="color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">&nbsp;lvresize
          to extend an lvm ? how&nbsp;</span>
        <div><font class="Apple-style-span" color="#222222" face="arial,
            sans-serif"><br>
          </font></div>
        <div><font class="Apple-style-span" color="#222222" face="arial,
            sans-serif">also I cant create a new lvm don't have that
            much space and the to extend the new one and it would mean
            downtime . don't think it's an issue with filesystem tools ,
            lvm has NEVER been consistent in my case .<br>
          </font><br>
        </div>
      </div>
    </blockquote>
    The resize2fs on RHEL5 does not support ext4.&nbsp; Your error message is
    the one reported when you try to resize an ext4 filesystem with
    ext2/ext3 tools.&nbsp; You need to either install e4fsprogrs and use
    resize4fs (and e4fsck), or do the resize in the virtual machine you
    are apparently running a newer OS in.<br>
  </body>
</html>

--------------090701030004080407020705--
