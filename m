Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mASL9VF1019862
	for <linux-lvm@redhat.com>; Fri, 28 Nov 2008 16:09:31 -0500
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.184])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mASL9JaA011944
	for <linux-lvm@redhat.com>; Fri, 28 Nov 2008 16:09:20 -0500
Received: by nf-out-0910.google.com with SMTP id d3so856547nfc.21
	for <linux-lvm@redhat.com>; Fri, 28 Nov 2008 13:09:19 -0800 (PST)
Message-ID: <614f37be0811281309gb115861yea65f65979e48951@mail.gmail.com>
Date: Fri, 28 Nov 2008 16:09:19 -0500
From: "Gary Desrochers" <garybrenda@comcast.net>
Sender: garyfdes@gmail.com
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_52440_2071523.1227906559460"
Subject: [linux-lvm] Let's try again with the lvm mirror failure.
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
To: linux-lvm@redhat.com

------=_Part_52440_2071523.1227906559460
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I will try one more time. Can someone please tell me if it is possible to
recover a mirrored drive?  If not then why are so many people using mirrors
out there?

In a previous message posted to the forums I said:

> I had a disk failure for my lvm mirror.  It was between two disks.  This
was a failure of the primary.
>
> I have been trying to recover the mirror but I cannot find directions as
to what to do.
>
> Seems like if I create a new partition, give it the old uuid and then try
to load everything I get superblock errors.
>
> So how do you fix up from a crashed primary mirror?

As a second question, I know the extents and such.  Is there a way to copy
off the data into a non-lvm partition?  At this point I will even take that.
 I just want to get to the data.

Gary

------=_Part_52440_2071523.1227906559460
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<span style="font-family:&#39;Times New Roman&#39;;font-size:16px"><div>I will try one more time. Can someone please tell me if it is possible to recover a mirrored drive? &nbsp;If not then why are so many people using mirrors out there?</div>
<div><br></div><div>In a previous message posted to the forums I said:</div><div><br></div>&gt; I had a disk failure for my lvm mirror.&nbsp; It was between two disks.&nbsp; This was a failure of the primary.<br>&gt;&nbsp;<br>&gt; I have been trying to recover the mirror but I cannot find directions as to what to do.<br>

&gt;&nbsp;<br>&gt; Seems like if I create a new partition, give it the old uuid and then try to load everything I get superblock errors.<br>&gt;&nbsp;<br>&gt; So how do you fix up from a crashed primary mirror?</span><br>
<div><br></div><div><span class="Apple-style-span" style="font-family: &#39;Times New Roman&#39;; font-size: 16px;">As a second question, I know the extents and such. &nbsp;Is there a way to copy off the data into a non-lvm partition? &nbsp;At this point I will even take that. &nbsp;I just want to get to the data.</span></div>
<div><span class="Apple-style-span" style="font-family: &#39;Times New Roman&#39;; font-size: 16px;"><br></span></div><div><span class="Apple-style-span" style="font-family: &#39;Times New Roman&#39;; font-size: 16px;">Gary</span></div>

------=_Part_52440_2071523.1227906559460--
