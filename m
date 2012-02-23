Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q1NGlpkI007310
	for <linux-lvm@redhat.com>; Thu, 23 Feb 2012 11:47:51 -0500
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1NGloE6021606
	for <linux-lvm@redhat.com>; Thu, 23 Feb 2012 11:47:51 -0500
Received: from [10.0.2.103]
	(r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net [74.192.17.33])
	by www.bettercgi.com (Postfix) with ESMTPSA id 5475520E31
	for <linux-lvm@redhat.com>; Thu, 23 Feb 2012 10:47:48 -0600 (CST)
References: <20120221102932.19eb3218@bettercgi.com>
	<CAOAgVpyfEApbLRFr1-s6UvAsa8yO0MSOcYDgPWXBv2FRoD+Ntg@mail.gmail.com>
In-Reply-To: <CAOAgVpyfEApbLRFr1-s6UvAsa8yO0MSOcYDgPWXBv2FRoD+Ntg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----48PUJLUCIKM5LG7PX6AE5DBHSGX1R5"
From: Ray Morris <support@bettercgi.com>
Date: Thu, 23 Feb 2012 10:46:19 -0600
Message-ID: <5dd15783-9200-4ed0-b746-32a812210f77@email.android.com>
Subject: Re: [linux-lvm] mirror_region_size default: 4096 six times faster
	than 512?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

------48PUJLUCIKM5LG7PX6AE5DBHSGX1R5
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit

512 byte sector consumer SATA drives from Seagate and Hitachi. Drives attached to a 9560 RAID card exhibited more difference than drives in a different system attached to the motherboard directly. As I mentioned, I haven't done extensive or highly scientific testing, but in general, across various hardware using various software, copying chinks of a few MBs seems to always beat copying bytes or KB per chunk.

-- 
Sent from my Android phone with K-9 Mail. Please excuse my brevity.

Les Mikesell <lesmikesell@gmail.com> wrote:

On Tue, Feb 21, 2012 at 10:29 AM, Ray Morris <support@bettercgi.com> wrote:


If 4096 is OFTEN several times faster than 512, would it make sense
to consider canging the default?


What disks are underneath this?  One of the new 4k sector types?

-- 
   Les Mikesell
    lesmikesell@gmail.com


------48PUJLUCIKM5LG7PX6AE5DBHSGX1R5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html><head><meta content="text/html; charset=utf-8" http-equiv="Content-Type"></head>512  byte sector consumer SATA drives from Seagate and Hitachi.  Drives attached to a 9560 RAID card exhibited more difference than drives in a different system attached to the motherboard directly.  As I mentioned, I haven&#39;t done extensive or highly scientific testing, but in general, across various hardware using various software, copying chinks of a few MBs seems to always beat copying bytes or KB per chunk.<br>
<br>
-- <br>
Sent from my Android phone with K-9 Mail. Please excuse my brevity.<br><br><div class="gmail_quote">Les Mikesell &lt;lesmikesell@gmail.com&gt; wrote:<blockquote class="gmail_quote" style="margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<div class="gmail_quote">On Tue, Feb 21, 2012 at 10:29 AM, Ray Morris <span dir="ltr">&lt;<a href="mailto:support@bettercgi.com">support@bettercgi.com</a>&gt;</span> wrote:<br><blockquote class="gmail_quote" style="margin:0pt 0pt 0pt 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
If 4096 is OFTEN several times faster than 512, would it make sense<br>
to consider canging the default?<br></blockquote></div><br>What disks are underneath this?  One of the new 4k sector types?<br><br>-- <br>   Les Mikesell<br>    <a href="mailto:lesmikesell@gmail.com">lesmikesell@gmail.com</a><br>
<br>
</blockquote></div></html>
------48PUJLUCIKM5LG7PX6AE5DBHSGX1R5--
