Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l216ej81013261
	for <linux-lvm@redhat.com>; Thu, 1 Mar 2007 01:40:46 -0500
Received: from nz-out-0506.google.com (nz-out-0506.google.com [64.233.162.233])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l216eiwC004114
	for <linux-lvm@redhat.com>; Thu, 1 Mar 2007 01:40:44 -0500
Received: by nz-out-0506.google.com with SMTP id s18so419636nze
	for <linux-lvm@redhat.com>; Wed, 28 Feb 2007 22:40:44 -0800 (PST)
Message-ID: <5d25729a0702281530h61b6dc27rc6e4acb780d70ca9@mail.gmail.com>
Date: Wed, 28 Feb 2007 18:30:47 -0500
From: "Nick Gyma" <nickgyma@gmail.com>
Subject: Re: [linux-lvm] Help: Mount point does not report full size of LV.
In-Reply-To: <859a78260702281043u179acc69g21cd1df894820e3f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_51892_7665200.1172705447811"
References: <5d25729a0702281007p381e10fas464177acaa614dc2@mail.gmail.com>
	<859a78260702281043u179acc69g21cd1df894820e3f@mail.gmail.com>
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

------=_Part_51892_7665200.1172705447811
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

you know what.  i think that was the final step i just missed.  funny
because i was following the guide on the mythtv site.
thanks for helping me out guys.

for those following along:
i unmounted the path, it had me run "sudo e2fsck -f /dev/VGforMyth/video"
first, then i ran "sudo resize2fs -p /dev/VGforMyth/video", then remounted
it to /home/nick/video

it now shows up as 194.4GB under the file browser, which i guess is right
even though VGforMyth shows up as 208.31GB?

thanks again...

------=_Part_51892_7665200.1172705447811
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

you know what.&nbsp; i think that was the final step i just missed.&nbsp; funny because i was following the guide on the mythtv site.<br>thanks for helping me out guys.&nbsp; <br><br>for those following along:<br>i unmounted the path, it had me run &quot;sudo e2fsck -f /dev/VGforMyth/video&quot; first, then i ran &quot;sudo resize2fs -p /dev/VGforMyth/video&quot;, then remounted it to /home/nick/video
<br><br>it now shows up as 194.4GB under the file browser, which i guess is right even though VGforMyth shows up as 208.31GB? <br><br>thanks again...<br><br><br>

------=_Part_51892_7665200.1172705447811--
