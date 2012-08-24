Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q7O6WtMg027457
	for <linux-lvm@redhat.com>; Fri, 24 Aug 2012 02:32:55 -0400
Received: from mail1.gosport.uk.corp.abpni.net (edge1.gosport.uk.abpni.net
	[109.200.19.114])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7O6WqSJ029353
	for <linux-lvm@redhat.com>; Fri, 24 Aug 2012 02:32:52 -0400
Received: from localhost (mail1.gosport.corp.uk.abpni.net [127.0.0.1])
	by mail1.gosport.uk.corp.abpni.net (Postfix) with ESMTP id A51D75A0006
	for <linux-lvm@redhat.com>; Fri, 24 Aug 2012 07:32:27 +0100 (BST)
Received: from mail1.gosport.uk.corp.abpni.net ([127.0.0.1])
	by localhost (mail1.mail.gosport.corp.uk.abpni.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 7BDwcstdRto4 for <linux-lvm@redhat.com>;
	Fri, 24 Aug 2012 07:32:27 +0100 (BST)
Received: from Jonathans-MacBook-Air.local (unknown [10.87.0.109])
	by mail1.gosport.uk.corp.abpni.net (Postfix) with ESMTPSA id
	2213C5A0005
	for <linux-lvm@redhat.com>; Fri, 24 Aug 2012 07:32:27 +0100 (BST)
Message-ID: <50372014.3000306@abpni.co.uk>
Date: Fri, 24 Aug 2012 07:32:52 +0100
From: Jonathan Tripathy <jonnyt@abpni.co.uk>
MIME-Version: 1.0
References: <CAGQjrKZju5zQA9_cGtO+n0WRe2t6ZSJB+SKfr23+JJ3YzntgUQ@mail.gmail.com>
	<CAGQjrKYZw27r=xgB2DaBtap-jQ1oi-7_Ydw=3z+2kw4s_03hAA@mail.gmail.com>
	<39598.78.154.109.125.1345731038.squirrel@yellowside.org.uk>
	<CAGQjrKbLD0bwedMGQP58BzdyFsnACdXLiziHLbw=tStAhX4BsA@mail.gmail.com>
In-Reply-To: <CAGQjrKbLD0bwedMGQP58BzdyFsnACdXLiziHLbw=tStAhX4BsA@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------070903060404050904060101"
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
--------------070903060404050904060101
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 23/08/2012 16:18, tariq wali wrote:
>  lvresize to extend an lvm ? how
It's the same syntax as lvextend.
>
> also I cant create a new lvm don't have that much space and the to 
> extend the new one and it would mean downtime . don't think it's an 
> issue with filesystem tools , lvm has NEVER been consistent in my case .
Can you please provide details on why you don't think it's a filesystem 
issue? Have you come across other details that lead you to believe this? 
These details may help the list in helping you. While I may be over 
simplifying things, all LVM is, is a fancy block mapper. Most 
complicated things are done by the filesystem on top.

--------------070903060404050904060101
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 23/08/2012 16:18, tariq wali wrote:<br>
    </div>
    <blockquote
cite="mid:CAGQjrKbLD0bwedMGQP58BzdyFsnACdXLiziHLbw=tStAhX4BsA@mail.gmail.com"
      type="cite">
      <div dir="ltr"><span class="Apple-style-span"
style="color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">&nbsp;lvresize
          to extend an lvm ? how <br>
        </span></div>
    </blockquote>
    It's the same syntax as lvextend.<br>
    <blockquote
cite="mid:CAGQjrKbLD0bwedMGQP58BzdyFsnACdXLiziHLbw=tStAhX4BsA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div><font class="Apple-style-span" color="#222222" face="arial,
            sans-serif"><br>
          </font></div>
        <div><font class="Apple-style-span" color="#222222" face="arial,
            sans-serif">also I cant create a new lvm don't have that
            much space and the to extend the new one and it would mean
            downtime . don't think it's an issue with filesystem tools ,
            lvm has NEVER been consistent in my case .<br>
          </font></div>
      </div>
    </blockquote>
    Can you please provide details on why you don't think it's a
    filesystem issue? Have you come across other details that lead you
    to believe this? These details may help the list in helping you.
    While I may be over simplifying things, all LVM is, is a fancy block
    mapper. Most complicated things are done by the filesystem on top.<br>
  </body>
</html>

--------------070903060404050904060101--
