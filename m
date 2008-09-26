Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8QEU3Rx014309
	for <linux-lvm@redhat.com>; Fri, 26 Sep 2008 10:30:03 -0400
Received: from qb-out-0506.google.com (qb-out-0506.google.com [72.14.204.230])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8QETjUl019011
	for <linux-lvm@redhat.com>; Fri, 26 Sep 2008 10:29:45 -0400
Received: by qb-out-0506.google.com with SMTP id c8so737903qbc.7
	for <linux-lvm@redhat.com>; Fri, 26 Sep 2008 07:29:45 -0700 (PDT)
Message-ID: <521877a70809260729y58a40b09re99fae1282714149@mail.gmail.com>
Date: Fri, 26 Sep 2008 16:29:44 +0200
From: daniele <klipperk@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_9738_3673635.1222439384701"
Subject: [linux-lvm] mirror legs order and priority (2)
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

------=_Part_9738_3673635.1222439384701
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Greetings everyone,
I have recently changed one of the mirrored-legs-hard-drives and substituted
it with a faster, bigger HD.
Now does it matter which leg is the first one?
I mean the home_mimage_0, right now is not on the fastest, and newer(thus
more reliable), hard drive. Does it matter? If so, is there a way to quick
switch it?
Anyway when I added the new HD to the mirror-legs, the first leg was chosen
to be on an old disk regardless of the order in which I provided
"/dev/mirror_disk1   /dev/mirror_disk2   /dev/mirror_log" to lvcovert -m1.
Also when I do lvconvert a mirrored LV to an m0 linear one, how can I choose
which of the legs has to become the linear LV? So far it seems that with
"lvconvert -m0 vg00/home" the 'first' leg, is automatically chosen to be the
one(which is home_mimage_0). (That might not be what one wants at times, and
pvmoving the linear LV after the lvconversion would be really a waste of
resources and disk efforts).

Thanks for any help or info on all this,
Best regards, Daniele.

------=_Part_9738_3673635.1222439384701
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div dir="ltr">Greetings everyone,<br>I have recently changed one of the mirrored-legs-hard-drives and substituted it with a faster, bigger HD.<br>Now does it matter which leg is the first one?<br>I
mean the home_mimage_0, right now is not on the fastest, and newer(thus
more reliable), hard drive. Does it matter? If so, is there a way to
quick switch it?<br>
Anyway when I added the new HD to the mirror-legs, the first leg was
chosen to be on an old disk regardless of the order in which I provided
&quot;/dev/mirror_disk1 &nbsp; /dev/mirror_disk2 &nbsp; /dev/mirror_log&quot; to lvcovert
-m1.<br>
Also when I do lvconvert a mirrored LV to an m0 linear one, how can I
choose which of the legs has to become the linear LV? So far it seems
that with &quot;lvconvert -m0 vg00/home&quot; the &#39;first&#39; leg, is automatically
chosen to be the one(which is home_mimage_0). (That might not be what
one wants at times, and pvmoving the linear LV after the lvconversion
would be really a waste of resources and disk efforts).<br>
<br>Thanks for any help or info on all this, <br>Best regards, Daniele.</div>

------=_Part_9738_3673635.1222439384701--
