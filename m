Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1GKJEO07443
	for <linux-lvm@redhat.com>; Wed, 16 Feb 2005 15:19:14 -0500
Received: from synflood.office.aol.com (h-64-236-128-14.nat.aol.com
	[64.236.128.14])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j1GKJ8U7014115
	for <linux-lvm@redhat.com>; Wed, 16 Feb 2005 15:19:08 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by synflood.office.aol.com (Postfix) with ESMTP id 840D548006
	for <linux-lvm@redhat.com>; Wed, 16 Feb 2005 15:19:02 -0500 (EST)
Message-ID: <4213AAB5.6090103@avondalenetworks.com>
Date: Wed, 16 Feb 2005 15:19:01 -0500
From: Jeff Bethke <jeff@avondalenetworks.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgscan changing/resetting perms?
References: <421392D6.4070405@avondalenetworks.com>
	<20050216191923.GD12420@zippy.toger.us>
In-Reply-To: <20050216191923.GD12420@zippy.toger.us>
Content-Type: multipart/alternative;
	boundary="------------080002010403020007020409"
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
--------------080002010403020007020409
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I totally agree for general purposes. However,  the users/app in 
question are Oracle/Sybase Databases writing directly to the devices.   

-jeff





Jason Martin wrote:

>On Wed, Feb 16, 2005 at 01:37:10PM -0500, Jeff Bethke wrote:
>  
>
>>Then I go ahead and reboot the host or someone comes along and runs a 
>>vgscan.  VOILA!  The perms for those files reset to root:root.   How do 
>>I prevent that from happeneing?  I want it so that I can make a device 
>>and set its perms to some user, and forget about it.   Is that even 
>>possible? If so, how? Or, what am I doing wrong in setting up the lv/vg's?
>>    
>>
>One generally doesn't let non-root users have direct access to
>devices. Instead you should format and mount the filesystems on
>those drives and give users access to that.
>
>-JM
>  
>
>------------------------------------------------------------------------
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>


--------------080002010403020007020409
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
  <title></title>
</head>
<body bgcolor="#ffffff" text="#000000">
I totally agree for general purposes. However,&nbsp; the users/app in
question are Oracle/Sybase Databases writing directly to the
devices.&nbsp;&nbsp;&nbsp; <br>
<br>
-jeff<br>
<br>
<br>
<br>
<br>
<br>
Jason Martin wrote:
<blockquote cite="mid20050216191923.GD12420@zippy.toger.us" type="cite">
  <pre wrap="">On Wed, Feb 16, 2005 at 01:37:10PM -0500, Jeff Bethke wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">Then I go ahead and reboot the host or someone comes along and runs a 
vgscan.  VOILA!  The perms for those files reset to root:root.   How do 
I prevent that from happeneing?  I want it so that I can make a device 
and set its perms to some user, and forget about it.   Is that even 
possible? If so, how? Or, what am I doing wrong in setting up the lv/vg's?
    </pre>
  </blockquote>
  <pre wrap=""><!---->One generally doesn't let non-root users have direct access to
devices. Instead you should format and mount the filesystems on
those drives and give users access to that.

-JM
  </pre>
  <pre wrap="">
<hr size="4" width="90%">
_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a></pre>
</blockquote>
<br>
</body>
</html>

--------------080002010403020007020409--
